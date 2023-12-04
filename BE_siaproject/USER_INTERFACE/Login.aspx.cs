using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text.Trim();
            string Passwords = txtboxpassword.Text.Trim(); 

            // Authenticate user using the provided email and hashed password
            int userId = AuthenticateUser(email, Passwords);
            if (userId != -1)
            {
                // Authentication successful
                // Set the user ID as a cookie
                HttpCookie userIdCookie = new HttpCookie("UserId", userId.ToString());
                Response.Cookies.Add(userIdCookie);

                Response.Redirect("Landingpg_h.aspx");
            }
            else
            {
                // Authentication failed
                errorLabel.Text = "Invalid email or password.";
            }
        }

        private int AuthenticateUser(string email, string Passwords)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT STUD_ID, PASSWORD FROM STUDENT WHERE EMAIL_ADD = @Email";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Retrieve hashed password and user ID from the database
                            string hashedPasswordFromDB = reader["PASSWORD"].ToString();
                            int userId = Convert.ToInt32(reader["STUD_ID"]);

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