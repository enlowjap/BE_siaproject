<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Header" %>

<style type="text/css">
        body{
            margin:0;    
        }
        .auto-style1 {
            width: 161px;
            height: 38px;
        }
        /* Style the menu bar container */
        .Lmenubar {
            margin:0;
            background-color: #ffffff; /* Background color of the menu bar */
            overflow: auto; /* Overflow property set to auto */
            padding: 10px; /* Padding for the menu bar */
            display: flex; /* Use flexbox for layout */
            flex-direction:row;
            justify-content:space-between;
            align-items: center; /* Center-align items vertically */
        }

            /* Style the logo */
            .logo img {
                width: 200px; 
                border-radius: 1px;
        }

            /* Style the header separation */
            .Lheader-separation {
                display:flex;
                flex-direction:row;
                align-items:center;
                margin-left: auto; /* Push the header separation to the right */
         }

            

            .Lbuttons {
                background-color: #ffffff; /* Background color of the buttons */
                color: black; /* Text color of the buttons */
                border: none; /* Remove borders from the buttons */
                padding: 10px 20px; /* Padding inside the buttons */
                text-align: center; /* Center-align the text inside the buttons */
                text-decoration: none; /* Remove underline from the buttons */
                display: inline-block; /* Display buttons as inline blocks */
                font-size: 16px; /* Font size of the buttons */
                cursor: pointer; /* Set cursor to pointer on hover */
                margin-left: 10px; /* Add margin between buttons */
                vertical-align:top;
            }

            /* Change the color of buttons on hover */
            .Lbuttons:hover {
            background-color: #ebebeb; /* Background color when hovering over the buttons */
            }
            .Enroll{
                background-color: #b61818; /* Background color of the buttons */
                color: white; /* Text color of the buttons */
                border: none; /* Remove borders from the buttons */
                padding: 10px 20px; /* Padding inside the buttons */
                text-align: center; /* Center-align the text inside the buttons */
                text-decoration: none; /* Remove underline from the buttons */
                display: inline-block; /* Display buttons as inline blocks */
                font-size: 16px; /* Font size of the buttons */
                cursor: pointer; /* Set cursor to pointer on hover */
                margin-left: 10px; /* Add margin between buttons */
                border-radius:10px;
            }
            .Enroll:hover{
            background-color: #ffffff;
            color:#b61818;
            }

            img{
                vertical-align:top;
                padding-left:10px;
                height:43px;
                width:55px;
                border-radius:1px;
                object-fit:fill;
             }

    </style>

<div class="Lmenubar">
            <div class="logo">
            <asp:HyperLink ID="hypImageLink" runat="server" NavigateUrl="Dashboard.aspx">
            <img alt="HOPE LOGO" class="auto-style1" src="../pictures_admin/LOGO.png" />
            </asp:HyperLink>
            </div>
            <div class="Lheader-seperation">
            <img src="../pictures_admin/piclogo.png" /><asp:Button ID="Login" runat="server" CssClass="Lbuttons" OnClick="Button4_Click" Text="Name" />
        </div>
    </div>