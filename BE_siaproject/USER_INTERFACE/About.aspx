<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.About" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
     body{
        
         font-family:Arial;
         background:url('../images_user/backgound2.jpg');
         background-size:cover;
     }
      
 .container{
     display: flex;
     justify-content: flex-end;
     align-items: center;
     height: 100vh;
 }


.h1-small {
    font-family: 'Times New Roman';
    color: #E81F25;
    font-weight:normal;
    font-size: 80px;
    line-height: 0.1;

}

.h1-large {
    font-family: 'Segoe UI';
    color: #E81F25;
    font-size: 130px; 
    line-height: 9px;
}

  
  p {
    font-size: 20px;
    font-family: 'Times New Roman';
    color: black;
    text-align: center;
    width: 90%;
    margin: 0 auto; 
    position: absolute;
    top: 91%;
    padding-left:5%;
    transform: translateY(-50%);
    line-height:25px;
   
}
 .cont {
             display: flex;
             flex-direction:column;
             align-items:center;
             width: 20%; 
             max-width: 1200px;
        }
 


    </style>
</head>
<body>
    <form id="form1" runat="server">
         <uc:Header runat="server" ID="Header1" />
         <div class="container">
        <div class="cont">
        <div>
           <h1 class="h1-small">About</h1>
            <h1 class="h1-large">HIS</h1>
            </div>     
        </div>
    </div>
        <p>Hope Integrated School is a non-stock, inclusive, Christian educational institution duly recognized by the Department of Education. The school was founded in 1999 through the Grace of God, under the leadership of Mrs. Teresita Suiza, with an initial name of TD&S Hope Christian Academy until the current name has been adopted by around 2015.</p>
    </form>
</body>
</html>
