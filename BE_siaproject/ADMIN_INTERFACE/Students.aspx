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
            background:url('../pictures_admin/dash.png');
            background-size:cover;
        }

     .sidebar {
            height: 120vh;
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
        
    .student i,
    .teacher i,
    .subject i {
    font-size: 40px;
    color:darkred;
}
    
   .content {
    margin-top:-700px;
    padding-left:280px;
}

            .h1, h1 {
    font-size: 36px;
    font-family:'Franklin Gothic Medium';
    color:white;
    max-width: 400px;
}
          
/* GridView Style */
#GridView1 {
  width: 95%;
  border-collapse: collapse;
  margin-top: 20px;
}

/* Alternating row style */
#GridView1 tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Header style */
#GridView1 th {
  background-color: #3498db;
  color: white;
  padding: 12px;
  text-align: center; /* Center the text in header cells */
}

/* Cell style */
#GridView1 td {
  padding: 10px;
  border: 1px solid #ddd;
  text-align: center; /* Center the text in data cells */
}

/* Action button style */
#GridView1 .btnView {
  background-color: #4caf50;
  color: white;
  padding: 8px 12px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#GridView1 .btnView:hover {
  background-color: #45a049;
}



/* Style for CheckBoxList items */
.grade-levels input,
.edu-types input {
  display: none; /* Hide the actual checkbox */
}

.grade-levels label {
  position: relative;
  display: inline-block;
  margin-right: 5px;
  margin-bottom: 5px;
  padding: 8px 12px;
  border: 2px solid #3498db;
  border-radius: 8px;
  background-color: #3498db;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
  text-align: center;
  font-size: 12px;
}

.edu-types label {
  position: relative;
  display: inline-block;
  margin-right: 15px;
  margin-bottom: 10px;
  padding: 12px 18px;
  border: 2px solid #3498db;
  border-radius: 8px;
  background-color: #3498db;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s, color 0.3s;
  text-align: center;
}

/* Pseudo-element for the check mark inside selected items */
.grade-levels input:checked + label::before,
.edu-types input:checked + label::before {
  content: '\2713'; /* Unicode check mark character */
  position: absolute;
  bottom: 5px;
  left: 5px;
  font-size: 18px;
}

/* Hover effect for CheckBoxList items */
.grade-levels label:hover,
.edu-types label:hover {
  background-color: #2980b9;
}

/* Checked state style for CheckBoxList items */
.grade-levels input:checked + label,
.edu-types input:checked + label {
  background-color: #2c3e50;
  border-color: #2c3e50;
  color: #fff;
}

.Category2 {
 
  margin-top:-140px;
  padding-left:280px;
  
}
.Category1
{
 
  margin-top:-300px;
  padding-left:280px;
  
}

 .label {

      font-size: 18px;
      font-weight: bold;
      margin-top: 20px;
      padding-left:10px;
      line-height: 8;
    }

    .reload-container {
        position: fixed;
        bottom: 0;
        right: 0;
        margin: 10px;
        text-align: right;
    }

    .btn {
        /* Add your button styling here */
        padding: 10px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }


    #errorLabel {
        /* Add your label styling here */
        color: white;
        margin-top: 10px;
        display: block;
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
                </div>

         <div class="content">
                <h1>List of Enrolling Student</h1>
                <hr />        

               <asp:GridView ID="GridView1" runat="server" CssClass="GridView1" AutoGenerateColumns="False" DataKeyNames="STUD_ID" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="STUD_ID" HeaderText="Student ID" InsertVisible="False" ReadOnly="True" SortExpression="STUD_ID" />
                            <asp:BoundField DataField="L_NAME" HeaderText="Last Name" SortExpression="L_NAME" />
                            <asp:BoundField DataField="F_NAME" HeaderText="First Name" SortExpression="F_NAME" />
                            <asp:BoundField DataField="EDUC_TYPE" HeaderText="Educational Programs" SortExpression="EDUC_TYPE" />
                            <asp:BoundField DataField="GRD_LEVEL" HeaderText="Grade Level" SortExpression="GRD_LEVEL" />
                            <asp:BoundField DataField="GRD_TRACK" HeaderText="Grade Track" SortExpression="GRD_TRACK" />
                            <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server" Text="View" CommandName="ViewDetails" CommandArgument='<%# Bind("STUD_ID") %>' CssClass="btn btn-primary"  />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                       </asp:GridView>
                    </div>
    
               <asp:GridView ID="GridView2" runat="server" CssClass="GridView2" AutoGenerateColumns="False" DataKeyNames="STUD_ID" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView2_PageIndexChanging">
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
                    </asp:GridView>
             </div>



        
             
 <div class="Category">
      <div class="Category1">
          <div class="label">Select an educational program to view</div>
                <asp:CheckBoxList ID="CheckBoxListGradeLevels" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxListGradeLevels_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="grade-levels">   
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
                    </asp:CheckBoxList>

                <asp:CheckBoxList ID="CheckBoxListMoreGrades" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxListGradeLevels_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="grade-levels">   
                    
                    <asp:ListItem Text="Grade 9" Value="g9" />
                    <asp:ListItem Text="Grade 10" Value="g10" />
                    <asp:ListItem Text="Grade 11" Value="g11" />
                    <asp:ListItem Text="Grade 12" Value="g12" />
                </asp:CheckBoxList>
                        </div>
     </div>

        

                <div class="Category2">
                    <asp:CheckBoxList ID="CheckBoxListEduType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxListGradeLevels_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="edu-types">
                         
                        <asp:ListItem Text="Regular" Value="regular" />
                        <asp:ListItem Text="Homeschooling" Value="homeschooling" />
                        <asp:ListItem Text="Special Education" Value="specialeduc" />
                    </asp:CheckBoxList>
                </div>

               <div class="reload-container">
                <asp:Button ID="Button1" runat="server" Text="Reload" OnClick="Button1_Click" CssClass="btn btn-succes" />
                <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>
       </div>
        


<script>
    // Add event listener to handle click on labels
    document.addEventListener('DOMContentLoaded', function () {
        var gradeLabels = document.querySelectorAll('.grade-levels label');
        var eduLabels = document.querySelectorAll('.edu-types label');

        function handleLabelClick(labels) {
            labels.forEach(function (label) {
                label.addEventListener('click', function () {
                    this.querySelector('input').click(); // Simulate click on the hidden checkbox
                });
            });
        }

        handleLabelClick(gradeLabels);
        handleLabelClick(eduLabels);
    });
</script>




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
