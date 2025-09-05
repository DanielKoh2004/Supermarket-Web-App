using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            string accountIdStr = Request.QueryString["accountId"];
            int accountId;
            if (!int.TryParse(accountIdStr, out accountId) || accountId <= 0)
            {
                lblResult.Text = "Invalid account.";
                return;
            }
            if (newPassword != confirmPassword)
            {
                lblResult.Text = "Passwords do not match.";
                return;
            }
            if (!IsValidPassword(newPassword))
            {
                lblResult.Text = "Password does not meet requirements.";
                return;
            }
            string hashedPassword = PasswordHelper.HashPassword(newPassword);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Account SET Password=@Password WHERE AccountID=@AccountID", conn);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);
                cmd.Parameters.AddWithValue("@AccountID", accountId);
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblResult.ForeColor = System.Drawing.Color.Green;
                    lblResult.Text = "Password reset successful! You can now log in.";
                }
                else
                {
                    lblResult.Text = "Account not found.";
                }
            }
        }
        private bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password) || password.Length < 8 || password.Length > 50)
                return false;
            if (password.Contains(" "))
                return false;
            if (!Regex.IsMatch(password, @"[A-Z]")) // Uppercase
                return false;
            if (!Regex.IsMatch(password, @"[a-z]")) // Lowercase
                return false;
            if (!Regex.IsMatch(password, @"\d")) // Number
                return false;
            if (!Regex.IsMatch(password, @"[!@#$%]")) // Special char
                return false;
            return true;
        }
    }
}
