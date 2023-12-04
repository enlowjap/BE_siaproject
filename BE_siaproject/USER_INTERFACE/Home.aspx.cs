using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Home : System.Web.UI.Page
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

                        }
                        else
                        {
                            // Handle the case where user data is not found for the given ID
                            Response.Redirect("~/USER_INTERFACE/Login.aspx"); // Redirect to login page
                        }
                    }
                    else
                    {
                        // Handle invalid user ID in the cookie
                        Response.Redirect("~/USER_INTERFACE/Login.aspx"); // Redirect to login page
                    }
                }
                else
                {
                    // UserId cookie is not set, redirect to login page
                    Response.Redirect("~/USER_INTERFACE/Login.aspx"); // Redirect to login page
                }
            }
        }


        // Assuming you have a UserData class to store user data
        public class UserData
        {
            public int UserId { get; set; }
        }

        private UserData GetUserById(int userId)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM STUDENT WHERE STUD_ID = @UserId";
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