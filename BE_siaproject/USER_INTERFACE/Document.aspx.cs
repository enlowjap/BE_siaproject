using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Document : System.Web.UI.Page
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
                            medfilename.Text = $"{userData.MedFileFromUser}";
                            cardfilename.Text = $"{userData.CardFileFromUser}";
                            bocfilename.Text = $"{userData.BCFromUser}";
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
            public string FirstName { get; set; }
            public string MedFileFromUser { get; set; }
            public string CardFileFromUser { get; set; }
            public string BCFromUser { get; set; }
        }

        // Method to retrieve user data from the database based on user ID
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
                            // Retrieve user data including medical document name from the database
                            UserData userData = new UserData
                            {
                                UserId = Convert.ToInt32(reader["STUD_ID"]),
                                MedFileFromUser = GetMedicalDocumentName(userId),
                                CardFileFromUser = GetReportCardName(userId),
                                BCFromUser = GetBCName(userId)
                            };
                            return userData;
                        }
                    }
                }
            }

            return null;
        }

        // Function to retrieve only the medical document name based on user ID
        private string GetMedicalDocumentName(int userId)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT DOC_NAME " +
                               "FROM DOCUMENTS " +
                               "WHERE STUD_ID = @UserId AND DOC_TYPE = 'Medical Certificate'";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    object result = cmd.ExecuteScalar();

                    return result != null ? result.ToString() : "Not Uploaded";
                }
            }
        }

        private string GetReportCardName(int userId)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT DOC_NAME " +
                               "FROM DOCUMENTS " +
                               "WHERE STUD_ID = @UserId AND DOC_TYPE = 'Report Card'";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    object result = cmd.ExecuteScalar();

                    return result != null ? result.ToString() : "Not Uploaded";
                }
            }
        }

        private string GetBCName(int userId)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT DOC_NAME " +
                               "FROM DOCUMENTS " +
                               "WHERE STUD_ID = @UserId AND DOC_TYPE = 'Birth Certificate'";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    connection.Open();

                    object result = cmd.ExecuteScalar();

                    return result != null ? result.ToString() : "Not Uploaded";
                }
            }
        }


       

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Registrationform.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Summary.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            UploadDocument("Medical Certificate", medfile);
        
            UploadDocument("Report Card", cardfile);
       
            UploadDocument("Birth Certificate", bcfile);
        }

        protected void UploadDocument(string docType, FileUpload fileUpload)
        {
            try
            {
                int maxFileSize = 2 * 1024 * 1024; // 2MB limit
                if (fileUpload.PostedFile.ContentLength <= maxFileSize)
                {
                    if (fileUpload.HasFile)
                    {
                        // Get the file name, type, and content
                        string docName = Path.GetFileName(fileUpload.FileName);
                        byte[] fileData = fileUpload.FileBytes;

                        // Get the user ID from the cookie
                        if (Request.Cookies["UserId"] != null && int.TryParse(Request.Cookies["UserId"].Value, out int currentuser))
                        {
                            // Check if a document with the same type already exists
                            bool documentExists = CheckIfDocumentExists(currentuser, docType);

                            UserData userData = GetUserById(currentuser);

                            if (documentExists)
                            {
                                // Update the existing document
                                UpdateDocument(currentuser, docName, docType, fileData, userData);
                            }
                            else
                            {
                                // Insert a new document
                                InsertDocument(currentuser, docName, docType, fileData, userData);
                            }
                        }
                        else
                        {
                            Label5.Text = "Invalid user ID in the cookie.";
                        }
                    }
                }
                else
                {
                    Label5.Text = "file size exceeds the limit.";
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Label5.Text = $"An error occurred: {ex.Message}";
                // Log the exception for future reference if needed
                // LogException(ex);
            }
        }

        private bool CheckIfDocumentExists(int userId, string docType)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";
            string query = "SELECT COUNT(*) FROM DOCUMENTS WHERE STUD_ID = @StudentId AND DOC_TYPE = @DocType";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@StudentId", userId);
                    cmd.Parameters.AddWithValue("@DocType", docType);

                    connection.Open();
                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        private void UpdateDocument(int userId, string docName, string docType, byte[] fileData, UserData userData)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";
            string query = "UPDATE DOCUMENTS SET DOC_NAME = @DocName, DATA = @FileData WHERE STUD_ID = @StudentId AND DOC_TYPE = @DocType";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@StudentId", userId);
                    cmd.Parameters.AddWithValue("@DocName", docName);
                    cmd.Parameters.AddWithValue("@DocType", docType);
                    cmd.Parameters.AddWithValue("@FileData", fileData);

                    try
                    {
                        connection.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Document successfully updated
                            Label5.Text = "Document updated successfully.";
                            userData.MedFileFromUser = GetMedicalDocumentName(userId);
                            userData.CardFileFromUser = GetReportCardName(userId);
                            userData.BCFromUser = GetBCName(userId);

                            medfilename.Text = userData.MedFileFromUser;
                            cardfilename.Text = userData.CardFileFromUser;
                            bocfilename.Text = userData.BCFromUser;
                        }
                        else
                        {
                            // Update failed, show an error message
                            Label5.Text = "Failed to update document. Please try again.";
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL exceptions
                        Label5.Text = $"Database error: {ex.Message}";
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                    catch (Exception ex)
                    {
                        // Handle other exceptions
                        Label5.Text = $"An error occurred: {ex.Message}";
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                }
            }
        }

        private void InsertDocument(int userId, string docName, string docType, byte[] fileData, UserData userData)
        {
            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";
            string query = "INSERT INTO DOCUMENTS (STUD_ID, DOC_NAME, DOC_TYPE, DATA) VALUES (@StudentId, @DocName, @DocType, @FileData)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@StudentId", userId);
                    cmd.Parameters.AddWithValue("@DocName", docName);
                    cmd.Parameters.AddWithValue("@DocType", docType);
                    cmd.Parameters.AddWithValue("@FileData", fileData);

                    try
                    {
                        connection.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Document successfully uploaded
                            Label5.Text = "Document uploaded successfully.";
                            userData.MedFileFromUser = GetMedicalDocumentName(userId);
                            userData.CardFileFromUser = GetReportCardName(userId);
                            userData.BCFromUser = GetBCName(userId);

                            medfilename.Text = userData.MedFileFromUser;
                            cardfilename.Text = userData.CardFileFromUser;
                            bocfilename.Text = userData.BCFromUser;
                        }
                        else
                        {
                            // Upload failed, show an error message
                            Label5.Text = "Failed to upload document. Please try again.";
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL exceptions
                        Label5.Text = $"Database error: {ex.Message}";
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                    catch (Exception ex)
                    {
                        // Handle other exceptions
                        Label5.Text = $"An error occurred: {ex.Message}";
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                }
            }
        }
    }
}