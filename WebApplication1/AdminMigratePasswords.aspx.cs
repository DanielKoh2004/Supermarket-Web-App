using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Helpers;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class AdminMigratePasswords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMigrate_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;
            var updates = new List<System.Tuple<int, string>>();
            int migratedCount = 0;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand selectCmd = new SqlCommand("SELECT AccountID, Password FROM Account", conn);
                SqlDataReader reader = selectCmd.ExecuteReader();
                while (reader.Read())
                {
                    int accountId = (int)reader["AccountID"];
                    string plainPassword = reader["Password"].ToString();
                    // Only hash if not already hashed (base64 string length is 24 or 44 for PBKDF2)
                    if (plainPassword.Length < 24 || !plainPassword.Contains("="))
                    {
                        string hashed = PasswordHelper.HashPassword(plainPassword);
                        updates.Add(System.Tuple.Create(accountId, hashed));
                    }
                }
                reader.Close();

                foreach (var update in updates)
                {
                    SqlCommand updateCmd = new SqlCommand("UPDATE Account SET Password=@Password WHERE AccountID=@AccountID", conn);
                    updateCmd.Parameters.AddWithValue("@Password", update.Item2);
                    updateCmd.Parameters.AddWithValue("@AccountID", update.Item1);
                    updateCmd.ExecuteNonQuery();
                    migratedCount++;
                }
            }
            lblResult.Text = $"Migration completed. {migratedCount} password(s) updated.";
        }
    }
}