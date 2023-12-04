<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Document.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Document" %>
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
            margin-right:15px;
            margin:0 0 0 10px;
            padding:15px 15px 25px 15px;
            border-radius:3px 3px 0 0;
            cursor:pointer;
            transition: border 0.3s ease, background 0.3s ease;
        }
        .hypr1{
            color:#0289CE;
            text-decoration:none;
        }

        .tab2{
            margin-right:15px;
            margin:0;
            padding:15px 15px 25px 15px;
            border-radius:3px 3px 0 0;
            cursor:pointer;
            background-color:#0289CE;
        }
        .hypr{
            color:white;
            text-decoration:none;
        }

        .tab1:hover{
            background-color:azure;
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
                    <asp:HyperLink ID="HyperLink1" runat="server"  CssClass="hypr1">Personal Information</asp:HyperLink>
                </div>
                <div class="tab2">
                    <asp:HyperLink ID="HyperLink2" runat="server"  CssClass="hypr">Submit Documents</asp:HyperLink>
                </div>
                <div class="registration">
                    <p>REGISTRATION</p>
                </div>
                </div>



                <div class="card">
                <div class="card-body">
                <h4 class="card-title"></h4>
                <p class="card-description">
                        Submit Document
                 </p>
                    <div class="table-responsive">
                        <table class="table">
                        <thead>
                        <tr>
                            <th>Document Type</th>
                            <th>File Name</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td>Medical Certificate</td>
                        <td><asp:Label ID="medfilename" runat="server" ></asp:Label></td>
                        <td><asp:FileUpload ID="medfile" runat="server" /></td>
                        <td></td>
                        <td></td>
                       
                    </tr>
                    <tr>
                        <td>Report Card</td>
                        <td><asp:Label ID="cardfilename" runat="server" ></asp:Label></td>
                        <td><asp:FileUpload ID="cardfile" runat="server" /></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        
                        <td>Birth Certificate</td>
                        <td><asp:Label ID="bocfilename" runat="server" ></asp:Label></td>
                        <td><asp:FileUpload ID="bcfile" runat="server" /></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><asp:Button ID="Button6" runat="server" Text="Upload" CssClass="submitbttn" OnClick="Button4_Click" /></td>
                        <td><asp:Label ID="Label5" runat="server" ></asp:Label></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        
                    </tr>
               
            </tbody>
            </table>
             <asp:Button ID="Button5" runat="server" Text="Back" CssClass="submitbttn" OnClick="Button5_Click" />
             <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="submitbttn" OnClick="Button2_Click" />
            </div>
            </div>
            </div>
    </form>
</body>
</html>
