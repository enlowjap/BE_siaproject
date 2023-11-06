<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.SignUp" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Create Account</title>
    
    <style type="text/css">
        body {
            background:url('images_user/LogInpic.png');
            background-size: cover;        
        }
         h1 {
          font-family: 'Segoe UI';
          color: #000000;
          font-size: 50px; 
          font-weight: bolder;
          margin-bottom: 20px;
           margin-top: 25px;
          
  }
    
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            margin-left: 80px;
            padding: 20px;  

        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;

        }

        .form-group-name {
            margin-bottom: 20px;
            display: column;
            flex-direction: row;
            justify-content: center;
            align-items: center;

        }

        .form-group label {
            font-family: 'Times New Roman';
            font-size: 16px;
            display: inline-block;
            width: 120px;

        }

        .txtbox{
            width: calc(100% - 120px);
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: inline-block;
        }

        .listbx{
            width: calc(100% - 120px);
            padding: 10px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: inline-block;
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

            <div class="form-container">
                 <h1>Create Account</h1> 
                <div class="form-group"> 
                    <label for="studentId">STUDENT ID</label>

                    <asp:TextBox ID="studID" runat="server" Text="00-000" ReadOnly="True" CssClass="txtbox"></asp:TextBox>

                </div>
                <div class="form-group-name">
                    <label for="fullName">FULL NAME</label>
                    <br />
                    <asp:TextBox ID="txtLastN" runat="server" placeholder="Last Name" CssClass="txtbox"></asp:TextBox>
               
                    <asp:TextBox ID="txtFirstN" runat="server" placeholder="First Name" CssClass="txtbox"></asp:TextBox>
                
                    <asp:TextBox ID="txtMiddleN" runat="server" placeholder="Middle Name"  CssClass="txtbox"></asp:TextBox>

                    <asp:TextBox ID="txtSuffix" runat="server" placeholder="Suffix" CssClass="txtbox"></asp:TextBox>
                
                </div>
                <div class="form-group">
                    <label for="email">EMAIL</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="janedoe@gmail.com" CssClass="txtbox"></asp:TextBox>
                </div>

                 <div class="form-group">
                    <label for="email">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="" CssClass="txtbox"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="password">PASSWORD</label>
                     <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">RE-TYPE PASSWORD</label>
                     <asp:TextBox ID="txtRePasword" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                
                </div>
                <div class="form-group">
                    <label for="gender">GENDER</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="listbx">
                        <asp:ListItem Value="--"></asp:ListItem>
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:DropDownList>

                </div>
              <div class="form-group">
    
       <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="bttn" OnClientClick="return submitForm();" OnClick="Button1_Click" />
        <asp:Label ID="errorLabel" runat="server" ></asp:Label>
              
    <script type="text/javascript">
        function submitForm() {
            window.location.href = 'Verification.aspx'; 
            return true;
        }
    </script>
    </div>
     </div>
    </form>
</body>
</html>
