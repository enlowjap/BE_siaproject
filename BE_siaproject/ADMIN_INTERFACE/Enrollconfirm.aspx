<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enrollconfirm.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Enrollconfirm" %>
<%@ Register Src="~/ADMIN_INTERFACE/header.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            font-family:Arial;
            background:url('../images_user/verificationpic.png');
            background-size:cover;
        }
        h1 {
         font-size: 50px;
         color: #ff0000;
         margin-bottom: 20px;
         margin-top:10px;
}

        p {
        font-size: 16px;
         color: #666;
        padding-top: -100px;
        margin-bottom: 40px;
}
        .container {
        text-align: center;
        padding: 20px;
}
        .check-icon {
        color: #28a745;
        font-size: 22px;
        }

        .reload-icon {
         color: #000000;
         font-size: 50px;
         margin-top: 20px;
        }

        .bttnn{
            background-color: #E22529;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .bttnn:hover{
            background-color:white;
            color: #E22529;
            border:2px solid #E22529;
        }

        .bttn{
            background-color: #053989;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .bttn:hover{
            background-color: #ff0000;
        }

    </style>
       
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
         <div>
             <div class="container">
         <div class="check-icon">
        
              </div>
        <h1>Are you sure?</h1>
        <p>You are going to Enrolled the student.</p>
        
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CssClass="bttn" />
        <asp:Button ID="Button1" runat="server" Text="Proceed" OnClick="Button1_Click" CssClass="bttnn" />
    </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
