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
    public partial class viewProject : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            loadProjDetails();
            viewTasks.Visible = true;
            addOrEditTasks.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("userDashboard.aspx");
        }

        bool checkIfTaskExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM task_master_tbl WHERE task_id='" + tbxTaskID.Text.Trim() + "';", con);
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

        void createNewTask()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO task_master_tbl(task_id, task_name, task_description, in_charge, starting_date, ending_date, status, assoc_project) values(@task_id, @task_name, @task_description, @in_charge, @starting_date, @ending_date, @status, @assoc_project);", con);
                cmd.Parameters.AddWithValue("@task_id", tbxTaskID.Text.Trim());
                cmd.Parameters.AddWithValue("@task_name", tbxTaskTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@task_description", tbxTaskDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@in_charge", tbxInCharge.Text.Trim());
                cmd.Parameters.AddWithValue("@starting_date", tbxTStartDate.Text.Trim());
                cmd.Parameters.AddWithValue("@ending_date", tbxTEndDate.Text.Trim());
                cmd.Parameters.AddWithValue("@status", ddlTStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@assoc_project", Session["project"].ToString());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Task successfully created!');</script>");
                Session["project"] = tbxTaskID.Text.Trim();
                gdvTasks.DataBind();
                addOrEditTasks.Visible = false;
                viewTasks.Visible = true;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void loadProjDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM project_master_tbl WHERE project_id='" + Session["project"].ToString().Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tbxProjectTitle.Text = dr.GetValue(1).ToString();
                        tbxProjDesc.Text = dr.GetValue(2).ToString();
                        tbxCoordinators.Text = dr.GetValue(3).ToString();
                        tbxStartDate.Text = DateTime.Parse(dr.GetValue(4).ToString()).ToString("yyyy-MM-dd");
                        tbxEndDate.Text = DateTime.Parse(dr.GetValue(5).ToString()).ToString("yyyy-MM-dd");
                        ddlPStatus.Items.FindByText(dr.GetValue(6).ToString()).Selected = true;
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void loadTaskDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM task_master_tbl WHERE task_id='" + Session["task"].ToString().Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        tbxTaskTitle.Text = dr.GetValue(1).ToString();
                        tbxTaskDesc.Text = dr.GetValue(2).ToString();
                        tbxInCharge.Text = dr.GetValue(3).ToString();
                        tbxTStartDate.Text = DateTime.Parse(dr.GetValue(4).ToString()).ToString("yyyy-MM-dd");
                        tbxTEndDate.Text = DateTime.Parse(dr.GetValue(5).ToString()).ToString("yyyy-MM-dd");
                        ddlTStatus.Items.FindByText(dr.GetValue(6).ToString()).Selected = true;
                    }
                    //Response.Redirect("homepage.aspx");
                    gdvTasks.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid inputs');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateProjDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE project_master_tbl SET project_name=@project_name, project_description=@project_description, coordinator=@coordinator, starting_date=@starting_date, ending_date=@ending_date, status=@status WHERE project_id='" + Session["project"].ToString().Trim() + "';", con);

                cmd.Parameters.AddWithValue("@project_name", tbxProjectTitle.Text);
                cmd.Parameters.AddWithValue("@project_description", tbxProjDesc.Text);
                cmd.Parameters.AddWithValue("@coordinator", tbxCoordinators.Text);
                cmd.Parameters.AddWithValue("@starting_date", tbxStartDate.Text);
                cmd.Parameters.AddWithValue("@ending_date", tbxEndDate.Text);
                cmd.Parameters.AddWithValue("@status", ddlPStatus.SelectedValue);

                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Project details updated successfully');</script>");
                    loadProjDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invalid inputs');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateTaskDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE task_master_tbl SET task_name=@task_name, task_description=@task_description, in_charge=@in_charge, starting_date=@starting_date, ending_date=@ending_date, status=@status WHERE task_id='" + Session["task"].ToString().Trim() + "';", con);

                cmd.Parameters.AddWithValue("@task_name", tbxTaskTitle.Text);
                cmd.Parameters.AddWithValue("@task_description", tbxTaskDesc.Text);
                cmd.Parameters.AddWithValue("@in_charge", tbxInCharge.Text);
                cmd.Parameters.AddWithValue("@starting_date", tbxTStartDate.Text);
                cmd.Parameters.AddWithValue("@ending_date", tbxTEndDate.Text);
                cmd.Parameters.AddWithValue("@status", ddlTStatus.SelectedValue);

                int result = cmd.ExecuteNonQuery();
                con.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Project details updated successfully');</script>");
                    loadProjDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invalid inputs');</script>");
                }

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

                SqlCommand cmd = new SqlCommand("DELETE FROM project_master_tbl WHERE project_id='" + Session["project"].ToString().Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Project successfully deleted! Redirecting to dashboard.');</script>");
                Session["project"] = "";
                Response.Redirect("userDashboard.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deleteTask()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM task_master_tbl WHERE task_id='" + Session["task"].ToString().Trim() + "';", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Task successfully deleted!');</script>");
                Session["task"] = "";

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnUpdateProj_Click(object sender, EventArgs e)
        {
            updateProjDetails();
            
        }

        protected void btnDeleteProj_Click(object sender, EventArgs e)
        {
            deleteProject();
        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            if (checkIfTaskExists() == true)
            {
                Response.Write("<script>alert('ID already taken. Please try another ID');</script>");
            }
            else
            {
                Session["task"] = tbxTaskID.Text;
                viewTasks.Visible = false;
                addOrEditTasks.Visible = true;
                btnAddTaskModal.Enabled = true;
                btnUpdateTaskModal.Enabled = false;
                btnDeleteTaskModal.Enabled = false;
                btnExitModal.Enabled = true;
            }

        }

        protected void btnEditTask_Click(object sender, EventArgs e)
        {
            if (checkIfTaskExists() == true)
            {
                Session["task"] = tbxTaskID.Text;
                viewTasks.Visible = false;
                loadTaskDetails();
                addOrEditTasks.Visible = true;
                btnAddTaskModal.Enabled = false;
                btnUpdateTaskModal.Enabled = true;
                btnDeleteTaskModal.Enabled = true;
                btnExitModal.Enabled = true;
            }
            else
            {
                Response.Write("<script>alert('Task does not exist.');</script>");
            }
        }

        protected void btnDeleteTask_Click(object sender, EventArgs e)
        {
            if (checkIfTaskExists() == true)
            {
                Session["task"] = tbxTaskID.Text;
                deleteTask();
            }
            else
            {
                Response.Write("<script>alert('Task does not exist.');</script>");
            }
        }

        protected void btnViewTasks_Click(object sender, EventArgs e)
        {
            viewTasks.Visible = true;
            addOrEditTasks.Visible = false;
        }

        protected void btnAddTaskModal_Click(object sender, EventArgs e)
        {
            createNewTask();
        }

        protected void btnUpdateTaskModal_Click(object sender, EventArgs e)
        {
            updateTaskDetails();
        }

        protected void btnDeleteTaskModal_Click(object sender, EventArgs e)
        {
            deleteTask();
        }

        protected void btnExitModal_Click(object sender, EventArgs e)
        {
            viewTasks.Visible = true;
            addOrEditTasks.Visible = false;
        }
    }
}