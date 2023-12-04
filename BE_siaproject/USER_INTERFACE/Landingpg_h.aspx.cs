using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Landingpg_h : System.Web.UI.Page
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
                            // You can use userData as needed
                        }
                        else
                        {
                            // Handle the case where user data is not found for the given ID
                            Response.Redirect("Login.aspx"); // Redirect to the login page
                            return; // Important to prevent further execution of the page
                        }
                    }
                    else
                    {
                        // Handle invalid user ID in the cookie
                        Response.Redirect("Login.aspx"); // Redirect to the login page
                        return; // Important to prevent further execution of the page
                    }
                }
                else
                {
                    // UserId cookie is not set, redirect to login page
                    Response.Redirect("Login.aspx"); // Redirect to the login page
                    return; // Important to prevent further execution of the page
                }

                // Check if the user has already seen the pop-up
                if (Session["PopUpDisplayed"] == null)
                {
                    // Set the session variable to indicate that the pop-up has been displayed
                    Session["PopUpDisplayed"] = true;
                    // Register the client script to display the modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModalScript", "displayModal();", true);
                }

                if (!string.IsNullOrEmpty(Request.QueryString["checkStatus"]) && Request.QueryString["checkStatus"].ToLower() == "true")
                {
                    // Check user status before redirecting
                    CheckUserStatus();
                }
            }
        }

        protected void CheckUserStatus()
        {
            // Get the user_id from the cookie
            HttpCookie userCookie = Request.Cookies["UserId"];

            if (userCookie != null)
            {
                int userId;
                if (int.TryParse(userCookie.Value, out userId))
                {
                    // Check the user's status from the database based on their user_id
                    string userStatus = GetUserStatusFromDatabase(userId);

                    // Redirect based on user status
                    if (userStatus == "none")
                    {
                        // Continue with the normal redirection
                    }
                    else if (userStatus == "pending")
                    {
                        // Show a prompt to the user
                        ClientScript.RegisterStartupScript(GetType(), "UserPendingScript", "alert('You have a pending application.');", true);
                        // You can also redirect to a different page or take other actions as needed
                    }
                    else if (userStatus == "approve")
                    {
                        ClientScript.RegisterStartupScript(GetType(), "UserApproveScript", "alert('You are already enrolled.');", true);
                    }
                }
            }
        }

        protected string GetUserStatusFromDatabase(int userId)
        {
            string status = "none"; // Default status

            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT STATUS FROM STUDENT WHERE STUD_ID = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Read the "STATUS" column instead of "F_NAME"
                            status = reader["STATUS"].ToString();
                            return status;
                        }
                    }
                }
            }

            return status;
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
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

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
                                // Add other properties as needed
                            };
                            return userData;
                        }
                    }
                }
            }

            return null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Home.aspx");
        }
    }
}