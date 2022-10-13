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
    public partial class userSignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        //clicking on sign up button
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (CheckUserExists()) //the user ID is already taken
            {
                Response.Write("<script>alert('ID already taken. Please try another ID');</script>");
            }
            else //user ID is not yet taken
            {
                SignUpNewUser();
            }
        }

        //methods related to SQL queries
        bool CheckUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM user_master_tbl WHERE user_id='"+tbxUserID.Text.Trim()+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                //con.Close();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void SignUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO user_master_tbl(user_id, first_name, middle_name, last_name, dob, gender, contact_num, email, full_address, password) values(@user_id, @first_name, @middle_name, @last_name, @dob, @gender, @contact_num, @email, @full_address, @password);", con);
                cmd.Parameters.AddWithValue("@user_id", tbxUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@first_name", tbxFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@middle_name", tbxMidName.Text.Trim());
                cmd.Parameters.AddWithValue("@last_name", tbxLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", tbxDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact_num", tbxContactNo.Text.Trim());
                cmd.Parameters.AddWithValue("@email", tbxEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", tbxFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", tbxPassword.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign up successful! Go to User Login to Login')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


    }
}