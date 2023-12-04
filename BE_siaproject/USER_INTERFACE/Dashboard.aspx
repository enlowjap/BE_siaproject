<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Dashboard" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader_h.ascx" TagName="Header" TagPrefix="uc" %>
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
            background: url('#');
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }

        #Header1 {
            position: fixed;
            z-index: 2; /* Ensure the header appears above the sidebar */
            width: 100%; /* Make the header take the full width */
        }

        .sidebar {
            height: 100vh;
            width: 200px;
            top: 50px;
            left: 0;
            background-color: white;
            padding-top: 30px;
            box-shadow: -10px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            z-index: 1;
        }

        .sidebar a {
            padding: 8px 8px 8px 16px;
            text-decoration: none;
            font-size: 18px;
            color: red;
            display: block;
            transition: 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #ff6666;
            color: white;
        }

        .main-content {
            margin-left: 200px;
            padding: 70px 20px 20px; /* Added padding to the top to avoid content behind the header */
        }

        .table {
            margin-top: 30px;
        }

        .submitbttn {
            background-color: #E22529;
            border: none;
            height: 30px;
            width: 90px;
            border-radius: 15px;
            color: white;
            cursor: pointer;
            transition: background-color 0.5s ease, color 0.5s ease, border 0.5s ease;
        }

        .submitbttn:hover {
            background-color: white;
            color: #E22529;
            border: 2px solid #E22529;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 sidebar">
                    <a href="../USER_INTERFACE/Home.aspx">Home</a>
                    <a href="../USER_INTERFACE/Dashboard.aspx">Dashboard</a>
                    <a href="#">Student Profile</a>
                    <a href="#">School Receipt</a>
                </div>
                <div class="col-sm-9 main-content ml-3">
                    <h1>Board</h1>
                    <div class="table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Reference</th>
                                    <th>Details</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td><asp:Label ID="lblreference" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lbldetails" runat="server"></asp:Label></td>
                                    <td><asp:Label ID="lblstatus" runat="server"></asp:Label></td>
                                    <td><asp:Button ID="View" runat="server" Text="View" OnClick="View_Click" CssClass="submitbttn" /></td>
                                    <td><asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" CssClass="submitbttn" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
