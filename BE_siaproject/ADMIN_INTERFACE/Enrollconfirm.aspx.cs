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
    public partial class Enrollconfirm : System.Web.UI.Page
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
                            if (Request.QueryString["studId"] != null)
                            {
                                int studId = Convert.ToInt32(Request.QueryString["studId"]);
                                // You can use studId as needed, such as displaying student details on the page.
                            }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            int studId;
            if (int.TryParse(Request.QueryString["studId"], out studId))
            {
                Response.Redirect($"~/ADMIN_INTERFACE/ViewDetailspage.aspx?studId={studId}");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Fetch the studId parameter from the URL
            if (Request.QueryString["studId"] != null)
            {
                int studId = Convert.ToInt32(Request.QueryString["studId"]);

                // Alter the status of the student with the fetched studId
                AlterStudentStatus(studId, "approve");
                Response.Redirect("~/ADMIN_INTERFACE/Students.aspx");
            }
        }

        private void AlterStudentStatus(int studId, string newStatus)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE STUDENT SET STATUS = @NewStatus WHERE STUD_ID = @StudId";

                using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@NewStatus", newStatus);
                    cmd.Parameters.AddWithValue("@StudId", studId);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
