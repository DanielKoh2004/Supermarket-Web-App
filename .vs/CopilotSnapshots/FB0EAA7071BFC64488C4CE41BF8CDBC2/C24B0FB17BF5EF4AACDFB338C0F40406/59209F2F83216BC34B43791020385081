using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    lblGreeting.Text = "Welcome, " + Session["User"].ToString();
                    btnLoginLogout.Text = "Logout";
                }
                else
                {
                    lblGreeting.Text = "";
                    btnLoginLogout.Text = "Login";
                }
            }
        }

        protected void btnLoginLogout_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                // Logout
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Redirect to login page
                Response.Redirect("Login.aspx");
            }
        }

    }
}