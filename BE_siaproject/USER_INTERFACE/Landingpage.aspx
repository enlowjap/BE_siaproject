<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Landingpage" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        body{
            margin:0;
            font-family:Arial;
            background:url('../images_user/background1.jpg');
            background-size:cover;
        }
        .auto-style1 {
            width: 161px;
            height: 38px;
        }

        .container{
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100vh;
        }
        h1 {
            font-family:'Segoe UI';
            font-weight:bolder;
            font-size: 48px;
            line-height: .5; 
        }

        p {
            text-indent: 80px;
            font-family:'Times New Roman';
            font-size: 20px;
        }

        .cont {
                    display: flex;
                    flex-direction:column;
                    align-items: center;
                    width: 47%; 
                    max-width: 1200px; 

               }
        .about_img{
            vertical-align:top;
            padding-left:10px;
            height:20px;
            width:20px;
            object-fit:fill;
        }

        .about{
            cursor:pointer;
            background-color:yellow;
            padding:10px;
        }

        .hypr{
            text-decoration:none;
        }

        .auto-style2 {
            width: 512px;
            height: 512px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
         <div class="container">
        <div class="cont">
        <div>
            <h1>WELCOME TO HOPE</h1>
            <h1>INTEGRATED SCHOOL</h1>
            <p>We are SMART. We are KIND. We are HIS.</p>
        </div>
        <div class="about">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/USER_INTERFACE/About.aspx" CssClass="hypr">
             About<img alt="arrow" class="about_img" src="../images_user/rightarrowinsideacircle_122006.png" />
            </asp:HyperLink>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
