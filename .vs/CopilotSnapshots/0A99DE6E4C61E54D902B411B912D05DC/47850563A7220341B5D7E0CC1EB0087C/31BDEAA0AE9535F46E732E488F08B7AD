using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class UpdateStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
            int productId;
            int newStock;
            decimal newUnitPrice;
            bool validStock = int.TryParse(txtNewStock.Text.Trim(), out newStock);
            bool validProduct = int.TryParse(txtProductID.Text.Trim(), out productId);
            bool validPrice = decimal.TryParse(txtUnitPrice.Text.Trim(), out newUnitPrice);

            if (validProduct && validStock && validPrice)
            {
                if (newStock < 0 || newUnitPrice < 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Stock quantity and unit price cannot be negative!');", true);
                    return;
                }
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;
                using (var con = new SqlConnection(connStr))
                {
                    con.Open();
                    string sql = "UPDATE Item SET StockQuantity = @StockQuantity, UnitPrice = @UnitPrice WHERE ItemID = @ItemID";
                    using (var cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@StockQuantity", newStock);
                        cmd.Parameters.AddWithValue("@UnitPrice", newUnitPrice);
                        cmd.Parameters.AddWithValue("@ItemID", productId);
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Stock and price updated successfully!');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product not found.');", true);
                        }
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid input.');", true);
            }
        }
    }
}