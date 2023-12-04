<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Home" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader_h.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background:url('../images_user/picdhome.png');
            background-size:cover;
        }

        .sidebar {
            height: 100vh;
            width: 200px;
            top: 50px;
            left: 0;
            background-color: white;
            padding-top: 20px;
            box-shadow: -10px 0 10px rgba(0, 0, 0, 0.1);  
        }

        .sidebar-a {
            padding: 8px 8px 8px 4px; /* Added more left padding for icons */
            text-decoration: none;
            font-size: 18px;
            font-family: Arial;
            color: #AD0005;
            display: block;
            transition: 0.3s ease;
        }

        .sidebar-a i {
            margin-right: 10px; /* Add space between icon and text */
        }

        .sidebar-a:hover {
            font-weight: bolder;
            background-color: #F8DFE0;
            color: darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
       <div>
            <div class="sidebar">
                <asp:HyperLink ID="HyperLinkHome" runat="server" CssClass="sidebar-a" NavigateUrl="~/USER_INTERFACE/Home.aspx">
                    <i class="fas fa-home"></i> Home
                </asp:HyperLink>

                <asp:HyperLink ID="HyperLinkDashboard" runat="server" CssClass="sidebar-a" NavigateUrl="~/USER_INTERFACE/Dashboard.aspx">
                    <i class="fas fa-chart-bar"></i> Dashboard
                </asp:HyperLink>

                <asp:HyperLink ID="HyperLinkStudentProfile" runat="server" CssClass="sidebar-a" NavigateUrl="#">
                    <i class="fas fa-user"></i> Student Profile
                </asp:HyperLink>

                <asp:HyperLink ID="HyperLinkSchoolReceipt" runat="server" CssClass="sidebar-a" NavigateUrl="#">
                    <i class="fas fa-receipt"></i> School Receipt
                </asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
