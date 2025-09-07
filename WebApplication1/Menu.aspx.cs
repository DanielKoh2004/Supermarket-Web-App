using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1
{
    public partial class Menu : System.Web.UI.Page
    {
        // Connection string for database access
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        // Page load event handler
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only load menu items on first page load, not on postbacks
            if (!IsPostBack)
            {
                LoadMenuItems(); // Load all items first time
            }
        }

        // Search button click event handler
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Get search keyword from textbox
            string keyword = txtSearch.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // SQL query to search items by name (contains keyword)
                string query = "SELECT ItemID, ItemName, Category, UnitPrice, StockQuantity, ImageFile FROM Item WHERE ItemName LIKE @Keyword";

                // Create data adapter and set parameter for LIKE search
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@Keyword", "%" + keyword + "%");

                // Fill DataTable with results
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Bind results to repeater for display
                rptMenu.DataSource = dt;
                rptMenu.DataBind();
            }
        }

        protected void imgCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ShoppingCart.aspx");
        }

        // Load menu items, optionally filtered by category
        private void LoadMenuItems(string category = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // SQL query to get all items or filter by category
                string query = "SELECT ItemID, ItemName, Category, UnitPrice, StockQuantity, ImageFile FROM Item";

                if (!string.IsNullOrEmpty(category))
                {
                    query += " WHERE Category = @Category";
                }

                //executes query and retrieves results
                SqlDataAdapter da = new SqlDataAdapter(query, conn);

                // If filtering by category, add the category parameter to the query
                if (!string.IsNullOrEmpty(category))
                {
                    da.SelectCommand.Parameters.AddWithValue("@Category", category);
                }

                //create database to hold the results
                DataTable dt = new DataTable();
                da.Fill(dt); //fill in datatable with the result

                // Bind results of datatable to repeater for display
                rptMenu.DataSource = dt;
                rptMenu.DataBind();
            }
        }

        // Category dropdown selection changed event handler
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get selected category from dropdown
            string selectedCategory = ddlCategory.SelectedValue;

            if (string.IsNullOrEmpty(selectedCategory))
            {
                LoadMenuItems(); // All items
            }
            else
            {
                LoadMenuItems(selectedCategory); // Filtered items
            }
        }

        // Repeater item command event handler (Add to Cart button)
        protected void rptMenu_ItemCommand(object source, RepeaterCommandEventArgs e)           
        {
            // Check if the command is 'add' (when click Add to Cart button)
            if (e.CommandName == "add")
            {
                int itemId = Convert.ToInt32(e.CommandArgument);  // Get item ID from command argument

                int accountId = Convert.ToInt32(Session["AccountID"]);  // Get account ID from session (user must be logged in)


                // Check if accountId is valid
                if (accountId <= 0)
                {
                    lblSuccess.Text = "❌ Please log in to add items to your cart.";
                    return;
                }

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Check stock before adding to cart
                    string stockQuery = "SELECT StockQuantity FROM Item WHERE ItemID=@ItemID";
                    SqlCommand stockCmd = new SqlCommand(stockQuery, con);
                    stockCmd.Parameters.AddWithValue("@ItemID", itemId); // Add the item ID parameter to the command
                    int stock = Convert.ToInt32(stockCmd.ExecuteScalar());
                    if (stock <= 0)
                    {
                        lblSuccess.Text = "❌ This item is out of stock.";
                        return;
                    }

                    // 1. Check if user already has a cart
                    string cartQuery = "SELECT CartID FROM Cart WHERE AccountID=@AccountID";
                    SqlCommand cmd = new SqlCommand(cartQuery, con);
                    cmd.Parameters.AddWithValue("@AccountID", accountId);
                    object cartIdObj = cmd.ExecuteScalar();

                    int cartId;
                    if (cartIdObj == null)
                    {
                        // Create new cart (no CreatedDate)
                        string insertCart = "INSERT INTO Cart (AccountID) OUTPUT INSERTED.CartID VALUES (@AccountID)";
                        SqlCommand cmdInsert = new SqlCommand(insertCart, con);
                        cmdInsert.Parameters.AddWithValue("@AccountID", accountId);
                        cartId = (int)cmdInsert.ExecuteScalar();
                    }
                    else
                    {
                        cartId = (int)cartIdObj;
                    }

                    // 2. Check if item already in cart
                    string itemCheck = "SELECT Cart_ItemID, ItemQuantity FROM Cart_Item WHERE CartID=@CartID AND ItemID=@ItemID";
                    SqlCommand cmdItem = new SqlCommand(itemCheck, con);
                    cmdItem.Parameters.AddWithValue("@CartID", cartId);
                    cmdItem.Parameters.AddWithValue("@ItemID", itemId);

                    SqlDataReader rdr = cmdItem.ExecuteReader();
                    if (rdr.Read())
                    {
                        // Already in cart → update quantity
                        int currentQty = Convert.ToInt32(rdr["ItemQuantity"]);
                        int cartItemId = Convert.ToInt32(rdr["Cart_ItemID"]);
                        rdr.Close();

                        // Check if enough stock for new quantity
                        if (currentQty + 1 > stock)
                        {
                            lblSuccess.Text = "❌ Not enough stock for this item.";
                            return;
                        }

                        // Update item quantity in cart
                        string updateQty = "UPDATE Cart_Item SET ItemQuantity=@Qty WHERE Cart_ItemID=@Cart_ItemID";
                        SqlCommand cmdUpdate = new SqlCommand(updateQty, con);
                        cmdUpdate.Parameters.AddWithValue("@Qty", currentQty + 1);
                        cmdUpdate.Parameters.AddWithValue("@Cart_ItemID", cartItemId);
                        cmdUpdate.ExecuteNonQuery(); //executes commadns without return value
                    }
                    else
                    {
                        rdr.Close();
                        // Not in cart → insert new row
                        string insertItem = "INSERT INTO Cart_Item (CartID, ItemID, ItemQuantity) VALUES (@CartID, @ItemID, @Qty)";
                        SqlCommand cmdInsertItem = new SqlCommand(insertItem, con);
                        cmdInsertItem.Parameters.AddWithValue("@CartID", cartId);
                        cmdInsertItem.Parameters.AddWithValue("@ItemID", itemId);
                        cmdInsertItem.Parameters.AddWithValue("@Qty", 1);
                        cmdInsertItem.ExecuteNonQuery();
                    }
                }

                // Show success message
                lblSuccess.Text = "✅ Added to cart successfully!";
            }
        }

        // Repeater item data bound event handler
        protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Only process data items (not header/footer)
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find stock label and button controls in the item
                Label lblOOS = (Label)e.Item.FindControl("lblOOS");
                Button btnAddToCart = (Button)e.Item.FindControl("btnAddToCart");

                // Get stock value from data item
                var drv = (System.Data.DataRowView)e.Item.DataItem;
                int stock = Convert.ToInt32(drv["StockQuantity"]);

                // If out of stock, show label and hide button
                if (stock <= 0)
                {
                    lblOOS.Visible = true;
                    btnAddToCart.Visible = false;
                }
            }
        }

    }
}
