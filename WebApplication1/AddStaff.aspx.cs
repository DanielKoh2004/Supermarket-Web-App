using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AddStaff : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string name = txtName.Text.Trim();
            string role = ddlRole.SelectedValue;
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(name) || string.IsNullOrEmpty(role) || string.IsNullOrEmpty(status))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();
                try
                {
                    // Insert into Account (AccountType is 'Staff')
                    string accountQuery = "INSERT INTO Account (Email, Password, AccountType) OUTPUT INSERTED.AccountID VALUES (@Email, @Password, 'Staff')";
                    SqlCommand cmdAccount = new SqlCommand(accountQuery, conn, transaction);
                    cmdAccount.Parameters.AddWithValue("@Email", email);
                    cmdAccount.Parameters.AddWithValue("@Password", password);
                    int accountId = (int)cmdAccount.ExecuteScalar();

                    // Insert into Staff (Role is only here)
                    string staffQuery = "INSERT INTO Staff (AccountID, Name, Status, Role) VALUES (@AccountID, @Name, @Status, @Role)";
                    SqlCommand cmdStaff = new SqlCommand(staffQuery, conn, transaction);
                    cmdStaff.Parameters.AddWithValue("@AccountID", accountId);
                    cmdStaff.Parameters.AddWithValue("@Name", name);
                    cmdStaff.Parameters.AddWithValue("@Status", status);
                    cmdStaff.Parameters.AddWithValue("@Role", role);
                    cmdStaff.ExecuteNonQuery();

                    transaction.Commit();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Staff added successfully!";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                    txtName.Text = "";
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}