using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.ADMIN_INTERFACE
{
    public partial class Adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string usernme = username.Text.Trim();
            string Passwords = password.Text.Trim();

            // Authenticate user using the provided email and hashed password
            int userId = AuthenticateUser(usernme, Passwords);
            if (userId != -1)
            {
                // Authentication successful
                // Set the user ID as a cookie
                HttpCookie userIdCookie = new HttpCookie("UserId", userId.ToString());
                Response.Cookies.Add(userIdCookie);

                Response.Redirect("~/ADMIN_INTERFACE/Dashboard.aspx");
            }
            else
            {
                // Authentication failed
                errorLabel.Text = "Invalid email or password.";
            }
        }

        private int AuthenticateUser(string usernme, string Passwords)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ID, PASSWORD FROM ADMIN WHERE USERNAME = @username";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@username", usernme);
                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Retrieve hashed password and user ID from the database
                            string hashedPasswordFromDB = reader["PASSWORD"].ToString();
                            int userId = Convert.ToInt32(reader["ID"]);

                            // Verify hashed password
                            if (hashedPasswordFromDB.Equals(Passwords, StringComparison.OrdinalIgnoreCase))
                            {
                                // Password matches, return user ID
                                return userId;
                            }
                        }
                    }
                }
            }

            // Email not found or password doesn't match
            return -1;
        }
    }
}