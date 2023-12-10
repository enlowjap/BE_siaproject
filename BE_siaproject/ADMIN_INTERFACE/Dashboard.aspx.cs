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
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the UserId cookie exists
                if (Request.Cookies["UserId"] != null)
                {
                    // Get the user ID from the cookie
                    int userId;
                    if (int.TryParse(Request.Cookies["UserId"].Value, out userId))
                    {
                        // Retrieve user data from the database based on the user ID
                        UserData userData = GetUserById(userId);

                        if (userData != null)
                        {
                            TotalCountEnrolling();
                            TotalCountEnrolled();
                        }
                        else
                        {
                            // Handle the case where user data is not found for the given ID
                            Response.Redirect("~/ADMIN_INTERFACE/Adminlogin.aspx"); // Redirect to login page
                        }
                    }
                    else
                    {
                        // Handle invalid user ID in the cookie
                        Response.Redirect("~/ADMIN_INTERFACE/Adminlogin.aspx"); // Redirect to login page
                    }
                }
                else
                {
                    // UserId cookie is not set, redirect to login page
                    Response.Redirect("~/ADMIN_INTERFACE/Adminlogin.aspx"); // Redirect to login page
                }
            }
        }

        private void TotalCountEnrolling()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT " +
                           "WHERE STATUS = 'pending' ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    lblenrolingstud.Text = $" {totalCount}";
                }
            }
        }

        private void TotalCountEnrolled()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT " +
                           "WHERE STATUS = 'approve' ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    lblenrolledstud.Text = $" {totalCount}";
                }
            }
        }

        // Assuming you have a UserData class to store user data
        public class UserData
        {
            public int UserId { get; set; }
            public string Username { get; set; }
            // Add other properties as per your database schema
        }

        // Method to retrieve user data from the database based on user ID
        private UserData GetUserById(int userId)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ID, USERNAME FROM ADMIN WHERE ID = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Retrieve user data from the database
                            UserData userData = new UserData
                            {
                                UserId = Convert.ToInt32(reader["ID"]),
                                Username = reader["USERNAME"].ToString(),

                            };
                            return userData;
                        }
                    }
                }
            }

            return null;
        }
    }
}