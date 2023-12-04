using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace BE_siaproject.ADMIN_INTERFACE
{
    public partial class Students : System.Web.UI.Page
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
                            // Set the data source for the GridView
                            GridView1.DataSource = SqlDataSource1;
                            // Bind the GridView on initial page load
                            GridView1.DataBind();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            // Rebind the GridView with the updated page index
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            // Rebind the GridView with the updated page index
            GridView2.DataSource = SqlDataSource1;
            GridView2.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Retrieve the STUD_ID from the CommandArgument
                int studId = Convert.ToInt32(e.CommandArgument);

                // Redirect or perform any other action based on the STUD_ID
                Response.Redirect($"ViewDetailsPage.aspx?studId={studId}");
            }
        }

        protected void CheckBoxListGradeLevels_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset parameters
            foreach (var parameter in SqlDataSource2.SelectParameters)
            {
                if (parameter is Parameter)
                {
                    (parameter as Parameter).DefaultValue = "False";
                }
            }

            // Set parameters based on selected checkboxes
            foreach (ListItem item in CheckBoxListGradeLevels.Items)
            {
                switch (item.Value)
                {
                    case "nursery":
                    case "k1":
                    case "k2":
                    case "g1":
                    case "g2":
                    case "g3":
                    case "g4":
                    case "g5":
                    case "g6":
                    case "g7":
                    case "g8":
                    case "g9":
                    case "g10":
                    case "g11":
                    case "g12":
                        // Add cases for other grade levels
                        SqlDataSource2.SelectParameters[item.Value].DefaultValue = item.Selected.ToString();
                        break;
                }
            }

            // Set parameters based on selected checkboxes in CheckBoxListEduType
            foreach (ListItem item in CheckBoxListEduType.Items)
            {
                switch (item.Value)
                {
                    case "regular":
                    case "homeschooling":
                    case "specialeduc":
                        SqlDataSource2.SelectParameters[item.Value].DefaultValue = item.Selected.ToString();
                        break;
                }
            }

            

            
            GridView2.DataSource = SqlDataSource2;
            GridView2.DataBind();
            GridView1.Visible = false;
            
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0 && GridView1.DataSourceID.Length > 0)
            {
                ShowError("No data found for the GridView.");
            }
        }

        // Similar modifications for other GridView events

        private void ShowError(string message)
        {
            // You can use a label or another control to display the error message
            errorLabel.Text = message;
            errorLabel.Visible = true;

            // You may also want to log the error for further investigation
        }


        // Assuming you have a UserData class to store user data
        public class UserData
        {
            public int UserId { get; set; }
            public string Username { get; set; }
            // Add other properties as per your database schema
        }

        // Method to retrieve user data from the database based on user ID
        private UserData GetUserById(int userId)
        {

            string connectionString = "Data Source=JAPHET;Initial Catalog=siadb;Integrated Security=True";

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
            Response.Redirect("~/ADMIN_INTERFACE/Students.aspx");//reload button
        }
    }
}