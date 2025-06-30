<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*,javax.servlet.http.*,java.util.*" %>
 <%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Student Dashboard</title>
<link href="Bootstrap/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="Bootstrap/css/style.css" rel="stylesheet" type="text/css"></link>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>

<style>
.btn-room
{
background: #8383F2;
    color: #fff;
    width: 160px;
    display: inline-block;
padding:10px 20px;
    text-transform: uppercase;
    font-size: 16px;
    font-weight: bold;
   margin-left:30px;
   margin-right:30px;
   margin-top:50px;
   margin-bottom:30px;
border:none;
border-radius:5%;
text-decoration:none;
}
/* Overall body and content */
body { 
    height: 100%;
    width: 100%;
    margin: 0;
    background: #005C97;    
    background: -webkit-linear-gradient(left, #363795, #005C97);
    background: -moz-linear-gradient(left, #363795, #005C97);
    background: -o-linear-gradient(left, #363795, #005C97);
    background: linear-gradient(to right, #363795, #005C97); 
    font-family: Helvetica;
} 
.content {
    overflow: none;
    max-width: 790px;
    padding: 0px 0;
    height: 500px;
    position: relative;
    margin: 20px auto;
    background: #52A0FD;
    background: -moz-linear-gradient(right,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: -webkit-linear-gradient(right,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: linear-gradient(to left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);    
    border-radius: 3px;
    box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    -moz-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    -webkit-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}

/*  Events display */
.events-container {
    overflow-y: scroll;
    height: 100%;
    float: right;
    margin: 0px auto; 
    font: 13px Helvetica, Arial, sans-serif; 
    display: inline-block; 
    padding: 0 10px;
    border-bottom-right-radius: 3px;
    border-top-right-radius: 3px;
}
.events-container:after{
    clear:both;
}
.event-card {
    padding: 20px 0;
    width: 350px;
    margin: 20px auto;
    display: block;
    background: #fff;
    border-left: 10px solid #52A0FD;
    border-radius: 3px;
    box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    -moz-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    -webkit-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
.event-count, .event-name, .event-cancelled {
    display: inline;
    padding: 0 10px;
    font-size: 1rem;
}
.event-count {
    color: #52A0FD;
    text-align: right;
}
.event-name {
    padding-right:0;
    text-align: left;
}
.event-cancelled {
    color: #FF1744;
    text-align: right;
}

/*  Calendar wrapper */
.calendar-container  { 
    float: left;
    position: relative;
    margin: 0px auto; 
    height: 100%;
    background: #fff;
    font: 13px Helvetica, Arial, san-serif; 
    display: inline-block; 
    border-bottom-left-radius: 3px;
    border-top-left-radius: 3px;
}
.calendar-container:after{
    clear:both;
}
.calendar {
    display: table;
}

/* Calendar Header */
.year-header { 
    background: #52A0FD;
    background: -moz-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: -webkit-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: linear-gradient(to right,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);    
    font-family: Helvetica;
    box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
    -moz-box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
    -webkit-box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
    height: 40px; 
    text-align: center;
    position: relative; 
    color:#fff; 
    border-top-left-radius: 3px;
} 
.year-header span { 
    display:inline-block; 
    font-size: 20px;
    line-height:40px; 
}
.left-button, .right-button { 
    cursor: pointer;
    width:28px; 
    text-align:center; 
    position:absolute; 
} 
.left-button { 
    left:0; 
    -webkit-border-top-left-radius: 5px; 
    -moz-border-radius-topleft: 5px; 
    border-top-left-radius: 5px; 
} 
.right-button { 
    right:0; 
    top:0; 
    -webkit-border-top-right-radius: 5px; 
    -moz-border-radius-topright: 5px; 
    border-top-right-radius: 5px; 
} 
.left-button:hover {
    background: #3FADFF;
}
.right-button:hover { 
    background: #00C1FF;
}

/* Buttons */
.button{
    cursor: pointer;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    outline: none;
    font-size: 1rem;
    border-radius: 25px;
    padding: 0.65rem 1.9rem;
    transition: .2s ease all;
    color: white;
    border: none;
    box-shadow: -1px 10px 20px #9BC6FD;
    background: #52A0FD;
    background: -moz-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: -webkit-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
    background: linear-gradient(to right,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
}
#cancel-button {
    box-shadow: -1px 10px 20px #FF7DAE;
    background: #FF1744;
    background: -moz-linear-gradient(left,  #FF1744 0%, #FF5D95 80%, #FF5D95 100%);
    background: -webkit-linear-gradient(left,  #FF1744 0%, #FF5D95 80%, #FF5D95 100%);
    background: linear-gradient(to right,  #FF1744 0%, #FF5D95 80%, #FF5D95 100%);
}
#add-button {
    display: block;
    position: absolute;
    right:20px;
    bottom: 20px;
}
#add-button:hover, #ok-button:hover, #cancel-button:hover {
    transform: scale(1.03);
}
#add-button:active, #ok-button:active, #cancel-button:active {
    transform: translateY(3px) scale(.97);
}

/* Days/months tables */
.days-table, .dates-table, .months-table { 
    border-collapse:separate; 
    text-align: center;
} 
.day { 
    height: 26px;
    width: 26px;
    padding: 0 8px;
    line-height: 26px; 
    border: 2px solid transparent;
    text-transform:uppercase; 
    font-size:90%; 
    color:#9e9e9e; 
} 
.month {
    cursor: default;
    height: 26px;
    width: 26px;
    padding: 0 2px;
    padding-top:10px;
    line-height: 26px; 
    text-transform:uppercase; 
    font-size: 11px; 
    color:#9e9e9e; 
    transition: all 250ms;
}
.active-month {
    font-weight: bold;
    font-size: 14px;
    color: #FF1744;
    text-shadow: 0 1px 4px RGBA(255, 50, 120, .8);
}
.month:hover {
    color: #FF1744;
    text-shadow: 0 1px 4px RGBA(255, 50, 120, .8);
}

/*  Dates table */
.table-date {
    cursor: default;
    color:#2b2b2b; 
    height:26px;
    width: 26px;
    font-size: 15px;
    padding: 12px;
    line-height:26px; 
    text-align:center; 
    border-radius: 50%;
    border: 2px solid transparent;
    transition: all 250ms;
}
.table-date:not(.nil):hover { 
    border-color: #FF1744;
    box-shadow: 0 2px 6px RGBA(255, 50, 120, .9);
}
.event-date {
    border-color:#52A0FD;
    box-shadow: 0 2px 8px RGBA(130, 180, 255, .9);
}
.active-date{ 
    background: #FF1744;
    box-shadow: 0 2px 8px RGBA(255, 50, 120, .9);
    color: #fff;
}
.event-date.active-date {
    background: #52A0FD;
    box-shadow: 0 2px 8px RGBA(130, 180, 255, .9);
}

/* input dialog */
.dialog{
    z-index: 5;
    background: #fff;
    position:absolute;
    width:415px;
    height: 500px;
    left:387px;
    border-top-right-radius:3px;
    border-bottom-right-radius: 3px;
    display:none;
    border-left: 1px #aaa solid;
}
.dialog-header {
    margin: 20px;
    color:#333;
    text-align: center;
}
.form-container {
    margin-top:25%;
}
.form-label {
    color:#333;
}
.input {
    border:none;
    background: none;
    border-bottom: 1px #aaa solid;
    display:block;
    margin-bottom:50px;
    width: 200px;
    height: 20px;
    text-align: center;
    transition: border-color 250ms;
}
.input:focus {
    outline:none;
    border-color: #00C9FB;
}
.error-input {
    border-color: #FF1744;
}

/* Tablets and smaller */
@media only screen and (max-width: 780px) {
    .content {
        overflow: visible;
        position:relative;
        max-width: 100%;
        width: 370px;
        height: 100%;
        background: #52A0FD;
        background: -moz-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
        background: -webkit-linear-gradient(left,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);
        background: linear-gradient(to right,  #52A0FD 0%, #00C9FB 80%, #00C9FB 100%);  
    }
    .dialog {
        width:370px;
        height: 450px;
        border-radius: 3px;
        top:0;
        left:0;
    }
    .events-container {
        float:none;
        overflow: visible;
        margin: 0 auto;
        padding: 0;
        display: block;
        left: 0;
        border-radius: 3px;
    }

    .calendar-container {
        float: none;
        padding: 0;
        margin: 0 auto;
        margin-right: 0;
        display: block;
        left: 0;
        border-radius: 3px;
        box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        -moz-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        -webkit-box-shadow: 3px 8px 16px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }
}

/* Small phone screens */
@media only screen and (max-width: 400px) {
    .content, .events-container, .year-header, .calendar-container {
        width: 320px;
    }
    .dialog {
        width: 320px;
    }
    .months-table {
        display: block;
        margin: 0 auto;
        width: 320px;
    }
    .event-card {
        width: 300px;
    }
    .day {
        padding: 0 7px;
    }
    .month {
        display: inline-block;
        padding: 10px 10px;
        font-size: .8rem;
    }
    .table-date {
        width: 20px;
        height: 20px;
        line-height: 20px;
    }
    .event-name, .event-count, .event-cancelled {
        font-size: .8rem;
    }
    .add-button{
        bottom: 10px;
        right: 10px;
        padding: 0.5rem 1.5rem;
    }
} 
</style>
</head>
<body>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-text mx-3">Welcome <%out.println(session.getAttribute("sessname"));%></div>
      </a>

      <hr class="sidebar-divider my-0">

      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fa fa-graduation-cap"></i>
          <span>
          <% 
          String collegename=(String)session.getAttribute("colcode");
          Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String username=(String)session.getAttribute("sessname");
          String query="Select department from student_details where Username=?";
          PreparedStatement ps5=con1.prepareStatement(query);
          ps5.setString(1,username);
          ResultSet rs5=ps5.executeQuery();
          while(rs5.next())
          {
          out.println(rs5.getString(1));
          }
          %>
        
          
          </span>
        </a>
      </li>

<li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fa fa-comments"></i>
          <span>Chat</span>
        </a>
        </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="fa fa-book"></i>
          <span>Courses</span>
        </a>
        </li>

     
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="Calender.jsp">
          <i class="fas fa-fw fa-folder"></i>
          <span>Calender</span>
        </a>
              </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="StudentFeedback.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Feedback</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fa fa-download"></i>
          <span>My Downloads</span></a>
      </li>
<hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

       
    </ul>
  <div id="content-wrapper" class="d-flex flex-column">

      <div id="content">
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            <% //session.setAttribute("colcode",collegecode);
          
            //String collegename=(String)session.getAttribute("colcode");
            //Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/E"+collegename,"root","");
          String query3="select college_name from college_details where college_code=?";
          PreparedStatement ps4=con.prepareStatement(query3);
          ps4.setString(1,collegename);
          ResultSet rs4=ps4.executeQuery();
          while(rs4.next())
          {
          out.println(rs4.getString(1));
          }
          con.close();
          %>
      <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                
              </a>
            </li>
             <div class="topbar-divider d-none d-sm-block"></div>
            
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%out.println(session.getAttribute("sessname"));%></span>
                <img class="img-profile rounded-circle" src="">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.jsp">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>
           
  </nav>
  <div class="content">
    <div class="calendar-container">
      <div class="calendar"> 
        <div class="year-header"> 
          <span class="left-button" id="prev"> &lang; </span> 
          <span class="year" id="label"></span> 
          <span class="right-button" id="next"> &rang; </span>
        </div> 
        <table class="months-table"> 
          <tbody>
            <tr class="months-row">
              <td class="month">Jan</td> 
              <td class="month">Feb</td> 
              <td class="month">Mar</td> 
              <td class="month">Apr</td> 
              <td class="month">May</td> 
              <td class="month">Jun</td> 
              <td class="month">Jul</td>
              <td class="month">Aug</td> 
              <td class="month">Sep</td> 
              <td class="month">Oct</td>          
              <td class="month">Nov</td>
              <td class="month">Dec</td>
            </tr>
          </tbody>
        </table> 
        
        <table class="days-table"> 
          <td class="day">Sun</td> 
          <td class="day">Mon</td> 
          <td class="day">Tue</td> 
          <td class="day">Wed</td> 
          <td class="day">Thu</td> 
          <td class="day">Fri</td> 
          <td class="day">Sat</td>
        </table> 
        <div class="frame"> 
          <table class="dates-table"> 
              <tbody class="tbody">             
              </tbody> 
          </table>
        </div> 
      </div>
    </div>
    <div class="events-container">
    </div>
     </div>
  <!-- Dialog Box-->
  <script
    src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
    crossorigin="anonymous">
  </script>
  <script>
//Setup the calendar with the current date
  $(document).ready(function(){
      var date = new Date();
      var today = date.getDate();
      // Set click handlers for DOM elements
      $(".right-button").click({date: date}, next_year);
      $(".left-button").click({date: date}, prev_year);
      $(".month").click({date: date}, month_click);
      $("#add-button").click({date: date}, new_event);
      // Set current month as active
      $(".months-row").children().eq(date.getMonth()).addClass("active-month");
      init_calendar(date);
      var events = check_events(today, date.getMonth()+1, date.getFullYear());
      show_events(events, months[date.getMonth()], today);
  });

  // Initialize the calendar by appending the HTML dates
  function init_calendar(date) {
      $(".tbody").empty();
      $(".events-container").empty();
      var calendar_days = $(".tbody");
      var month = date.getMonth();
      var year = date.getFullYear();
      var day_count = days_in_month(month, year);
      var row = $("<tr class='table-row'></tr>");
      var today = date.getDate();
      // Set date to 1 to find the first day of the month
      date.setDate(1);
      var first_day = date.getDay();
      // 35+firstDay is the number of date elements to be added to the dates table
      // 35 is from (7 days in a week) * (up to 5 rows of dates in a month)
      for(var i=0; i<35+first_day; i++) {
          // Since some of the elements will be blank, 
          // need to calculate actual date from index
          var day = i-first_day+1;
          // If it is a sunday, make a new row
          if(i%7===0) {
              calendar_days.append(row);
              row = $("<tr class='table-row'></tr>");
          }
          // if current index isn't a day in this month, make it blank
          if(i < first_day || day > day_count) {
              var curr_date = $("<td class='table-date nil'>"+"</td>");
              row.append(curr_date);
          }   
          else {
              var curr_date = $("<td class='table-date'>"+day+"</td>");
              var events = check_events(day, month+1, year);
              if(today===day && $(".active-date").length===0) {
                  curr_date.addClass("active-date");
                  show_events(events, months[month], day);
              }
              // If this date has any events, style it with .event-date
              if(events.length!==0) {
                  curr_date.addClass("event-date");
              }
              // Set onClick handler for clicking a date
              curr_date.click({events: events, month: months[month], day:day}, date_click);
              row.append(curr_date);
          }
      }
      // Append the last row and set the current year
      calendar_days.append(row);
      $(".year").text(year);
  }

  // Get the number of days in a given month/year
  function days_in_month(month, year) {
      var monthStart = new Date(year, month, 1);
      var monthEnd = new Date(year, month + 1, 1);
      return (monthEnd - monthStart) / (1000 * 60 * 60 * 24);    
  }

  // Event handler for when a date is clicked
  function date_click(event) {
      $(".events-container").show(250);
      $("#dialog").hide(250);
      $(".active-date").removeClass("active-date");
      $(this).addClass("active-date");
      show_events(event.data.events, event.data.month, event.data.day);
  };

  // Event handler for when a month is clicked
  function month_click(event) {
      $(".events-container").show(250);
      $("#dialog").hide(250);
      var date = event.data.date;
      $(".active-month").removeClass("active-month");
      $(this).addClass("active-month");
      var new_month = $(".month").index(this);
      date.setMonth(new_month);
      init_calendar(date);
  }

  // Event handler for when the year right-button is clicked
  function next_year(event) {
      $("#dialog").hide(250);
      var date = event.data.date;
      var new_year = date.getFullYear()+1;
      $("year").html(new_year);
      date.setFullYear(new_year);
      init_calendar(date);
  }

  // Event handler for when the year left-button is clicked
  function prev_year(event) {
      $("#dialog").hide(250);
      var date = event.data.date;
      var new_year = date.getFullYear()-1;
      $("year").html(new_year);
      date.setFullYear(new_year);
      init_calendar(date);
  }

  // Event handler for clicking the new event button
  function new_event(event) {
      // if a date isn't selected then do nothing
      if($(".active-date").length===0)
          return;
      // remove red error input on click
      $("input").click(function(){
          $(this).removeClass("error-input");
      })
      // empty inputs and hide events
      $("#dialog input[type=text]").val('');
      $("#dialog input[type=number]").val('');
      $(".events-container").hide(250);
      $("#dialog").show(250);
      // Event handler for cancel button
      $("#cancel-button").click(function() {
          $("#name").removeClass("error-input");
          $("#count").removeClass("error-input");
          $("#dialog").hide(250);
          $(".events-container").show(250);
      });
      // Event handler for ok button
      $("#ok-button").unbind().click({date: event.data.date}, function() {
          var date = event.data.date;
          var name = $("#name").val().trim();
          var count = parseInt($("#count").val().trim());
          var day = parseInt($(".active-date").html());
          // Basic form validation
          if(name.length === 0) {
              $("#name").addClass("error-input");
          }
          else if(isNaN(count)) {
              $("#count").addClass("error-input");
          }
          else {
              $("#dialog").hide(250);
              console.log("new event");
              new_event_json(name, count, date, day);
              date.setDate(day);
              init_calendar(date);
          }
      });
  }

  // Adds a json event to event_data
  function new_event_json(name, count, date, day) {
      var event = {
          "occasion": name,
          "invited_count": count,
          "year": date.getFullYear(),
          "month": date.getMonth()+1,
          "day": day
      };
      event_data["events"].push(event);
  }

  // Display all events of the selected date in card views
  function show_events(events, month, day) {
      // Clear the dates container
      $(".events-container").empty();
      $(".events-container").show(250);
      console.log(event_data["events"]);
      // If there are no events for this date, notify the user
      if(events.length===0) {
          var event_card = $("<div class='event-card'></div>");
          var event_name = $("<div class='event-name'>There are no events planned for "+month+" "+day+".</div>");
          $(event_card).css({ "border-left": "10px solid #FF1744" });
          $(event_card).append(event_name);
          $(".events-container").append(event_card);
      }
      else {
          // Go through and add each event as a card to the events container
          for(var i=0; i<events.length; i++) {
              var event_card = $("<div class='event-card'></div>");
              var event_name = $("<div class='event-name'>"+events[i]["occasion"]+":</div>");
              var event_count = $("<div class='event-count'>"+events[i]["invited_count"]+" Invited</div>");
              if(events[i]["cancelled"]===true) {
                  $(event_card).css({
                      "border-left": "10px solid #FF1744"
                  });
                  event_count = $("<div class='event-cancelled'>Cancelled</div>");
              }
              $(event_card).append(event_name).append(event_count);
              $(".events-container").append(event_card);
          }
      }
  }

  // Checks if a specific date has any events
  function check_events(day, month, year) {
      var events = [];
      for(var i=0; i<event_data["events"].length; i++) {
          var event = event_data["events"][i];
          if(event["day"]===day &&
              event["month"]===month &&
              event["year"]===year) {
                  events.push(event);
              }
      }
      return events;
  }

  // Given data for events in JSON format
  var event_data = {
      "events": [
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
          {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10
      },
          {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10
      },
          {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10
      },
          {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10,
          "cancelled": true
      },
      {
          "occasion": " Repeated Test Event ",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 10
      },
      {
          "occasion": " Test Event",
          "invited_count": 120,
          "year": 2017,
          "month": 5,
          "day": 11
      }
      ]
  };

  const months = [ 
      "January", 
      "February", 
      "March", 
      "April", 
      "May", 
      "June", 
      "July", 
      "August", 
      "September", 
      "October", 
      "November", 
      "December" 
  ];
  
  </script>
</div>
</div>
</div>

</body>
</html>