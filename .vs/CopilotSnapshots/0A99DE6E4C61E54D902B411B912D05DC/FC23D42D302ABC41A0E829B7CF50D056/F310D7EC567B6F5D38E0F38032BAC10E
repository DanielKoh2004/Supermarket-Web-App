using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            int totalStaff = 0;
            int productsInStock = 0;
            decimal monthlySales = 0;
            using (var conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (var cmd = new SqlCommand("SELECT COUNT(*) FROM Staff", conn))
                {
                    totalStaff = (int)cmd.ExecuteScalar();
                }
                using (var cmd = new SqlCommand("SELECT SUM(StockQuantity) FROM Item", conn))
                {
                    var result = cmd.ExecuteScalar();
                    productsInStock = result != DBNull.Value ? Convert.ToInt32(result) : 0;
                }
                using (var cmd = new SqlCommand("SELECT SUM(PaymentAmount) FROM Payment WHERE MONTH(PaymentDate) = MONTH(GETDATE()) AND YEAR(PaymentDate) = YEAR(GETDATE())", conn))
                {
                    var result = cmd.ExecuteScalar();
                    monthlySales = result != DBNull.Value ? Convert.ToDecimal(result) : 0;
                }
            }
            lblTotalStaff.Text = totalStaff.ToString();
            lblProductsInStock.Text = productsInStock.ToString();
            lblMonthlySales.Text = monthlySales.ToString("F2");
        }
    }
}