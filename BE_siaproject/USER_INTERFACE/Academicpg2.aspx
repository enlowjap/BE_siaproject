<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Academicpg2.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Academicpg2" %>
<%@ Register Src="~/USER_INTERFACE/Landingheader.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
  body{
     
      font-family:Arial;
      background:url('../images_user/backgroundacad.png');
      background-size:cover;
  }
 
 p {
    
    font-size: 20px;
    font-family: 'Lucida Console';
    text-decoration: underline;
    color: white;
    text-align: center;
    width: 90%;
    margin: 0 auto; 
    position: absolute;
    padding-left:5%;
    top: 25%;
    transform: translateY(-50%);
}

  p2 {
    
    font-size: 50px;
    font-family: 'Franklin Gothic';
    font-weight:bold;
    color: white;
    text-align: center;
    width: 90%;
    margin: 0 auto; 
    position: absolute;
    padding-left:5%;
    top: 35%;
    transform: translateY(-50%);
}
  .container {
     display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 20%;

}
  h1 {
      font-size:35px;
      font-family: 'Franklin Gothic';
      font-weight:bolder;

  }

.square {
    width: 250px;
    height: 250px;
    margin: 10px;
    text-align: center;
    font-size: 13px;
    color:white;
    font-family: 'Lucida Console';
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border-radius: 25px;
}
.square:hover {
    transform: scale(1.1);
    border-radius: 25px;
    background-color: #2980b9;
    border-color: #3498db;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
}
.red {
    background-color: #6460AA;
}

.blue {
    background-color: #0089D0;
}

.arrow-buttons {
  display: flex;
  justify-content: space-between;

}

.prev-button,
.next-button {
  background-color: white;
  color: red;
  border: none;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 5px;
}

.prev-button:hover,
.next-button:hover {
  background-color: white;
  color: red;
  border: 2px solid red;
}



      </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
          <p>Academics</p><br />
         <p2>Explore our Educational Program!</p2>
        <div class="container">
    <div class="square red"><h1>Senior Highschool</h1>HIS Senior High School Program offers Humanities and Social Sciences (HUMSS) and Sciences, Technology, Engineering and Mathematics (STEM).</div>
    <div class="square blue"><h1>Home <br />Schooling</h1>Aside from online classes, HIS community can also choose to enroll in homeschooling. HIS offered Home Education Program for families who wish to homeschool their children.</div>
</div>
       <div class="arrow-buttons">
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/USER_INTERFACE/Academicpg1.aspx" CssClass="prev-button">
        &lt; Back </asp:HyperLink> 
</div>
    </form>
</body>
</html>
