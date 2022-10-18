using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VerwaltenProjectManagement
{
    public partial class userLogIn : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                tbxPassword.Attributes["value"] = tbxPassword.Text;
            }
        }

        protected void cbxShowPass_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxShowPass.Checked == true)
            {
                tbxPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                tbxPassword.TextMode = TextBoxMode.Password;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM user_master_tbl WHERE user_id='" + tbxUserID.Text.Trim() + "' AND password='"+ tbxPassword.Text.Trim()+"';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Hello, "+dr.GetValue(0).ToString()+"!');</script>");
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["full name"] = String.Format("{0} {1}", dr.GetValue(1).ToString(), dr.GetValue(3).ToString());
                        Session["role"] = "user";
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
                //con.Close();
            }
            catch(Exception ex)
            {

            }
        }



        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {

        }
    }
}