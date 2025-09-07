using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EditStaff : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineOrderSystemConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdateStaff_Click(object sender, EventArgs e)
        {
            int staffId;
            string newName = txtNewName.Text.Trim();
            string newRole = ddlNewRole.SelectedValue;
            if (!int.TryParse(txtStaffID.Text.Trim(), out staffId) || string.IsNullOrEmpty(newName) || string.IsNullOrEmpty(newRole))
            {
                lblMessage.Text = "Please enter valid Staff ID, name, and select a role.";
                return;
            }
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "UPDATE Staff SET Name = @Name, Role = @Role WHERE StaffID = @StaffID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Name", newName);
                cmd.Parameters.AddWithValue("@Role", newRole);
                cmd.Parameters.AddWithValue("@StaffID", staffId);
                conn.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Staff updated successfully!";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Staff not found.";
                }
            }
        }
    }
}