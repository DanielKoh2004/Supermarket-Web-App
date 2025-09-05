using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string accountType = ddlLoginType.SelectedValue; // "Staff" or "Customer"

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT AccountID FROM Account WHERE Email=@Email AND Password=@Password AND AccountType=@AccountType", conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@AccountType", accountType);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string accountId = reader["AccountID"].ToString();
                    Session["AccountID"] = accountId;
                    Session["AccountType"] = accountType;
                    reader.Close();

                    if (accountType == "Staff")
                    {
                        // Get staff role from Staff table
                        SqlCommand cmdStaff = new SqlCommand("SELECT Role FROM Staff WHERE AccountID=@AccountID", conn);
                        cmdStaff.Parameters.AddWithValue("@AccountID", accountId);
                        var staffRole = cmdStaff.ExecuteScalar()?.ToString();
                        Session["Role"] = staffRole;
                        Response.Redirect("StaffManagement.aspx");
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Invalid email, password, or account type.";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
