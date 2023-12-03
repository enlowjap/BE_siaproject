using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;

namespace BE_siaproject.ADMIN_INTERFACE
{
    public partial class ViewDetailspage : System.Web.UI.Page
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
                                int studId;
                                if (int.TryParse(Request.QueryString["studId"], out studId))
                                {
                                    // Retrieve student details based on studId
                                    LoadStudentDetails(studId);
                                    LoadSubmittedDocuments(studId);
                                }
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


        private void LoadStudentDetails(int studId)
        {
            // Use your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Use SqlCommand to retrieve student details
                string query = "SELECT F_NAME, L_NAME, M_NAME, SUFFIX, LRN, EMAIL_ADD, ADDRESS,GENDER, MP_NUM, TP_NUM FROM STUDENT WHERE STUD_ID = @StudId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudId", studId);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Set values to the labels on the page
                            lblFirstName.Text = "First Name: " + reader["F_NAME"].ToString();
                            lblLastName.Text = "Last Name: " + reader["L_NAME"].ToString();
                            lblMiddlename.Text = "Middle Name: " + reader["M_NAME"].ToString();
                            // Add other labels for remaining details
                        }
                    }
                }
            }
        }

        private void LoadSubmittedDocuments(int studId)
        {
            // Use your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Use SqlCommand to retrieve document details
                string query = "SELECT DOC_ID, DOC_NAME, DOC_TYPE, DATA FROM DOCUMENTS WHERE STUD_ID = @StudId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudId", studId);

                    // Use a SqlDataAdapter to fill a DataTable with document details
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        // Bind the DataTable to the GridViewDocuments
                        GridViewDocuments.DataSource = dataTable;
                        GridViewDocuments.DataBind();
                    }
                }
            }
        }

        protected void GridViewDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDocument")
            {
                int docId = Convert.ToInt32(e.CommandArgument);

                // Get document data
                byte[] documentData = GetDocumentData(docId);

                if (documentData != null)
                {
                    // Set the content type to PDF
                    string contentType = "application/pdf";

                    // Prompt the user to download the PDF
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = contentType;
                    Response.AddHeader("Content-Disposition", $"attachment;filename=Document_{docId}.pdf");

                    // Set the content length to the size of the document data
                    Response.AddHeader("Content-Length", documentData.Length.ToString());

                    // Write the binary data to the response stream
                    Response.BinaryWrite(documentData);

                    // Complete the response (this will end the request)
                    Response.Flush();
                    Response.SuppressContent = true;
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
            }
        }




        private byte[] GetDocumentData(int docId)
        {
            // Use your connection string

            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Use SqlCommand to retrieve document data
                string query = "SELECT DATA FROM DOCUMENTS WHERE DOC_ID = @DocId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DocId", docId);

                    // ExecuteScalar to get the document data as a byte array
                    return command.ExecuteScalar() as byte[];
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["studId"] != null)
            {
                int studId;
                if (int.TryParse(Request.QueryString["studId"], out studId))
                {
                    Response.Redirect($"~/ADMIN_INTERFACE/Enrollconfirm.aspx?studId={studId}");
                }
            }
        }
    }
}