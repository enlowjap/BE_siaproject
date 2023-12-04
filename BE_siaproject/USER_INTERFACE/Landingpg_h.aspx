<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landingpg_h.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Landingpg_h" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader_h.ascx" TagName="Header" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
                     <style>
                    body{
                        font-family:Arial;
                        background:url('Images/pic3.png');
                        background-size:cover;
                    }
                    .dash{
                           margin:3%;
                           display:inline-flex;
                           justify-content:flex-start;
                           background-color:#E22529;
                           border:none;
                           height:60px;
                           width:150px;
                          justify-content: center; 
                          align-items: center;
                           font-size:20px;
                           font-family: 'Lucida Sans Unicode';
                           border-radius:15px;
                           color:white;
                           cursor:pointer;
                           transition: background-color 0.5s ease, color 0.5s ease, border 0.5s ease;
                       }

                       .dash:hover{
                           background-color:white;
                           color: #E22529;
                           border:2px solid #E22529;
                       }
                         .container {
                         display: flex;
                        justify-content: center;
                        align-items: center;
                        padding-top: -15px;

            }
              h1 {
                  font-size:35px;
                  font-family: 'Franklin Gothic';
                  font-weight:bolder;

              }

            .square {
                width: 265px;
                height: 220px;
                margin: 10px;
                text-align: center;
                font-size: 12px;
                color:white;
                font-family: 'Lucida Console';
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                border-radius: 25px;
                margin: 10px;
            }
            .square:hover {
                transform: scale(1.1);
                border-radius: 25px;
                background-color: #2980b9;
                border-color: #3498db;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            }
            .red {
                background-color: #FCB711;
            }

            .blue {
                background-color: #EF6699;
            }

            .green {
                background-color: #6460AA;
            }

            .yellow {
                background-color: #0089D0;
            }

            .pink {
                background-color: #079565;
            }

            .brown {
                background-color: #F37021;
            }

            .top-squares,
            .bottom-squares {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

                       .vid-stat{
                         cursor:pointer;
                         height:30px;
                         width:50px;
                         background-color:#E22529;
                         font-size: 12px;
                         font-family: Arial;
                         color: white;
                         text-decoration:none;
                         border-radius:15px;
                         padding:10px;
             
                       }
                       .vid-stat:hover{
                           background-color: #00439D;
                       }
                        .modal {
                        display: none;
                        position: fixed;
                        z-index: 1;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        overflow: auto;
                        background-color: rgba(0, 0, 0, 0.4);
                    }
         

                    .modal-content {
                        background-color: #F3F3F3;
                        margin: 15% auto;
                        padding: 10px;  
                        border: 1px solid #888;
                        width: 45%;
                        text-align: center;
                        border-radius: 10px;
                        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
                    }

                    .modal-message {
                        font-family: 'Times New Roman';
                        font-size: 20px;
                        margin-bottom: 20px;
                    }

                    #okButton {
                        margin-top: 20px;
                        padding: 12px 24px;
                        background-color: red;
                        color: #fff;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        font-size: 16px;
                    }

                    #okButton:hover {
                        background-color: #0056b3;
                    }
            </style>
</head>
<body>
    <form id="form1" runat="server">
         <uc:Header runat="server" ID="Header1" />
                    <div>
              <asp:Button ID="Button1" runat="server" Text="Dashboard" OnClick="Button1_Click" CssClass="dash" />
          </div>
                <div class="top-squares">
                <div class="container">
                    <div class="square red">
                        <h1>Special Education</h1>
                        All Grade Levels<br /><br /><br />
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="vid-stat"
                            NavigateUrl="~/USER_INTERFACE/Gradelevel.aspx?category=SpecialEducation&checkStatus=true">
                            REGISTER NOW!
                        </asp:HyperLink>
                    </div>
                    <div class="square blue">
                        <h1>Regular Schooling</h1>
                        All Grade Levels<br /><br /><br /><br />
                        <asp:HyperLink ID="HyperLink3" runat="server" CssClass="vid-stat"
                            NavigateUrl="~/USER_INTERFACE/Gradelevel.aspx?category=RegularSchooling&checkStatus=true">
                            REGISTER NOW!
                        </asp:HyperLink>
                    </div>
                    <div class="square brown">
                        <h1>Home Schooling</h1>
                        All Grade Levels<br /><br /><br /><br />
                        <asp:HyperLink ID="HyperLink6" runat="server" CssClass="vid-stat"
                            NavigateUrl="~/USER_INTERFACE/Gradelevel.aspx?category=HomeSchooling&checkStatus=true">
                            REGISTER NOW!
                        </asp:HyperLink>
                    </div>
                </div>
            </div>

                <div class="modal" id="myModal">
                    <div class="modal-content">
                      <img src="../images-user/piclogo.png" alt="Logo" style="max-width: 150px; height: auto;" />
                        <p>Choose a grade level you want to enroll</p>
                        <asp:Button ID="okButton" runat="server" Text="OK" OnClientClick="return closeModal();" />
                    </div>
                </div>
      
                <script type="text/javascript">
            function closeModal() {
                var modal = document.getElementById("myModal");
                modal.style.display = "none";
                return false; // Prevent ASP.NET postback
            }

            // Display the modal when the page loads
                    function displayModal() {
                        var modal = document.getElementById("myModal");
                        modal.style.display = "block";
                    }

                    // Display the modal when the page loads (this will be called only if the server-side logic triggers it)
                    window.onload = function () {
                        var popUpDisplayed = '<%= Session["PopUpDisplayed"] %>';
                        if (popUpDisplayed !== 'True') {
                            displayModal();
                            <% Session["PopUpDisplayed"] = true; %>
                        }
                    };    

                    
                </script>
    </form>
</body>
</html>
