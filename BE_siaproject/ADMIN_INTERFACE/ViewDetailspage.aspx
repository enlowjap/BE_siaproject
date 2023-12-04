<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetailspage.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.ViewDetailspage" %>
<%@ Register Src="~/ADMIN_INTERFACE/header.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .sidebar {
            height: 100vh;
            width: 250px;
            top: 10px;
            left: 0;
            background-color: white;
            padding-top: 20px;
            box-shadow: -10px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            padding: 8px 8px 8px 4px; /* Added more left padding for icons */
            text-decoration: none;
            font-size: 15px;
            font-family:Arial;
            color: #AD0005;
            display: block;
            transition: 0.3s ease;
            background: url('path_to_your_icon.png') no-repeat left center; 
        }
        
        .sidebar a i {
            margin-right: 10px;
            font-size: 28px;
        }

        .sidebar a:hover {
            font-weight:bolder;
            background-color: #F8DFE0;
            color:darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <uc:Header runat="server" ID="Header1" />
        <div class="sidebar">
        <a href="../ADMIN_INTERFACE/Dashboard.aspx"><i class="fas fa-home"></i>DASHBOARD</a>
        <a href="../ADMIN_INTERFACE/Students.aspx"><i class="fas fa-users"></i>STUDENT APPLICATIONS</a>
        <a href="../ADMIN_INTERFACE/Enrolled.aspx"><i class="fas fa-book-open"></i>ENROLLED STUDENT</a>
        <a href="#"><i class="fas fa-user-tie"></i>FACULTY TEACHERS</a>
        </div>


         <div>
            <!-- Add controls to display student details here -->
             <asp:Label ID="lblLastName" runat="server" ></asp:Label>
            <asp:Label ID="lblFirstName" runat="server" ></asp:Label>
            <asp:Label ID="lblMiddlename" runat="server" ></asp:Label>
            <!-- Add other labels for remaining details -->
        </div>


        <div>
    <h2>Submitted Documents</h2>
    <asp:GridView ID="GridViewDocuments" runat="server" AutoGenerateColumns="False" DataKeyNames="DOC_ID" OnRowCommand="GridViewDocuments_RowCommand" >
        <Columns>
            <asp:BoundField DataField="DOC_NAME" HeaderText="Document Name" SortExpression="DOC_NAME" />
            <asp:BoundField DataField="DOC_TYPE" HeaderText="Document Type" SortExpression="DOC_TYPE" />
            
            <asp:TemplateField HeaderText="View Document">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkViewDocument" runat="server" Text="View" CommandName="ViewDocument" CommandArgument='<%# Bind("DOC_ID") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Enrolled" OnClick="Button1_Click" />
</div>
        <asp:Label ID="error" runat="server" ></asp:Label>
    </form>
</body>
</html>
