<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
             background:url('../pictures_admin/admin.png');
             background-size:cover;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            margin-top:150px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 5px;
            font-size: 14px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: red;
            color: #fff;
            border: none;
            font-size: 16px;
        }
        
         .bttn {
    width: 100%;
    padding: 10px;
    font-family: 'Franklin Gothic';
    background: red;
    border: none;
    border-radius: 5px;
    color: black;
    cursor: pointer
        }
        .bttn:hover {
        background: blue;
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
         <div class="container">
        <h2>Admin Panel Login</h2>
        
            <div class="form-group">
                <label for="username">Username:</label>
                <asp:TextBox ID="username" runat="server" placeholder="Enter Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <asp:TextBox ID="password" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>

                <div class="seepass">
                            <input type="checkbox" id="chkSeePassword" onclick="togglePassword()" />
                              <label for="chkSeePassword">See Password</label>

                        </div>
                        <br />
            </div>
            <div class="form-group">
                <asp:Button ID="login" runat="server" Text="LOGIN" CssClass="bttn" OnClick="login_Click" />
            </div>
             <script type="text/javascript">

                            function togglePassword() {
                                var passwordTextBox = document.getElementById('<%= password.ClientID %>');
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
