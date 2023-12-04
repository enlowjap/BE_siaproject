<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Summary" %>
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
                    <asp:HyperLink ID="HyperLink1" runat="server"  CssClass="hypr1">Summary</asp:HyperLink>
         </div>
             <div class="registration">
                    <p>Please review before fully submitting</p>
             </div>
         </div>
        <div class="table-responsive">
                        <table class="table">
                        <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
            </thead>
            <tbody>
                     <tr>
                        <td>Education Category :</td>
                        <td><asp:Label ID="lblctgry" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Grade Level :</td>
                        <td> <asp:Label ID="lblgrdlevel" runat="server" ForeColor="Gray"></asp:Label></td> 
                        <td> <asp:Label ID="lblstrand" runat="server" ForeColor="Gray"></asp:Label></td> 
                    </tr>
                    <tr>
                        <td>Name :</td>
                        <td><asp:Label ID="lbllname" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td><asp:Label ID="lblfname" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td> <asp:Label ID="lblmname" runat="server" ForeColor="Gray"></asp:Label></td> 
                        <td> <asp:Label ID="lblsuffix" runat="server" ForeColor="Gray"></asp:Label></td> 
                    </tr>
                     <tr>
                        <td> </td>
                        <td><asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label></td>
                        <td><asp:Label ID="Label2" runat="server"  Text="First Name"></asp:Label></td>
                        <td> <asp:Label ID="Label3" runat="server"  Text="Middle Name"></asp:Label></td> 
                        <td> <asp:Label ID="Label4" runat="server" Text="Suffix"></asp:Label></td> 
                    </tr>
                    <tr>
                        <td>LRN :</td>
                        <td><asp:Label ID="lbllrnnum" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Email :</td>
                        <td> <asp:Label ID="lblemail" runat="server" ForeColor="Gray"></asp:Label></td> 
                    </tr>
                    <tr>
                        <td>Date of Birth :</td>
                        <td><asp:Label ID="lbldob" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Place of Birth :</td>
                        <td> <asp:Label ID="lblpob" runat="server" ForeColor="Gray"></asp:Label></td> 
                    </tr>
                    <tr>
                        <td>Gender :</td>
                        <td><asp:Label ID="lblgendet" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Nationality :</td>
                        <td> <asp:Label ID="lblnationlty" runat="server" ForeColor="Gray"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Religion :</td>
                        <td><asp:Label ID="lblreligion" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Address :</td>
                        <td><asp:Label ID="lbladdress" runat="server" ForeColor="Gray"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Mobile :</td>
                        <td><asp:Label ID="lblm" runat="server" ForeColor="Gray"></asp:Label></td>
                        <td>Telephone :</td>
                        <td><asp:Label ID="lblt" runat="server" ForeColor="Gray"></asp:Label></td>
                    </tr>
                </tbody>
                </table>
            <asp:Button ID="Button2" runat="server" Text="Back" CssClass="submitbttn" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="submitbttn" OnClick="Button1_Click" />
            </div>
    </form>
</body>
</html>
