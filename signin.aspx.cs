using System;
using System.Data.SqlClient;
using System.Configuration;

namespace skintrackerr
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["SkinTrackerLogin"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT FullName FROM Users WHERE Email=@Email AND Password=@Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    object fullName = cmd.ExecuteScalar();

                    if (fullName != null)
                    {
                        Session["UserFullName"] = fullName.ToString();
                        Session["UserEmail"] = txtEmail.Text;

                        Response.Redirect("web.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "❌ Invalid email or password!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}

