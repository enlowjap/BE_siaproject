<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BE_siaproject.ADMIN_INTERFACE.Dashboard" %>
<%@ Register Src="~/ADMIN_INTERFACE/header.ascx" TagName="Header" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                body {
            font-family: Arial, sans-serif;
            background:url('../pictures_admin/dash.png');
            background-size:cover;
        }

     .sidebar {
            height: 100vh;
            width: 250px;
            top: 10px;
            left: 0;
            background-color: white;
            padding-top: 20px;
            box-shadow: -10px 0 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar a {
            padding: 8px 8px 8px 4px; /* Added more left padding for icons */
            text-decoration: none;
            font-size: 15px;
            font-family:Arial;
            color: #AD0005;
            display: block;
            transition: 0.3s ease;
            background: url('path_to_your_icon.png') no-repeat left center; 
        }
        
        .sidebar a i {
            margin-right: 10px;
            font-size: 28px;
        }

        .sidebar a:hover {
            font-weight:bolder;
            background-color: #F8DFE0;
            color:darkred;
        }
        
    .student i,
    .teacher i,
    .subject i {
    font-size: 40px;
    color:darkred;
}

        .statistics {
    display: grid;
    grid-template-columns: repeat(3, 195px);
    grid-gap: 20px;
    padding: 20px;
    margin-top:-610px;
    padding-left:280px;
   
    
}

.student, .teacher, .subject {
    padding: 10px;
    text-align: center;
    border-radius: 8px;
    background-color: #ffff;
    width: 180px; /* Set a fixed width for the boxes */
    height: 120px;
    
}


.student p, .teacher p, .subject p {
    font-size: 20px;
    margin: 0;
    color: #666;
}
 .calendar {
            max-width: 400px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px; /* Adjust the margin-top to create space between calendar and statistics */
        }

        .month {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            table-layout: fixed;
            width: 100%;
        }

        th {
            width: calc(100% / 7); /* Divide the table equally into 7 columns for weekdays */
            padding: 10px;
            background-color: #f2f2f2;
        }

        td {
            width: calc(100% / 7); /* Divide the table equally into 7 columns for weekdays */
            padding: 10px;

}
        #addEventBtn {
    position: absolute;
    bottom: 100px;
    right: 150px;
    background-color: white;
    font-family:'Lucida Sans';
    font-size: 25px;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    
}

#addEventBtn:hover {
    background-color: darkred;
    color: white;
    font-weight:bold;

}

.prev-month-arrow {
    font-size: 24px;
    text-decoration: none;
    color: darkred;
    cursor: pointer;
    transition: 0.3s ease;
    position: absolute;
    left: 510px;
}

.prev-month-arrow:hover {
    color: #AD0005;
    font-weight: bold;
}

.next-month-arrow {
    font-size: 24px;
    text-decoration: none;
    color: darkred;
    cursor: pointer;
    transition: 0.3s ease;
    position: absolute;
    padding-left:95px;
    

}

.next-month-arrow:hover {
    color: #AD0005;
    font-weight: bold;
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
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%; /* Set the desired width of the modal */
    max-width: 400px; /* Optional: Set a maximum width if needed */
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);

}
         label{
            font-family: Arial;
            font-size:18px;
            
        }

        h2 {
             font-family: sans-serif;
             font-size:35px;
             font-weight:bold;
             padding-left:60px;
        }
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.boxes{
    margin-top:-300px;
}

.date-box,
.time-box {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
    padding-left:950px;
}


