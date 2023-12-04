using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE_siaproject.USER_INTERFACE
{
    public partial class Landingheader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void clickeve_acad(object sender, EventArgs e)
        {
            Response.Redirect("Academicpg1.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        protected void loginb(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void signupb(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}