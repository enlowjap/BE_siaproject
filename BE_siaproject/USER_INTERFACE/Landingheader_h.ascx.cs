using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Landingheader_h : System.Web.UI.UserControl
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
                            // Set the button text to the user's first name and last name
                            Login.Text = $"{userData.FirstName} {userData.LastName}";
                        }
                        else
                        {
                            // Handle the case where user data is not found for the given ID
                            Response.Redirect("LoginPage.aspx"); // Redirect to login page
                        }
                    }
                    else
                    {
                        // Handle invalid user ID in the cookie
                        Response.Redirect("LoginPage.aspx"); // Redirect to login page
                    }
                }
                else
                {
                    // UserId cookie is not set, redirect to login page
                    Response.Redirect("LoginPage.aspx"); // Redirect to login page
                }
            }
        } 
    

        // Assuming you have a UserData class to store user data
        public class UserData
        {
            public int UserId { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            // Add other properties as per your database schema
        }

        // Method to retrieve user data from the database based on user ID
        private UserData GetUserById(int userId)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT STUD_ID, F_NAME, L_NAME FROM STUDENT WHERE STUD_ID = @UserId";
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
                                UserId = Convert.ToInt32(reader["STUD_ID"]),
                                FirstName = reader["F_NAME"].ToString(),
                                LastName = reader["L_NAME"].ToString(),
                                
                            };
                            return userData;
                        }
                    }
                }
            }
            
            return null;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            // Clear the UserId cookie
            if (Request.Cookies["UserId"] != null)
            {
                HttpCookie userIdCookie = new HttpCookie("UserId");
                userIdCookie.Expires = DateTime.Now.AddYears(-1);
                Response.Cookies.Add(userIdCookie);
            }

            // Redirect to the login page
            Response.Redirect("~/USER_INTERFACE/Login.aspx");
        }
    }
}

