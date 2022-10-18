using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VerwaltenProjectManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]== null)
                {
                    //default states
                    lnkLogin.Visible = true;
                    lnkSignUp.Visible = true;

                    lnkLogOut.Visible = false;
                    lnkProjs.Visible = false;
                    lnkUserProfile.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    //when a user is logged in
                    lnkLogin.Visible = false;
                    lnkSignUp.Visible = false;

                    lnkLogOut.Visible = true;
                    lnkProjs.Visible = true;
                    lnkUserProfile.Visible = true;
                    lnkUserProfile.Text = String.Format("{0} Profile", Session["username"].ToString());
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogIn.aspx");
        }

        protected void lnkSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("userSignUp.aspx");
        }

        protected void lnkProjs_Click(object sender, EventArgs e)
        {
            Response.Redirect("userDashboard.aspx");
        }

        protected void lnkUserProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("userProfile.aspx");
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["full name"] = "";
            Session["role"] = null;
            Response.Redirect("homepage.aspx");
        }
    }
}