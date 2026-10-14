using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace skintrackerr
{
    public partial class web : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SkinTrackerLogin"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // show welcome if user in session
                if (Session["UserFullName"] != null)
                {
                    lblWelcome.Text = "Welcome, " + Session["UserFullName"].ToString() + "!";
                    btnLogout.Visible = true;
                    lnkSignup.Visible = false;
                }
                else
                {
                    lblWelcome.Text = "";
                    btnLogout.Visible = false;
                    lnkSignup.Visible = true;
                }

                LoadRoutines();
            }

            if (!IsPostBack && Request.QueryString["updated"] == "true")
            {
                // use a small script to show message
                ClientScript.RegisterStartupScript(this.GetType(), "updated", "alert('✅ Your routine has been updated successfully!');", true);
            }
        }
        private void LoadRoutines()
        {
            string userEmail = Session["UserEmail"]?.ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string sql;
                SqlCommand cmd;

                if (!string.IsNullOrEmpty(userEmail))
                {
                    sql = "SELECT RoutineID, RoutineName, SkinType, Steps, Concerns, Visibility FROM Routines WHERE UserEmail = @UserEmail ORDER BY RoutineID DESC";
                    cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                }
                else
                {
                    sql = "SELECT RoutineID, RoutineName, SkinType, Steps, Concerns, Visibility FROM Routines ORDER BY RoutineID DESC";
                    cmd = new SqlCommand(sql, con);
                }
                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
                rptRoutines.DataSource = dt;
                rptRoutines.DataBind();
                pnlNoRoutines.Visible = (dt.Rows.Count == 0);
            }
        }

        // Repeater command handler (Edit/Delete)
        protected void rptRoutines_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditRoutine")
            {
                // redirect to builder with ?edit=ID
                string id = e.CommandArgument.ToString();
                Response.Redirect("routinebuilder.aspx?edit=" + id);
            }
            else if (e.CommandName == "DeleteRoutine")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DeleteRoutine(id);
                LoadRoutines();
                // optional client message
                ClientScript.RegisterStartupScript(this.GetType(), "deleted", "alert('Routine deleted.');", true);
            }
        }
        private void DeleteRoutine(int routineID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string sql = "DELETE FROM Routines WHERE RoutineID = @RoutineID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@RoutineID", routineID);
                cmd.ExecuteNonQuery();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("signin.aspx");
        }
    }
}
