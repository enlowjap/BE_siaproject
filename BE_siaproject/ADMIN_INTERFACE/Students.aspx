<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Students" %>
<%@ Register Src="~/ADMIN_INTERFACE/header.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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

    .content {
        flex: 1;
        padding: 20px;
    }

    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
    }

    .grid-item {
        border: 1px solid #ddd;
        padding: 20px;
        text-align: center;
        background-color: white;
    }

    #GridViewDocuments {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    #GridViewDocuments th,
    #GridViewDocuments td {
        padding: 15px;
        border: 1px solid #ddd;
    }

    #GridViewDocuments th {
        background-color: #f2f2f2;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 sidebar">
        <a href="../ADMIN_INTERFACE/Dashboard.aspx"><i class="fas fa-home"></i>DASHBOARD</a>
        <a href="../ADMIN_INTERFACE/Students.aspx"><i class="fas fa-users"></i>STUDENT APPLICATIONS</a>
        <a href="../ADMIN_INTERFACE/Enrolled.aspx"><i class="fas fa-book-open"></i>ENROLLED STUDENT</a>
        <a href="#"><i class="fas fa-user-tie"></i>FACULTY TEACHERS</a>
        </div>
         <div class="col-md-10">
            <center>
                <h1>Enrolling Student</h1>
                <hr />
             <div class="container">
                            <div class="col-md-8">
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUD_ID" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="STUD_ID" HeaderText="STUD_ID" InsertVisible="False" ReadOnly="True" SortExpression="STUD_ID" />
                            <asp:BoundField DataField="L_NAME" HeaderText="L_NAME" SortExpression="L_NAME" />
                            <asp:BoundField DataField="F_NAME" HeaderText="F_NAME" SortExpression="F_NAME" />
                            <asp:BoundField DataField="EDUC_TYPE" HeaderText="EDUC_TYPE" SortExpression="EDUC_TYPE" />
                            <asp:BoundField DataField="GRD_LEVEL" HeaderText="GRD_LEVEL" SortExpression="GRD_LEVEL" />
                            <asp:BoundField DataField="GRD_TRACK" HeaderText="GRD_TRACK" SortExpression="GRD_TRACK" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server" Text="View" CommandName="ViewDetails" CommandArgument='<%# Bind("STUD_ID") %>' CssClass="btn btn-primary"  />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                  
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                  
                    </asp:GridView>
                    </div>
                
                <div class="col-md-8">
               <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="STUD_ID" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView2_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="STUD_ID" HeaderText="STUD_ID" InsertVisible="False" ReadOnly="True" SortExpression="STUD_ID" />
                            <asp:BoundField DataField="L_NAME" HeaderText="L_NAME" SortExpression="L_NAME" />
                            <asp:BoundField DataField="F_NAME" HeaderText="F_NAME" SortExpression="F_NAME" />
                            <asp:BoundField DataField="EDUC_TYPE" HeaderText="EDUC_TYPE" SortExpression="EDUC_TYPE" />
                            <asp:BoundField DataField="GRD_LEVEL" HeaderText="GRD_LEVEL" SortExpression="GRD_LEVEL" />
                            <asp:BoundField DataField="GRD_TRACK" HeaderText="GRD_TRACK" SortExpression="GRD_TRACK" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server" Text="View" CommandName="ViewDetails" CommandArgument='<%# Bind("STUD_ID") %>' CssClass="btn btn-primary"  />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                  
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                  
                    </asp:GridView>
                    </div>

                <div class="row-md-4">
                    
                <asp:CheckBoxList ID="CheckBoxListGradeLevels" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxListGradeLevels_SelectedIndexChanged" RepeatDirection="Vertical">
                    <asp:ListItem Text="Nursery" Value="nursery"/>
                    <asp:ListItem Text="Kinder 1" Value="k1" />
                    <asp:ListItem Text="Kinder 2" Value="k2" />
                    <asp:ListItem Text="Grade 1" Value="g1" />
                    <asp:ListItem Text="Grade 2" Value="g2" />
                    <asp:ListItem Text="Grade 3" Value="g3" />
                    <asp:ListItem Text="Grade 4" Value="g4" />
                    <asp:ListItem Text="Grade 5" Value="g5" />
                    <asp:ListItem Text="Grade 6" Value="g6" />
                    <asp:ListItem Text="Grade 7" Value="g7" />
                    <asp:ListItem Text="Grade 8" Value="g8" />
                    <asp:ListItem Text="Grade 9" Value="g9" />
                    <asp:ListItem Text="Grade 10" Value="g10" />
                    <asp:ListItem Text="Grade 11" Value="g11" />
                    <asp:ListItem Text="Grade 12" Value="g12" />
                </asp:CheckBoxList>
                        </div>
                <div>
                    <asp:CheckBoxList ID="CheckBoxListEduType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxListGradeLevels_SelectedIndexChanged" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Regular" Value="regular" />
                        <asp:ListItem Text="Homeschooling" Value="homeschooling" />
                        <asp:ListItem Text="Special Education" Value="specialeduc" />
                    </asp:CheckBoxList>
                </div>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Reload" OnClick="Button1_Click" CssClass="btn btn-succes" />
                <asp:Label ID="errorLabel" runat="server" Text="Label"></asp:Label>
            </div>
                    </center>
                </div>
            </div>
        </div>

    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Myconn %>"
        SelectCommand="SELECT STUDENT.STUD_ID, STUDENT.L_NAME, STUDENT.F_NAME, EDUC_TYPE.EDUC_TYPE, EDUC_TYPE.GRD_LEVEL, EDUC_TYPE.GRD_TRACK, STUDENT.STATUS 
                        FROM STUDENT 
                        INNER JOIN EDUC_TYPE ON STUDENT.STUD_ID = EDUC_TYPE.STUD_ID
                        WHERE STUDENT.STATUS = 'pending'">
    </asp:SqlDataSource>

   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Myconn %>"
    SelectCommand="SELECT
                    STUDENT.STUD_ID, STUDENT.L_NAME, STUDENT.F_NAME, EDUC_TYPE.EDUC_TYPE, EDUC_TYPE.GRD_LEVEL, EDUC_TYPE.GRD_TRACK, STUDENT.STATUS 
                FROM STUDENT 
                INNER JOIN EDUC_TYPE ON STUDENT.STUD_ID = EDUC_TYPE.STUD_ID
                WHERE
                    STUDENT.STATUS = 'pending' AND
                    ((@Nursery = 1 AND EDUC_TYPE.GRD_LEVEL = 'nursery' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@K1 = 1 AND EDUC_TYPE.GRD_LEVEL = 'k1' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@K2 = 1 AND EDUC_TYPE.GRD_LEVEL = 'k2' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G1 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g1' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G2 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g2' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G3 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g3' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G4 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g4' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G5 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g5' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G6 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g6' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G7 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g7' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G8 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g8' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G9 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g9' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G10 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g10' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G11 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g11' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1))
                    OR (@G12 = 1 AND EDUC_TYPE.GRD_LEVEL = 'g12' AND (@Regular = 1 OR @Homeschooling = 1 OR @SpecialEduc = 1)))">
  
    <SelectParameters>
        <asp:Parameter Name="Nursery" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="K1" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="K2" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G1" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G2" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G3" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G4" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G5" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G6" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G7" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G8" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G9" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G10" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G11" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="G12" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="Regular" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="Homeschooling" Type="Boolean" DefaultValue="False" />
        <asp:Parameter Name="SpecialEduc" Type="Boolean" DefaultValue="False" />
        
    </SelectParameters>
</asp:SqlDataSource>
</body>
</html>
