<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gradelevel.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Gradelevel" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader_h.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .form-cont {
        width: 50%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
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

        .bttnn{
            background-color: #E22529;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .bttnn:hover{
            background-color:white;
            color: #E22529;
            border:2px solid #E22529;
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
        <div>
            <div class="form-cont">
                <div>
                    <p>Category :</p>
                    <asp:Label ID="lblcategory" runat="server" ></asp:Label>
                </div>
                
                <p>Grade Level</p>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="listbx">
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
                    <asp:ListItem Selected="True">--</asp:ListItem>
                </asp:DropDownList>

                <script type="text/javascript">
                    $(document).ready(function () {
                        // Initially hide the second dropdown list
                        $("#DrplG11nG12").hide();

                        // Event handler for the change event of the first dropdown list
                        $("#DropDownList1").change(function () {
                            // Get the selected value
                            var selectedValue = $(this).val();

                            // Check if the selected value is "g11" or "g12"
                            if (selectedValue === "g11" || selectedValue === "g12") {
                                // Show the second dropdown list
                                $("#DrplG11nG12").show();
                            } else {
                                // Hide the second dropdown list
                                $("#DrplG11nG12").hide();
                            }
                        });
                    });
                </script>

                <asp:DropDownList ID="DrplG11nG12" runat="server" CssClass="listbx">
                    <asp:ListItem>STEM</asp:ListItem>
                    <asp:ListItem>HUMS</asp:ListItem>
                    <asp:ListItem>ABM</asp:ListItem>
                    <asp:ListItem>TECH</asp:ListItem>
                    <asp:ListItem Selected="True" Value="none">TRACK</asp:ListItem>
                </asp:DropDownList>
                <br />
                 <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CssClass="bttn" />
                <asp:Button ID="Button1" runat="server" Text="Proceed" OnClick="Button1_Click" CssClass="bttnn" />
            </div>
        </div>
    </form>
</body>
</html>
