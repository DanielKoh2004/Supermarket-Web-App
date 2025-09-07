using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No special logic needed for now
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string name = txtProductName.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string stockText = txtStock.Text.Trim();
            string imageFile = "";

            decimal price;
            int stock;
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(priceText) || string.IsNullOrEmpty(category) || string.IsNullOrEmpty(stockText))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }
            if (!decimal.TryParse(priceText, out price) || !int.TryParse(stockText, out stock))
            {
                lblMessage.Text = "Invalid price or stock quantity.";
                return;
            }

            // Handle image upload
            if (fuImage.HasFile)
            {
                string ext = Path.GetExtension(fuImage.FileName).ToLower();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".gif")
                {
                    lblMessage.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                    return;
                }
                string fileName = Guid.NewGuid().ToString() + ext;
                string savePath = Server.MapPath("~/img/menu/" + fileName);
                fuImage.SaveAs(savePath);
                imageFile = fileName;
            }
            else
            {
                lblMessage.Text = "Please select an image to upload.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Item (ItemName, Category, StockQuantity, UnitPrice, ImageFile) VALUES (@Name, @Category, @Stock, @Price, @ImageFile)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Stock", stock);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@ImageFile", imageFile);
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Product added successfully!";
                    txtProductName.Text = "";
                    txtPrice.Text = "";
                    txtStock.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}