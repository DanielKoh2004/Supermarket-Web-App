using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class StockLevels : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStockData();
            }
        }

        protected void gvStockLevels_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int itemId = Convert.ToInt32(gvStockLevels.DataKeys[rowIndex].Value);
                DeleteProduct(itemId);
                BindStockData();
            }
        }

        private void DeleteProduct(int itemId)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                // First delete related order items
                string deleteOrderItemQuery = "DELETE FROM OrderItem WHERE ItemID = @ItemID";
                using (SqlCommand cmdOrderItem = new SqlCommand(deleteOrderItemQuery, conn))
                {
                    cmdOrderItem.Parameters.AddWithValue("@ItemID", itemId);
                    cmdOrderItem.ExecuteNonQuery();
                }
                // Then delete the item itself
                string deleteItemQuery = "DELETE FROM Item WHERE ItemID = @ItemID";
                using (SqlCommand cmdItem = new SqlCommand(deleteItemQuery, conn))
                {
                    cmdItem.Parameters.AddWithValue("@ItemID", itemId);
                    cmdItem.ExecuteNonQuery();
                }
            }
        }

        private void BindStockData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ItemID, ItemName, UnitPrice, StockQuantity FROM Item";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(dt);
            }
            gvStockLevels.DataSource = dt;
            gvStockLevels.DataBind();
        }
    }
}
