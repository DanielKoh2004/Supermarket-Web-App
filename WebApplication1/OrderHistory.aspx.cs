using System;
using System.Data;
using System.Web.UI;

namespace WebApplication1
{
    public partial class OrderHistory : Page
    {
        // Page load event
        protected void Page_Load(object sender, EventArgs e)
        {
            // On first load, bind order history for logged-in user
            if (!IsPostBack)
            {
                // Get AccountID from session
                int accountId = Session["AccountID"] != null ? Convert.ToInt32(Session["AccountID"]) : 0;
                if (accountId <= 0)
                {
                    // If not logged in, clear grid view
                    gvOrderHistory.DataSource = null;
                    gvOrderHistory.DataBind();
                    return;
                }

                // Get connection string from configuration
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;
                using (var con = new System.Data.SqlClient.SqlConnection(connStr))
                {
                    con.Open();
                    // Get CustomerID from AccountID
                    int customerId = 0;
                    using (var cmd = new System.Data.SqlClient.SqlCommand("SELECT CustomerID FROM Customer WHERE AccountID=@AccountID", con))
                    {
                        cmd.Parameters.AddWithValue("@AccountID", accountId);
                        var result = cmd.ExecuteScalar();
                        if (result != null) customerId = Convert.ToInt32(result);
                    }
                    if (customerId == 0)
                    {
                        // If no customer found, clear grid view
                        gvOrderHistory.DataSource = null;
                        gvOrderHistory.DataBind();
                        return;
                    }

                    // Query order history for this customer
                    string sql = @"
                        SELECT o.OrderID, o.OrderDate, 
                            STUFF((
                                SELECT ', ' + i.ItemName + ' x' + CAST(oi.Quantity AS VARCHAR)
                                FROM OrderItem oi
                                JOIN Item i ON oi.ItemID = i.ItemID
                                WHERE oi.OrderID = o.OrderID
                                FOR XML PATH(''), TYPE
                            ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS PurchasedItems,
                            CASE WHEN o.TotalAmount < 0 THEN 0 ELSE o.TotalAmount END AS TotalAmount,
                            CASE WHEN d.DeliveryID IS NOT NULL THEN 'Delivery' ELSE 'In-Store Pickup' END AS DeliveryMethod,
                            CASE WHEN d.DeliveryID IS NOT NULL THEN ISNULL(d.DeliveryAddress, '') ELSE ISNULL(pu.PickupLocation, '') END AS DeliveryAddress,
                            p.PaymentMethod
                        FROM [Order] o
                        LEFT JOIN Delivery d ON o.OrderID = d.OrderID
                        LEFT JOIN Pickup pu ON o.OrderID = pu.OrderID
                        LEFT JOIN Payment p ON o.OrderID = p.OrderID
                        WHERE o.CustomerID = @CustomerID
                        ORDER BY o.OrderDate DESC";
                    using (var cmd = new System.Data.SqlClient.SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", customerId);
                        using (var da = new System.Data.SqlClient.SqlDataAdapter(cmd))
                        {
                            var dt = new System.Data.DataTable();
                            da.Fill(dt);
                            // Bind order history data to grid view
                            gvOrderHistory.DataSource = dt;
                            gvOrderHistory.DataBind();
                        }
                    }
                }
            }
        }

        // Handles back button click, returns to home page
        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
