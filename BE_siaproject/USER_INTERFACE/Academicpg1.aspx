<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Academicpg1.aspx.cs" Inherits="BE_siaproject.USER_INTERFACE.Academicpg1" %>
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
    font-size: 12px;
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
    <div class="square red"><h1>Special Education</h1>HIS has had a vision for many years to provide Christian education for children with special needs. These students are tremendous blessings to the HIS community.</div>
    <div class="square blue"><h1>Preschool</h1>(Nursery,Kinder 1,Kinder 2)<br /><br /><br />The HIS Preschool Program consists of children aged 3 to 5 years old. HIS offers a wonderful preschool program that is safe, fun, educational, and Biblically grounded.</div>
    <div class="square green"><h1>Elementary</h1>Primary Level (Grades 1 to 3) and Intermediate Level (Grades 4 to 6)<br /><br /><br />HIS Elementary Program serves students in primary (Grades 1 to 3) and intermediate levels (Grades 4 to 6). HIS focuses on a passion for students, education, and Christ.</div>
    <div class="square yellow"><h1>Junior Highschool</h1>HIS Junior High School Program is designed to help Grades 7 to 10 students make a smooth transition into the rigorous academic programs of high school. </div>
</div>
    <div class="arrow-buttons">
   <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#" CssClass="n-button"></asp:HyperLink>
   <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/USER_INTERFACE/Academicpg2.aspx" CssClass="next-button">
    Next &gt; </asp:HyperLink>
</div>
    </form>
</body>
</html>
