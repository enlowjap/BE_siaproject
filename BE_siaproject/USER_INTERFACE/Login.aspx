<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Login" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        body{
            margin:0;
            font-family:Arial;
            background:url('../images_user/Loginpic2.png');
            background-size:cover;
        }

         .welcome-message {
            max-width: 450px;
            margin: 0 auto;
            margin-left: 700px;
            padding: 20px;  
            
}

            .welcome-message h2 {
                font-size:70px;
                font-family: 'Franklin Gothic';
                font-weight:bolder;
                color: black;
                text-align: center;
                margin-bottom: 10px;
            }

            .welcome-message p {
                 background: #DFFAF1; 
                 border: 2px solid #079565; 
                font-size: 16px;
                color: #555555;
                text-align: center;
                margin-bottom: 20px;
            }
         

          .login-form {
            max-width: 450px;
            margin: 0 auto;
            padding: 20px;
            margin-left: 700px;
}

            .login-form input {
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

            .bttn {
    width: 100%;
    padding: 10px;
    background: #4caf50;
    border: none;
    border-radius: 5px;
    color: #ffffff;
    cursor: pointer;
}
            .login-form label {
             display: block;
             margin-bottom: 10px;
             font-weight: bold;
}
            .bttn:hover {
            background: #45a049;
}
           .seepass {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
}

.seepass input {
    margin-right: 10px; /* Add some spacing between the checkbox and the label */
    padding:0;
    width:25px;
}

.seepass label {
    margin: 0; /* Remove any default margin for the label */
     padding:0;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
                  <div class="welcome-message">
                <h2>Login Here</h2>
                    </div>
                    <div class="login-form">
                    <label for="emil">Email:</label>

                  <asp:TextBox ID="txtUsername" runat="server" CssClass="inputbox" onfocus="clearTextBox(this)"></asp:TextBox>
                    <label for="password">Password:</label>

                 <asp:TextBox ID="txtboxpassword" runat="server" CssClass="inputbox" onfocus="clearTextBox(this)" TextMode="Password"></asp:TextBox>

                        <div class="seepass">
                            <input type="checkbox" id="chkSeePassword" onclick="togglePassword()" />
                              <label for="chkSeePassword">See Password</label>

                        </div>
                        <br />

                <asp:Button ID="Button1" runat="server" Text="Log In" CssClass="bttn" OnClientClick="return submitForm();" OnClick="Button1_Click" />

                        <script type="text/javascript">

                            function togglePassword() {
                                var passwordTextBox = document.getElementById('<%= txtboxpassword.ClientID %>');
                                var checkbox = document.getElementById('chkSeePassword');

                                if (checkbox.checked) {
                                    passwordTextBox.type = 'text';
                                } else {
                                    passwordTextBox.type = 'password';
                                }
                            }


                            function clearTextBox(textBox) {
                                if (textBox.value === textBox.defaultValue) {
                                    textBox.value = '';
                                }
                            }
                        </script>
                        <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>
        </div>  
    </form>
</body>
</html>
