using System;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        // Connection string for database access
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        // Handles reset password button click event
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            // Get new password and confirmation from user input
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();
            // Get accountId from query string
            string accountIdStr = Request.QueryString["accountId"];
            int accountId;
            // Validate accountId
            if (!int.TryParse(accountIdStr, out accountId) || accountId <= 0)
            {
                lblResult.Text = "Invalid account.";
                return;
            }
            // Check if passwords match
            if (newPassword != confirmPassword)
            {
                lblResult.Text = "Passwords do not match.";
                return;
            }
            // Validate password strength
            if (!IsValidPassword(newPassword))
            {
                lblResult.Text = "Password does not meet requirements.";
                return;
            }
            // Hash the new password
            string hashedPassword = PasswordHelper.HashPassword(newPassword);
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                // Update password in Account table
                SqlCommand cmd = new SqlCommand("UPDATE Account SET Password=@Password WHERE AccountID=@AccountID", conn);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);
                cmd.Parameters.AddWithValue("@AccountID", accountId);
                int rows = cmd.ExecuteNonQuery();
                // Show success or error message based on update result
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
        // Validates password according to defined rules
        private bool IsValidPassword(string password)
        {
            // Check for null/whitespace, length, and no spaces
            if (string.IsNullOrWhiteSpace(password) || password.Length < 8 || password.Length > 50)
                return false;
            if (password.Contains(" "))
                return false;
            // Check for uppercase, lowercase, digit, and special character
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
