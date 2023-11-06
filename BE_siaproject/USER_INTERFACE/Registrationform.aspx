<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrationform.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Registrationform" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader_h.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        body{
            font-family:Arial;
            margin:0;
            padding:0;
        }
                .menu-header {
                    margin:0;
                    padding:0;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    background-color: white;
                    border-bottom:1px solid #808080;
        }

        .registration {
            margin-left: auto; /* Align to the flex end */
            padding:0 15px 0 0;
        }
        .tab1{
            text-decoration:none;
            background-color:#0289CE;
            margin-right:15px;
            margin:0 0 0 10px;
            padding:15px 15px 25px 15px;
            border-radius:3px 3px 0 0;
            color:white;
            cursor:pointer;
        }

        .tab2{
            text-decoration:none;
            margin-right:15px;
            margin:0;
            padding:15px 15px 25px 15px;
            border-radius:3px 3px 0 0;
            color:#0289CE;
            cursor:pointer;
            transition: border 0.3s ease, background 0.3s ease;
        }

        .tab2:hover{
            background-color:azure;
        }

        .cont{
            display:flex;
            justify-content:center;
            align-items:center;
        }
        .frmcont{
            margin:30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding:25px;
            border-radius:15px;
        }

        .h{
            font-weight:bold;
        }

        .submitbttn{
                background-color:#E22529;
                border:none;
                height:30px;
                width:90px;
                border-radius:15px;
                color:white;
                cursor:pointer;
                transition: background-color 0.5s ease, color 0.5s ease, border 0.5s ease;
        }

        .submitbttn:hover{
                background-color:white;
                color: #E22529;
                border:2px solid #E22529;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
        <div class="menu-header">
    <div class="tab1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registrationform.aspx">Personal Information</asp:HyperLink>
    </div>
    <div class="tab2">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/document.aspx">Submit Documents</asp:HyperLink>
    </div>
    <div class="registration">
        <p>REGISTRATION</p>
    </div>
            </div>

        <div class="cont">
        <div class="frmcont">
            <table>
                <tr>
                    <td><h1 class="h">Student Details</h1></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="txtFullName" runat="server" Text="SURNAME"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox1" runat="server" Text="FIRSTNAME"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" Text="MIDDLENAME"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox3" runat="server" Text="SUFFIX"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                    <td>Place of birth:</td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td>Date of birth:</td>
                    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                    <td>Nationality:</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                    <td>Religion:</td>
                    <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>Email Address:</td>
                    <td><asp:TextBox ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Telephone No.:</td>
                    <td><asp:TextBox ID="TextBox10" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>Mobile No.:</td>
                    <td><asp:TextBox ID="TextBox11" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="submitbttn" OnClick="Button1_Click" />
            
    </div>
    </div>
    </form>
</body>
</html>
