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
    public partial class userDashboard : System.Web.UI.Page
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
                else if (Session["role"].Equals("user"))
                {
                    loadProfile();
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void btnAddProj_Click1(object sender, EventArgs e)
        {
            if (checkIfProjectExists() == true)
            {
                Response.Write("<script>alert('ID already taken. Please try another ID');</script>");
            }
            else
            {
                createNewProject();
            }
        }

        protected void btnEditProj_Click1(object sender, EventArgs e)
        {
            if (checkIfProjectExists() == true)
            {
                Session["project"] = tbxProjID.Text.Trim();
                Response.Redirect("viewProjectDetails.aspx");
            }
            else
            {
                //we cannot edit a nonexistent project
                Response.Write("<script>alert('Project does not exist.');</script>");
            }

            
        }

        protected void btnDeleteProj_Click(object sender, EventArgs e)
        {
            if (checkIfProjectExists() == true)
            {
                deleteProject();
            }
            else
            {
                //we cannot delete a nonexistent project
                Response.Write("<script>alert('Project does not exist.');</script>");
            }
        }

        //user defined functions
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

                    }
                    //Response.Redirect("homepage.aspx");
                }
                else
                {
                    //Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfProjectExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM project_master_tbl WHERE project_id='" + tbxProjID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                //con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
 
        void createNewProject()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO project_master_tbl(project_id, assoc_user) values(@project_id, @assoc_user);", con);
                cmd.Parameters.AddWithValue("@project_id", tbxProjID.Text.Trim());
                cmd.Parameters.AddWithValue("@assoc_user", Session["username"].ToString());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Project successfully created!');</script>");
                Session["project"] = tbxProjID.Text.Trim();
                gdvProjects.DataBind();
                Response.Redirect("viewProjectDetails.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteProject()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM project_master_tbl WHERE project_id='" + tbxProjID.Text.Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Project successfully deleted!');</script>");
                Session["project"] = tbxProjID.Text.Trim();
                gdvProjects.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}