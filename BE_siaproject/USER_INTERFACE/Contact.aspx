<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Contact" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
      
    <style type="text/css">
        
        body{
     
      font-family:Arial;
      background:url('../images_user/contactspic.png');
      background-size:cover;
  }
     
        .container{
         display: flex;
         justify-content: flex-end;
         align-items: center;
         height: 20vh;
 }
        .cont {
            display: flex;
            flex-direction:column;
            align-items:center;
            width: 55%; 
            max-width: 1200px;
       }
 
        .h1-large {
          font-family: 'Franklin Gothic';
          font-weight:bolder;
          color: #E81F25;
          font-size: 100px; 
}
        
        .contact-container {
            max-width: 1200px;
            margin: 0 auto;    
            margin-top: -30px;
        }

        .icon {
            margin-right: 10px;
            color: #ffd800;
             font-size: 50px;
          
        }

        .contact-info {
            margin-bottom: 15px;
        }

        .info{
            font-family: 'Trebuchet MS';
             font-size: 14px;
             font-weight: normal;
             padding-left:5%;
             color: #4B3E35;
             margin-top: -8px;
             
        }

        .lbel {
            font-family: 'Segoe UI';
            font-size: 55px;
            color: #4B3E35;
             font-weight: bolder;
        }
      </style>
</head>
<body>
    <form id="form1" runat="server">
    <uc:Header runat="server" ID="Header1" />
        <div>
        <div class="container">
             <div class="cont">
             <div>
               <h1 class="h1-large">CONTACT US</h1>
                 </div>
              </div>
         </div>
        <div class="contact-container">
        <div class="contact-info">
           <span class="lbel">Landline</span><br /><p class="info">2711 - 91154<br />3430-06-80</p>
        </div>
        <div class="contact-info">
          <span class="lbel">Phone</span><br /><p class="info">0977-813-6975</p>
        </div>
        <div class="contact-info">
            <span class="lbel">Address</span><br /><p class="info">#2 Iris St. Cor. Dahlia Ave., West Fairview, Q.C</p>
        </div>
        <div class="contact-info">
            <span class="lbel">Email</span><br /><p class="info">info@hopeintegratedschool.edu.ph</p>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
