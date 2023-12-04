using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Gradelevel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Check if the parameter exists in the URL
                if (Request.QueryString["category"] != null)
                {
                    string category = Request.QueryString["category"];
                    // Use category as needed
                    lblcategory.Text = category;
                }

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
                            Response.Redirect("Login.aspx"); // Redirect to login page
                        }
                    }
                    else
                    {
                        // Handle invalid user ID in the cookie
                        Response.Redirect("Login.aspx"); // Redirect to login page
                    }
                }
                else
                {
                    // UserId cookie is not set, redirect to login page
                    Response.Redirect("Login.aspx"); // Redirect to login page
                }
            }
        
        
        }
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
            string educategory ="";

            if (lblcategory.Text == "SpecialEducation")
            {
                educategory = "specialeduc";
            }
            else if (lblcategory.Text == "RegularSchooling")
            {
                educategory = "regular";
            }
            else if (lblcategory.Text == "HomeSchooling")
            {
                educategory = "homeschooling";
            }

            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Proceed with insertion or update in EDUC_TYPE table
                    int userId = GetUserIdFromCookie();

                    // Check if a record exists for the user in EDUC_TYPE
                    string checkEduTypeQuery = "SELECT COUNT(*) FROM EDUC_TYPE WHERE STUD_ID = @STUD_ID";
                    using (SqlCommand checkEduTypeCmd = new SqlCommand(checkEduTypeQuery, connection))
                    {
                        checkEduTypeCmd.Parameters.AddWithValue("@STUD_ID", userId);
                        int eduTypeCount = (int)checkEduTypeCmd.ExecuteScalar();

                        if (eduTypeCount > 0)
                        {
                            // Update the existing record
                            string updateEduTypeQuery = "UPDATE EDUC_TYPE SET EDUC_TYPE = @EDUC_TYPE, GRD_LEVEL = @GRD_LEVEL, GRD_TRACK = @GRD_TRACK WHERE STUD_ID = @STUD_ID";
                            using (SqlCommand updateEduTypeCmd = new SqlCommand(updateEduTypeQuery, connection))
                            {
                                // Set parameters for update
                                updateEduTypeCmd.Parameters.AddWithValue("@STUD_ID", userId);
                                updateEduTypeCmd.Parameters.AddWithValue("@EDUC_TYPE", educategory);
                                updateEduTypeCmd.Parameters.AddWithValue("@GRD_LEVEL", DropDownList1.SelectedValue);
                                updateEduTypeCmd.Parameters.AddWithValue("@GRD_TRACK", DrplG11nG12.SelectedValue);
                                // Set other parameters as needed

                                int rowsUpdated = updateEduTypeCmd.ExecuteNonQuery();

                                if (rowsUpdated > 0)
                                {
                                    // Update successful
                                    Response.Redirect("Registrationform.aspx");
                                }
                                else
                                {
                                    // Update failed
                                    // Handle the failure, show an error message, log it, etc.
                                }
                            }
                        }
                        else
                        {
                            // Insert a new record
                            string insertEduTypeQuery = "INSERT INTO EDUC_TYPE (STUD_ID, GRD_LEVEL, EDUC_TYPE, GRD_TRACK) VALUES (@STUD_ID, @GRD_LEVEL, @EDUC_TYPE, @GRD_TRACK)";
                            using (SqlCommand insertEduTypeCmd = new SqlCommand(insertEduTypeQuery, connection))
                            {
                                // Set parameters for insertion
                                insertEduTypeCmd.Parameters.AddWithValue("@STUD_ID", userId);
                                insertEduTypeCmd.Parameters.AddWithValue("@GRD_LEVEL", DropDownList1.SelectedValue);
                                insertEduTypeCmd.Parameters.AddWithValue("@EDUC_TYPE", educategory);
                                insertEduTypeCmd.Parameters.AddWithValue("@GRD_TRACK", DrplG11nG12.SelectedValue);
                                // Set other parameters as needed

                                int rowsInserted = insertEduTypeCmd.ExecuteNonQuery();

                                if (rowsInserted > 0)
                                {
                                    // Insertion successful
                                    Response.Redirect("Registrationform.aspx");
                                }
                                else
                                {
                                    // Insertion failed
                                    // Handle the failure, show an error message, log it, etc.
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // Show an error message, log the exception, etc.
            }
        }

        private int GetUserIdFromCookie()
        {
            // Get the user_id from the cookie
            HttpCookie userCookie = Request.Cookies["UserId"];

            if (userCookie != null)
            {
                int userId;
                if (int.TryParse(userCookie.Value, out userId))
                {
                    return userId;
                }
            }

            // Return a default value or handle the case where user_id is not found
            return -1;
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Landingpg_h.aspx");
        }

        
    }
}