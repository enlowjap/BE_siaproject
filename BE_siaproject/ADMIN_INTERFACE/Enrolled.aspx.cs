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
    public partial class Enrolled : System.Web.UI.Page
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
                            TotalCounths();
                            TotalCountrg();
                            TotalCountsped();   
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


        private void TotalCounths()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'homeschooling' AND S.STATUS = 'approve' ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    hsTotal.Text = $"Home Schooling Total Enrolled: {totalCount}";
                }
            }
        }


        protected void hsDrpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Call the method to update the total count when the grade level is selected
            UpdateTotalCountGrdLvlhs();
        }

        private void UpdateTotalCountGrdLvlhs()
        {
            // Get selected grade level from DropDownList
            string selectedGradeLevel = hsDrpList.SelectedValue;

            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'homeschooling' AND S.STATUS = 'approve' " +
                           "AND E.GRD_LEVEL = @GradeLevel";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@GradeLevel", selectedGradeLevel);

                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    hsgrdLvlTotal.Text = $"Total Enrolled: {totalCount}";
                }
            }
        }

       

        private void TotalCountrg()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'regular' AND S.STATUS = 'approve' ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    rgTotal.Text = $"Regular Total Enrolled: {totalCount}";
                }
            }
        }

        protected void rgDrpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalCountGrdLvlrg();
        }


        private void UpdateTotalCountGrdLvlrg()
        {
            // Get selected grade level from DropDownList
            string selectedGradeLevel = rgDrpList.SelectedValue;

            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'regular' AND S.STATUS = 'approve' " +
                           "AND E.GRD_LEVEL = @GradeLevel";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@GradeLevel", selectedGradeLevel);

                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    rggrdLvlTotal.Text = $"Total Enrolled: {totalCount}";
                }
            }
        }

        private void TotalCountsped()
        {
            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'specialeduc' AND S.STATUS = 'approve' ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    spedTotal.Text = $"Special Education Total Enrolled: {totalCount}";
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTotalCountGrdLvlsped();
        }

        private void UpdateTotalCountGrdLvlsped()
        {
            // Get selected grade level from DropDownList
            string selectedGradeLevel = DropDownList1.SelectedValue;

            // Your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString; ;

            // SQL query to get the total count of students with homeschooling educ_type and status is approve
            string query = "SELECT COUNT(*) FROM STUDENT S " +
                           "INNER JOIN EDUC_TYPE E ON S.STUD_ID = E.STUD_ID " +
                           "WHERE E.EDUC_TYPE = 'specialeduc' AND S.STATUS = 'approve' " +
                           "AND E.GRD_LEVEL = @GradeLevel";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@GradeLevel", selectedGradeLevel);

                    // Execute the query and get the total count
                    int totalCount = (int)cmd.ExecuteScalar();

                    // Update the label text with the total count
                    spedgrdLvlTotal.Text = $"Total Enrolled: {totalCount}";
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

        
    }
}