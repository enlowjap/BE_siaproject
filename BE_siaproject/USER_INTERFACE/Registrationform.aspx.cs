using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Registrationform : System.Web.UI.Page
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
                            txtlname.Text = $"{userData.LastName}";
                            txtfname.Text = $"{userData.FirstName}";
                            txtmname.Text = $"{userData.MiddleName}";
                            txtsuffix.Text = $"{userData.Suffix}";
                            txtlrn.Text = $"{userData.LRN}";
                            txtpob.Text = $"{userData.pob}";
                            txtdob.Text = $"{userData.dob}";
                            txtgender.Text = $"{userData.gender}";
                            txtnationlty.Text = $"{userData.nationality}";
                            txtreligion.Text = $"{userData.religion}";
                            txtaddress.Text = $"{userData.address}";
                            txttele.Text = $"{userData.telnum}";
                            txtmobil.Text = $"{userData.molnum}";
                            txtemail.Text = $"{userData.email}";
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
            public string LastName { get; set; }
            public string MiddleName { get; set; }
            public string Suffix { get; set; }
            public string LRN { get; set; }
            public string pob { get; set; }
            public DateTime? dob { get; set; } // Use nullable DateTime to handle null values
            public string gender { get; set; }
            public string nationality { get; set; }
            public string religion { get; set; }
            public string address { get; set; }
            public string email { get; set; }
            public string telnum { get; set; }
            public string molnum { get; set; }
        }

        private UserData GetUserById(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

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
                                FirstName = reader["F_NAME"].ToString(),
                                LastName = reader["L_NAME"].ToString(),
                                MiddleName = reader["M_NAME"].ToString(),
                                Suffix = reader["SUFFIX"].ToString(),
                                LRN = reader["LRN"].ToString(),
                                pob = reader["POB"].ToString(),
                                gender = reader["GENDER"].ToString(),
                                nationality = reader["NTNLTY"].ToString(),
                                religion = reader["RELIGION"].ToString(),
                                address = reader["ADDRESS"].ToString(),
                                email = reader["EMAIL_ADD"].ToString(),
                                telnum = reader["TP_NUM"].ToString(),
                                molnum = reader["MP_NUM"].ToString(),
                                dob = reader["BD"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["BD"])
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
            // Retrieve data from the form fields
            string lastName = txtlname.Text;
            string firstName = txtfname.Text;
            string middleName = txtmname.Text;
            string suffix = txtsuffix.Text;
            string placeOfBirth = txtpob.Text;
            DateTime dateOfBirth = DateTime.Parse(txtdob.Text); // Ensure this field always has a valid date
            string gender = txtgender.Text;
            string nationality = txtnationlty.Text;
            string religion = txtreligion.Text;
            string address = txtaddress.Text;
            string telephoneNumber = txttele.Text;
            string mobileNumber = txtmobil.Text;
            string lrnum =txtlrn.Text;
            // Retrieve the unique identifier for the record you want to update (for example, STUD_ID)
            int currentuser = 0;
            if (Request.Cookies["UserId"] != null)
            {
                if (int.TryParse(Request.Cookies["UserId"].Value, out currentuser))
                {
                    try
                    {
                        // Save data to the database
                        string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            string query = "UPDATE STUDENT SET L_NAME = @LastName, F_NAME = @FirstName, M_NAME = @MiddleName, LRN = @LRN  , SUFFIX = @Suffix, POB = @PlaceOfBirth, BD = @DateOfBirth, GENDER = @Gender, NTNLTY = @Nationality, RELIGION = @Religion, ADDRESS = @Address, TP_NUM = @TelephoneNumber, MP_NUM = @MobileNumber WHERE STUD_ID = @UserId";

                            using (SqlCommand cmd = new SqlCommand(query, connection))
                            {
                                cmd.Parameters.AddWithValue("@LastName", lastName);
                                cmd.Parameters.AddWithValue("@FirstName", firstName);
                                cmd.Parameters.AddWithValue("@MiddleName", middleName);
                                cmd.Parameters.AddWithValue("@Suffix", suffix);
                                cmd.Parameters.AddWithValue("@PlaceOfBirth", placeOfBirth);
                                cmd.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                                cmd.Parameters.AddWithValue("@Gender", gender);
                                cmd.Parameters.AddWithValue("@Nationality", nationality);
                                cmd.Parameters.AddWithValue("@Religion", religion);
                                cmd.Parameters.AddWithValue("@Address", address);
                                cmd.Parameters.AddWithValue("@TelephoneNumber", telephoneNumber);
                                cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                                cmd.Parameters.AddWithValue("@LRN", lrnum);
                                cmd.Parameters.AddWithValue("@UserId", currentuser); // Add the unique identifier parameter

                                connection.Open();
                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Data successfully updated in the database
                                    // Optionally, you can show a success message or redirect to another page
                                    Response.Redirect("~/USER_INTERFACE/Document.aspx");
                                }
                                else
                                {
                                    // Update failed, show an error message
                                    Response.Write("Failed to update data. Please try again.");
                                }
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle database exception
                        Response.Write($"Database error: {ex.Message}");
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                    catch (Exception ex)
                    {
                        // Handle other exceptions
                        Response.Write($"An error occurred: {ex.Message}");
                        // Log the exception for future reference if needed
                        // LogException(ex);
                    }
                }
                else
                {
                    Response.Write("Invalid user ID in the cookie.");
                }
            }
            else
            {
                Response.Write("User ID not found in the cookie.");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_INTERFACE/Landingpg_h.aspx");
        }
    }

}