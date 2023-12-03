using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            if (Request.Cookies["UserId"] != null)
            {
                if (int.TryParse(Request.Cookies["UserId"].Value, out int userId))
                {
                    UserData userData = GetUserById(userId);

                    if (userData != null)
                    {
                        UpdateUI(userData);
                    }
                    else
                    {
                        HandleUserDataNotFound();
                    }
                }
                else
                {
                    HandleInvalidUserId();
                }
            }
            else
            {
                RedirectLogin();
            }
        }

        private void UpdateUI(UserData userData)
        {
            lblgrdlevel.Text = GetGradeLevel(userData.grdlevel);
            lblctgry.Text = GetEducationCategory(userData.educcategory);
            lblstrand.Text = GetEducationStrand(userData.grdstrand);
            lbllname.Text = $"{userData.LastName}";
            lblfname.Text = $"{userData.FirstName}";
            lblmname.Text = $"{userData.MiddleName}";
            lblsuffix.Text = $"{userData.Suffix}";
            lbllrnnum.Text = $"{userData.LRN}";
            lblpob.Text = $"{userData.pob}";
            lbldob.Text = $"{userData.dob}";
            lblgendet.Text = $"{userData.gender}";
            lblnationlty.Text = $"{userData.nationality}";
            lblreligion.Text = $"{userData.religion}";
            lbladdress.Text = $"{userData.address}";
            lblt.Text = $"{userData.telnum}";
            lblm.Text = $"{userData.molnum}";
        }

        private string GetGradeLevel(string level)
        {
            // Implementation of GetGradeLevel method
            // ...
            string grdlvl = "";

            switch (level)
            {
                case "nursery":
                    grdlvl = "Nursery";
                    break;

                case "k1":
                    grdlvl = "Kinder 1";
                    break;

                case "k2":
                    grdlvl = "Kinder 2";
                    break;
                case "g1":
                    grdlvl = "Grade 1";
                    break;
                case "g2":
                    grdlvl = "Grade 2";
                    break;
                case "g3":
                    grdlvl = "Grade 3";
                    break;
                case "g4":
                    grdlvl = "Grade 4";
                    break;
                case "g5":
                    grdlvl = "Grade 5";
                    break;
                case "g6":
                    grdlvl = "Grade 6";
                    break;
                case "g7":
                    grdlvl = "Grade 7";
                    break;
                case "g8":
                    grdlvl = "Grade 8";
                    break;
                case "g9":
                    grdlvl = "Grade 9";
                    break;
                case "g10":
                    grdlvl = "Grade 10";
                    break;
                case "g11":
                    grdlvl = "Grade 11";
                    break;
                case "g12":
                    grdlvl = "Grade 12";
                    break;

                // Add more cases as needed
                // ...

                default:
                    // Handle cases not covered by specific labels (if needed)
                    break;
            }

            return grdlvl;
        }

        private string GetEducationCategory(string category)
        {
            // Implementation of GetEducationCategory method
            // ...
            string educat = "";

            switch (category)
            {
                case "regular":
                    educat = "Regular";
                    break;

                case "specialeduc":
                    educat = "Special Education";
                    break;

                case "homeschooling":
                    educat = "Home Schooling";
                    break;
                // Add more cases as needed
                // ...

                default:
                    // Handle cases not covered by specific labels (if needed)
                    break;
            }

            return educat;
        }

        private string GetEducationStrand(string edustrand)
        {
            string strnd = "";
            if (edustrand == "none")
            {
                strnd =" ";
            }
            else
            {
                strnd = edustrand;
            }
            return strnd;
        }

            private void HandleUserDataNotFound()
        {
            Response.Redirect("~/USER_INTERFACE/Login.aspx");
        }

        private void HandleInvalidUserId()
        {
            Response.Redirect("~/USER_INTERFACE/Login.aspx");
        }

        private void RedirectLogin()
        {
            Response.Redirect("~/USER_INTERFACE/Login.aspx");
        }

        // Remaining code...
    

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
            public string telnum { get; set; }
            public string molnum { get; set; }

            public string grdlevel { get; set; }
            public string educcategory { get; set; }
            public string grdstrand { get; set; }
        }

        private UserData GetUserById(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                S.STUD_ID,
                S.F_NAME,
                S.L_NAME,
                S.M_NAME,
                S.SUFFIX,
                S.LRN,
                S.POB,
                S.BD,
                S.GENDER,
                S.NTNLTY,
                S.RELIGION,
                S.ADDRESS,
                S.TP_NUM,
                S.MP_NUM,
                E.GRD_LEVEL,
                E.EDUC_TYPE,
                E.GRD_TRACK
            FROM 
                STUDENT S
            LEFT JOIN 
                EDUC_TYPE E ON S.STUD_ID = E.STUD_ID
            WHERE 
                S.STUD_ID = @UserId";

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
                                telnum = reader["TP_NUM"].ToString(),
                                molnum = reader["MP_NUM"].ToString(),
                                dob = reader["BD"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["BD"]),
                                grdlevel = reader["GRD_LEVEL"].ToString(),
                                educcategory = reader["EDUC_TYPE"].ToString(),
                                grdstrand = reader["GRD_TRACK"].ToString()
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
                Response.Redirect("~/USER_INTERFACE/Registrationform.aspx");
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                // Get the current user ID from the cookie
                if (Request.Cookies["UserId"] != null && int.TryParse(Request.Cookies["UserId"].Value, out int currentUserId))
                {
                    // Update the user status to 'pending'
                    UpdateUserStatus(currentUserId, "pending");
                }
                else
                {
                    // Handle invalid user ID in the cookie
                    Response.Redirect("~/USER_INTERFACE/Login.aspx");
                }
            }
        
    

        private void UpdateUserStatus(int userId, string newStatus)
            {
            string connectionString = ConfigurationManager.ConnectionStrings["Myconn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE STUDENT SET STATUS = @NewStatus WHERE STUD_ID = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@NewStatus", newStatus);
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        try
                        {
                            connection.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                // User status updated successfully
                                // You can display a message or perform additional actions if needed
                                Response.Redirect("~/USER_INTERFACE/Home.aspx");
                            }
                            else
                            {
                                // Update failed, show an error message
                                // You can handle this case as needed
                            }
                        }
                        catch (SqlException ex)
                        {
                            // Handle SQL exceptions
                            // You can log the exception or display an error message
                        }
                    }
                }
            }
        
    }
    
}