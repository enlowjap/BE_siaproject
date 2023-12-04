using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Deletepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Dashboard.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int currentUserId = 0;

            // Check if the UserId cookie exists
            if (Request.Cookies["UserId"] != null && int.TryParse(Request.Cookies["UserId"].Value, out currentUserId))
            {
                // Use a try-catch block to handle any potential exceptions
                try
                {
                    string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Use a transaction to ensure the integrity of the database changes
                        using (SqlTransaction transaction = connection.BeginTransaction())
                        {
                            try
                            {
                                // First, delete user data in DOCUMENTS table
                                string deleteDocumentsQuery = "DELETE FROM DOCUMENTS WHERE STUD_ID = @UserId";
                                using (SqlCommand deleteDocumentsCmd = new SqlCommand(deleteDocumentsQuery, connection, transaction))
                                {
                                    deleteDocumentsCmd.Parameters.AddWithValue("@UserId", currentUserId);
                                    deleteDocumentsCmd.ExecuteNonQuery();
                                }

                                // Next, delete user data in EDUC_TYPE table
                                string deleteEduTypeQuery = "DELETE FROM EDUC_TYPE WHERE STUD_ID = @UserId";
                                using (SqlCommand deleteEduTypeCmd = new SqlCommand(deleteEduTypeQuery, connection, transaction))
                                {
                                    deleteEduTypeCmd.Parameters.AddWithValue("@UserId", currentUserId);
                                    deleteEduTypeCmd.ExecuteNonQuery();
                                }

                                // Update the status in STUDENT table
                                string updateStatusQuery = "UPDATE STUDENT SET STATUS = 'none' WHERE STUD_ID = @UserId";
                                using (SqlCommand updateStatusCmd = new SqlCommand(updateStatusQuery, connection, transaction))
                                {
                                    updateStatusCmd.Parameters.AddWithValue("@UserId", currentUserId);
                                    updateStatusCmd.ExecuteNonQuery();
                                }

                                // Delete nullable columns in STUDENT table
                                string deleteNullableColumnsQuery = "UPDATE STUDENT SET LRN = NULL, ADDRESS = NULL, NTNLTY = NULL, RELIGION = NULL, POB = NULL, BD = NULL, TP_NUM = NULL, MP_NUM = NULL WHERE STUD_ID = @UserId";
                                using (SqlCommand deleteNullableColumnsCmd = new SqlCommand(deleteNullableColumnsQuery, connection, transaction))
                                {
                                    deleteNullableColumnsCmd.Parameters.AddWithValue("@UserId", currentUserId);
                                    deleteNullableColumnsCmd.ExecuteNonQuery();
                                }

                                // If all database operations are successful, commit the transaction
                                transaction.Commit();

                                // Redirect or show a success message as needed
                                Response.Redirect("~/USER_INTERFACE/Dashboard.aspx");
                            }
                            catch (Exception ex)
                            {
                                // Handle exceptions
                                // You might want to log the exception details for debugging
                                transaction.Rollback();
                                
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions at a higher level
                    // You might want to log the exception details for debugging
                    
                }
            }
            else
            {
                // Handle the case where UserId cookie is not set or invalid
                Response.Redirect("~/USER_INTERFACE/Login.aspx");
            }
        }

    }
}
