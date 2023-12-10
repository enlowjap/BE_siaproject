<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enrolled.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Enrolled" %>
<%@ Register Src="~/ADMIN_INTERFACE/header.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .sidebar {
        height: 100%;
        width: 250px;
        background-color: white;
        box-shadow: -10px 0 10px rgba(0, 0, 0, 0.1);
        overflow-y: auto;
    }

    .sidebar a {
        padding: 15px;
        text-decoration: none;
        font-size: 16px;
        color: #606060;
        display: flex;
        align-items: center;
        transition: 0.3s ease;
    }

    .sidebar a i {
        margin-right: 10px;
        font-size: 20px;
    }

    .sidebar a:hover {
        background-color: #F8DFE0;
        color: darkred;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
        
        
        <div class="col-md-2 sidebar">
        <a href="../ADMIN_INTERFACE/Dashboard.aspx"><i class="fas fa-home"></i>DASHBOARD</a>
        <a href="../ADMIN_INTERFACE/Students.aspx"><i class="fas fa-users"></i>STUDENT APPLICATIONS</a>
        <a href="../ADMIN_INTERFACE/Enrolled.aspx"><i class="fas fa-book-open"></i>ENROLLED STUDENT</a>
        <a href="#"><i class="fas fa-user-tie"></i>FACULTY TEACHERS</a>
        </div>

        <h1>ENROLLED STUDENT</h1>
        <div>
            <asp:Label ID="hsTotal" runat="server" Text="HOMESCHOOLING Enrolled: Total "></asp:Label>
            <asp:DropDownList ID="hsDrpList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="hsDrpList_SelectedIndexChanged">
                <asp:ListItem Selected="True">Grade Level</asp:ListItem>
                <asp:ListItem Value="nursery">Nursery</asp:ListItem>
                <asp:ListItem Value="k1">Kinder 1</asp:ListItem>
                <asp:ListItem Value="k2">Kinder 2</asp:ListItem>
                <asp:ListItem Value="g1">Grade 1</asp:ListItem>
                <asp:ListItem Value="g2">Grade 2</asp:ListItem>
                <asp:ListItem Value="g3">Grade 3</asp:ListItem>
                <asp:ListItem Value="g4">Grade 4</asp:ListItem>
                <asp:ListItem Value="g5">Grade 5</asp:ListItem>
                <asp:ListItem Value="g6">Grade 6</asp:ListItem>
                <asp:ListItem Value="g7">Grade 7</asp:ListItem>
                <asp:ListItem Value="g8">Grade 8</asp:ListItem>
                <asp:ListItem Value="g9">Grade 9</asp:ListItem>
                <asp:ListItem Value="g10">Grade 10</asp:ListItem>
                <asp:ListItem Value="g11">Grade 11</asp:ListItem>
                <asp:ListItem Value="g12">Grade 12</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="hsgrdLvlTotal" runat="server" Text="Total Enrolled : "></asp:Label>
        </div>

         <div>
            <asp:Label ID="rgTotal" runat="server" Text="REGULAR Enrolled: Total "></asp:Label>
            <asp:DropDownList ID="rgDrpList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rgDrpList_SelectedIndexChanged">
                <asp:ListItem Selected="True">Grade Level</asp:ListItem>
                <asp:ListItem Value="nursery">Nursery</asp:ListItem>
                <asp:ListItem Value="k1">Kinder 1</asp:ListItem>
                <asp:ListItem Value="k2">Kinder 2</asp:ListItem>
                <asp:ListItem Value="g1">Grade 1</asp:ListItem>
                <asp:ListItem Value="g2">Grade 2</asp:ListItem>
                <asp:ListItem Value="g3">Grade 3</asp:ListItem>
                <asp:ListItem Value="g4">Grade 4</asp:ListItem>
                <asp:ListItem Value="g5">Grade 5</asp:ListItem>
                <asp:ListItem Value="g6">Grade 6</asp:ListItem>
                <asp:ListItem Value="g7">Grade 7</asp:ListItem>
                <asp:ListItem Value="g8">Grade 8</asp:ListItem>
                <asp:ListItem Value="g9">Grade 9</asp:ListItem>
                <asp:ListItem Value="g10">Grade 10</asp:ListItem>
                <asp:ListItem Value="g11">Grade 11</asp:ListItem>
                <asp:ListItem Value="g12">Grade 12</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="rggrdLvlTotal" runat="server" Text="Total Enrolled : "></asp:Label>
        </div>

        <div>
            <asp:Label ID="spedTotal" runat="server" Text="SPED Enrolled: Total "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Selected="True">Grade Level</asp:ListItem>
                <asp:ListItem Value="nursery">Nursery</asp:ListItem>
                <asp:ListItem Value="k1">Kinder 1</asp:ListItem>
                <asp:ListItem Value="k2">Kinder 2</asp:ListItem>
                <asp:ListItem Value="g1">Grade 1</asp:ListItem>
                <asp:ListItem Value="g2">Grade 2</asp:ListItem>
                <asp:ListItem Value="g3">Grade 3</asp:ListItem>
                <asp:ListItem Value="g4">Grade 4</asp:ListItem>
                <asp:ListItem Value="g5">Grade 5</asp:ListItem>
                <asp:ListItem Value="g6">Grade 6</asp:ListItem>
                <asp:ListItem Value="g7">Grade 7</asp:ListItem>
                <asp:ListItem Value="g8">Grade 8</asp:ListItem>
                <asp:ListItem Value="g9">Grade 9</asp:ListItem>
                <asp:ListItem Value="g10">Grade 10</asp:ListItem>
                <asp:ListItem Value="g11">Grade 11</asp:ListItem>
                <asp:ListItem Value="g12">Grade 12</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="spedgrdLvlTotal" runat="server" Text="Total Enrolled : "></asp:Label>
        </div>




    </form>
</body>
</html>