.date-box input[type="date"],
.time-box input[type="time"] {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 200px;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:Header runat="server" ID="Header1" />
            <div class="sidebar">
        <a href="../ADMIN_INTERFACE/Dashboard.aspx"><i class="fas fa-home"></i>DASHBOARD</a>
        <a href="../ADMIN_INTERFACE/Students.aspx"><i class="fas fa-users"></i>STUDENT APPLICATIONS</a>
        <a href="../ADMIN_INTERFACE/Enrolled.aspx"><i class="fas fa-book-open"></i>ENROLLED STUDENT</a>
        <a href="#"><i class="fas fa-user-tie"></i>FACULTY TEACHERS</a>
</div>
             <div class="statistics">
    <div class="student">
         <i class="fas fa-graduation-cap"></i>
        <h3>Total Enrolling Students</h3>
        <asp:Label ID="lblenrolingstud" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="teacher">
         <i class="fa fa-users"></i>
        <h3>Total Teachers</h3>
        <asp:Label ID="lblteachers" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="subject">
         <i class="fas fa-book"></i>
        <h3>Total Enrolled</h3>
        <asp:Label ID="lblenrolledstud" runat="server" Text=" "></asp:Label>
    </div>
</div>
   <div class="calendar">
       <a href="#" onclick="showNextMonth();" class="next-month-arrow">&rarr;</a>
       <a href="#" onclick="showPreviousMonth();" class="prev-month-arrow">&larr;</a>

       <div class="month">January 2023</div>
        <table>
            <tr>
                <th>Sun</th>
                <th>Mon</th>
                <th>Tue</th>
                <th>Wed</th>
                <th>Thu</th>
                <th>Fri</th>
                <th>Sat</th>
            </tr>
            <!-- You can populate the calendar with dates dynamically using JavaScript -->
            <tr>
               
              
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                
                </tr>
            <tr>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>12</td>
                <td>13</td>
                <td>14</td>
                </tr>
            <tr>
                <td>15</td>
                <td>16</td>
                <td>17</td>
                <td>18</td>
                <td>19</td>
                <td>20</td>
                <td>21</td>
                </tr>
            <tr>
                <td>22</td>
                <td>23</td>
                <td>24</td>
                <td>25</td>
                <td>26</td>
                <td>27</td>
                <td>28</td>
                </tr>
            <tr>
                <td>29</td>
                <td>30</td>
            </tr>
            <!-- More rows for the rest of the month -->
        </table>
    </div>
        <button id="addEventBtn" onclick="openModal()">&#43; Add Event</button>
      
  
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>CREATE EVENT</h2>
        <form id="eventForm" style="text-align: left;">
            <div class="form-group">
                <label for="eventTitle">Event Title:</label>
                <input type="text" id="eventTitle" name="eventTitle" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventDate">Event Date:</label>
                <input type="date" id="eventDate" name="eventDate" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="eventTime">Event Time:</label>
                <input type="time" id="eventTime" name="eventTime" class="form-control" required>
            </div>
            <input type="submit" value="Create Event" class="btn btn-primary">
        </form>
    </div>
</div>



<div class="boxes">
    <div class="date-box">
        <input type="date" id="date" name="date">
    </div>
    <div class="time-box">
        <input type="time" id="time" name="time">
    </div>
</div>

<script>
    // Get the date input element
    var dateInput = document.getElementById("date");

    // Get the time input element
    var timeInput = document.getElementById("time");

    // Set the current date in the date input box (format: YYYY-MM-DD)
    var currentDate = new Date().toISOString().slice(0, 10);
    dateInput.value = currentDate;

    // Set the current time in the time input box (format: HH:MM)
    var currentHour = new Date().getHours().toString().padStart(2, '0');
    var currentMinute = new Date().getMinutes().toString().padStart(2, '0');
    var currentTime = currentHour + ":" + currentMinute;
    timeInput.value = currentTime;
</script>

<!-- ... (remaining HTML code) ... -->




<script type="text/javascript">
    // Get the modal and the button
    var modal = document.getElementById("myModal");
    var addEventBtn = document.getElementById("addEventBtn");

    // Function to open the modal
    function openModal() {
        modal.style.display = "block";
    }

    // Get the close button element
    var closeBtn = document.querySelector(".close");

    // Function to close the modal when the close button is clicked
    function closeModal() {
        modal.style.display = "none";
    }

    // Event listener for the Add Event button click
    addEventBtn.addEventListener("click", openModal);

    // Event listener for the close button click
    closeBtn.addEventListener("click", closeModal);

    // Event listener to close the modal if the user clicks outside of it
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

</script>




        <script type="text/javascript">
            function showNextMonth() {
                // Get the current month (you can modify this logic as needed)
                var currentMonth = document.querySelector('.month').textContent;
                // Define an array of month names for comparison
                var months = ["January 2023", "February 2023", "March 2023", "April 2023", "May 2023", "June 2023", "July 2023", "August 2023", "September 2023", "October 2023", "November 2023", "December 2023"];
                // Get the index of the current month in the array
                var currentIndex = months.indexOf(currentMonth);
                // Calculate the index of the next month
                var nextMonthIndex = (currentIndex + 1) % 12;
                // Get the current year
                var currentYear = new Date().getFullYear();
                // Calculate the next month's year (increment the year if next month is January)
                var nextMonthYear = currentIndex === 11 ? currentYear + 1 : currentYear;
                // Update the displayed month and year
                document.querySelector('.month').textContent = months[nextMonthIndex];
                // Get the table element
                var table = document.querySelector('table');
                // Clear the existing table rows
                table.innerHTML = '<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>';
                // Get the first day of the next month
                var firstDay = new Date(nextMonthYear, nextMonthIndex, 1).getDay();
                // Get the number of days in the next month
                var daysInMonth = new Date(nextMonthYear, nextMonthIndex + 1, 0).getDate();
                // Initialize variables for table generation
                var dayCount = 1;
                var row = document.createElement('tr');
                // Add empty cells for days before the first day of the month
                for (var i = 0; i < firstDay; i++) {
                    var cell = document.createElement('td');
                    cell.textContent = '';
                    row.appendChild(cell);
                }
                // Add cells for the days of the month
                for (var day = 1; day <= daysInMonth; day++) {
                    var cell = document.createElement('td');
                    cell.textContent = day;
                    row.appendChild(cell);
                    // Move to the next row if it's Saturday (index 6)
                    if (row.childElementCount === 7) {
                        table.appendChild(row);
                        row = document.createElement('tr');
                    }
                }
                // Add remaining empty cells to complete the last row
                for (var i = row.childElementCount; i < 7; i++) {
                    var cell = document.createElement('td');
                    cell.textContent = '';
                    row.appendChild(cell);
                }
                // Add the last row to the table
                table.appendChild(row);
            }

            function showPreviousMonth() {
                var currentMonth = document.querySelector('.month').textContent;
                var months = ["January 2023", "February 2023", "March 2023", "April 2023", "May 2023", "June 2023", "July 2023", "August 2023", "September 2023", "October 2023", "November 2023", "December 2023"];
                var currentIndex = months.indexOf(currentMonth);
                var previousMonthIndex = (currentIndex - 1 + 12) % 12; // Ensure a positive index by adding 12 before modulo operation
                var currentYear = new Date().getFullYear();
                var previousMonthYear = currentIndex === 0 ? currentYear - 1 : currentYear;
                document.querySelector('.month').textContent = months[previousMonthIndex];
                var table = document.querySelector('table');
                table.innerHTML = '<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>';
                var firstDay = new Date(previousMonthYear, previousMonthIndex, 1).getDay();
                var daysInMonth = new Date(previousMonthYear, previousMonthIndex + 1, 0).getDate();
                var dayCount = 1;
                var row = document.createElement('tr');
                for (var i = 0; i < firstDay; i++) {
                    var cell = document.createElement('td');
                    cell.textContent = '';
                    row.appendChild(cell);
                }
                for (var day = 1; day <= daysInMonth; day++) {
                    var cell = document.createElement('td');
                    cell.textContent = day;
                    row.appendChild(cell);
                    if (row.childElementCount === 7) {
                        table.appendChild(row);
                        row = document.createElement('tr');
                    }
                }
                for (var i = row.childElementCount; i < 7; i++) {
                    var cell = document.createElement('td');
                    cell.textContent = '';
                    row.appendChild(cell);
                }
                table.appendChild(row);
            }

        </script>

            
    </form>
</body>
</html>
