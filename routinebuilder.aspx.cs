using System;
using System.Configuration;
using System.Data.SqlClient;

namespace skintrackerr
{
    public partial class routinebuilder : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SkinTrackerLogin"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["edit"] != null)
            {
                int routineID = Convert.ToInt32(Request.QueryString["edit"]);
                LoadRoutineForEdit(routineID);
            }
        }

        private void LoadRoutineForEdit(int routineID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Routines WHERE RoutineID=@RoutineID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@RoutineID", routineID);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtRoutineName.Text = reader["RoutineName"].ToString();
                    ddlSkinType.SelectedValue = reader["SkinType"].ToString();
                    ddlSteps.SelectedValue = reader["Steps"].ToString();
                    txtConcerns.Text = reader["Concerns"].ToString();
                    ddlVisibility.SelectedValue = reader["Visibility"].ToString();
                    ViewState["RoutineID"] = routineID;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string email = Session["UserEmail"]?.ToString() ?? "guest@skintracker.com";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                if (ViewState["RoutineID"] != null)
                {
                    string query = "UPDATE Routines SET RoutineName=@RoutineName, SkinType=@SkinType, Steps=@Steps, Concerns=@Concerns, Visibility=@Visibility WHERE RoutineID=@RoutineID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@RoutineName", txtRoutineName.Text);
                    cmd.Parameters.AddWithValue("@SkinType", ddlSkinType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Steps", ddlSteps.SelectedValue);
                    cmd.Parameters.AddWithValue("@Concerns", txtConcerns.Text);
                    cmd.Parameters.AddWithValue("@Visibility", ddlVisibility.SelectedValue);
                    cmd.Parameters.AddWithValue("@RoutineID", ViewState["RoutineID"]);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("web.aspx?updated=true");
                }
                else
                {
                    string query = "INSERT INTO Routines (UserEmail, RoutineName, SkinType, Steps, Concerns, Visibility) VALUES (@UserEmail, @RoutineName, @SkinType, @Steps, @Concerns, @Visibility)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserEmail", email);
                    cmd.Parameters.AddWithValue("@RoutineName", txtRoutineName.Text);
                    cmd.Parameters.AddWithValue("@SkinType", ddlSkinType.SelectedValue);
                    cmd.Parameters.AddWithValue("@Steps", ddlSteps.SelectedValue);
                    cmd.Parameters.AddWithValue("@Concerns", txtConcerns.Text);
                    cmd.Parameters.AddWithValue("@Visibility", ddlVisibility.SelectedValue);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("web.aspx");
                }
            }
        }
    }
}

