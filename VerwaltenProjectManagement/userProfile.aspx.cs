using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VerwaltenProjectManagement
{
    public partial class userProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    Response.Write("<script>alert('Login first');</script>");
                    Response.Redirect("userLogIn.aspx");
                }
                else if (Session["role"].Equals("user") || Session["role"].Equals("quasiuser"))
                {
                    loadProfile();
                    //tbxNewPassword.Text = "";
                    if (this.IsPostBack)
                    {
                        //tbxPassword.Attributes["value"] = tbxPassword.Text;
                        tbxNewPassword.Attributes["value"] = tbxNewPassword.Text;
                    }
                    
                }
            }
            catch(Exception ex)
            {

            }
             
        }

        

        protected void cbxShowPass_CheckedChanged(object sender, EventArgs e)
        {
            if (cbxShowPass.Checked == true)
            {
                tbxNewPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                tbxNewPassword.TextMode = TextBoxMode.Password;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateProfile();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        void loadProfile()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM user_master_tbl WHERE user_id='" + Session["username"] + "';", con);
                
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                /*DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    tbxUserID.Text = dt.Rows[0]["user_id"].ToString();
                    tbxFirstName.Text = dt.Rows[0]["first_name"].ToString();
                    tbxMidName.Text = dt.Rows[0]["middle_name"].ToString();
                    tbxLastName.Text = dt.Rows[0]["last_name"].ToString();
                    tbxDOB.Text = DateTime.Parse(dt.Rows[0]["dob"].ToString()).ToString("yyyy-MM-dd");
                    ddlGender.Items.FindByText(dt.Rows[0]["gender"].ToString()).Selected = true;
                    tbxContactNo.Text = dt.Rows[0]["contact_num"].ToString();
                    tbxEmail.Text = dt.Rows[0]["email"].ToString();
                    tbxFullAddress.Text = dt.Rows[0]["full_address"].ToString();
                    tbxPassword.Attributes["value"] = dt.Rows[0]["password"].ToString();
                }*/


                //connected 
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tbxUserID.Text = dr.GetValue(0).ToString();
                        tbxFirstName.Text = dr.GetValue(1).ToString();
                        tbxMidName.Text = dr.GetValue(2).ToString();
                        tbxLastName.Text = dr.GetValue(3).ToString();
                        tbxDOB.Text = DateTime.Parse(dr.GetValue(4).ToString()).ToString("yyyy-MM-dd");
                        ddlGender.Items.FindByText(dr.GetValue(5).ToString()).Selected = true;
                        tbxContactNo.Text = dr.GetValue(6).ToString();
                        tbxEmail.Text = dr.GetValue(7).ToString();
                        tbxFullAddress.Text = dr.GetValue(8).ToString();
                        tbxPassword.Attributes["value"] = dr.GetValue(9).ToString();
                    }
                    //Response.Redirect("homepage.aspx");
                }
                else
                {
                    //Response.Write("<script>alert('Invalid credentials');</script>");
                }


                if (Session["role"].Equals("quasiuser"))
                {
                    //forgot password - only password can be updated
                    tbxFirstName.Enabled = false;
                    tbxMidName.Enabled = false;
                    tbxLastName.Enabled = false;
                    tbxDOB.Enabled = false;
                    tbxEmail.Enabled = false;
                    ddlGender.Enabled = false;
                    tbxContactNo.Enabled = false;
                    tbxFullAddress.Enabled = false;
                    tbxUserID.Enabled = false;
                }
            }
            catch (Exception ex)
            {

            }
        }

        void updateProfile()
        {
            string password = "";
            bool pChanged = false;
            if (tbxNewPassword.Text.Trim() == "" || tbxNewPassword.Text.Trim() == tbxPassword.Text.Trim())
            {
                password = tbxPassword.Text.Trim();
                pChanged = false;
            }
            else
            {
                password = tbxNewPassword.Text.Trim();
                pChanged = true;
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE user_master_tbl SET first_name=@first_name, middle_name=@middle_name, last_name=@last_name, dob=@dob, gender=@gender, contact_num=@contact_num, email=@email, full_address=@full_address, password=@password WHERE user_id='" + Session["username"].ToString().Trim() + "';", con);

                cmd.Parameters.AddWithValue("@first_name", tbxFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@middle_name", tbxMidName.Text.Trim());
                cmd.Parameters.AddWithValue("@last_name", tbxLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact_num", tbxContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@email", tbxEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", tbxFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);

                int result = cmd.ExecuteNonQuery();
                con.Close();

                if(result > 0)
                {
                    Response.Write("<script>alert('User details updated successfully');</script>");
                    if(pChanged == true)
                    {
                        Session["username"] = "";
                        Session["full name"] = "";
                        Session["role"] = null;
                        Response.Redirect("userLogIn.aspx");
                    }
                    else
                    {
                        loadProfile();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

    }
}