
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.ParseException"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter Locked Time</title>
</head>
<h1>Locker Storage System</h1>
<h2>Time Locker Used From Current Time  </h2>

<style>

body {
  font-family:sans-serif;
  background-color: linen;
}

}

h1 {
  color: maroon;
  margin-left: 40px;}


</style>


<body>

<%! class EnterTime{ %>
<%! double hoursBetween (Date lock, Date open){
	double difference = (lock.getTime()- open.getTime())/3600000; //1 hour in miliseconds
	return Math.abs(difference);  //convert negative value if any
}
}%>


    
<%
 Date today = new Date();   //create object of Date class
 Calendar myNextCalendar = Calendar.getInstance(); //return current time of default calendar
 
// String date = request.getParameter("date");
 //SimpleDateFormat var = new SimpleDateFormat("dd-MM-yyyy hh:mm");
// Date lockedtime = var.parse(date);// availableDate is a String Array not a String.
 
 
 
 myNextCalendar.set(2019, 11, 3, 11, 30); //set specific date and time for locked time
 myNextCalendar.getTime();

 
 // int time =Integer.parseInt(request.getParameter("time")); 
 //myNextCalendar.set(Integer.parseInt(request.getParameter("hours")), Integer.parseInt(request.getParameter("hours")));//, month, date, hourOfDay, minute)
 
 //String lockedtime = request.getParameter("date");  
 //SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
 //Date time = formater.parse(lockedtime);


 Date lockedtime = myNextCalendar.getTime(); 
 
EnterTime myObject = new EnterTime();


double hours = myObject.hoursBetween(today, lockedtime); //call hoursBetween method to assign to hours variable
 
SimpleDateFormat DATEFORMAT = new SimpleDateFormat("hh:mm aa dd-MM-yyyy"); //create DATEFORMAT object with specific format
String todaydate = DATEFORMAT.format(today); 
String lockeddate = DATEFORMAT.format(lockedtime);
%>

 
Today's date in time and date format : <b> <%= todaydate %> </b>
<br> <br>
<h3>Locker Rate </h3>
<b>First 6 hours : RM0.50/hour <br>
6 -  24 hours: RM2.00/hour  <br>
24 - 48 hours :RM5.00/hour  <br>
Fine for Uncollected Items Within 2days: RM10/day  <br>
*Please collect at Uncollected Sections </b>

<br> <br>
Total hours : <b><%= hours %> hours </b> used from <br> locked time:       <b><%=lockeddate %></b> until <br> current time(now): <b><%= todaydate%></b>

<form name="nextpage" action="CountRate.jsp">
 <% session.setAttribute("hours", hours); %>

<input type="submit"  value="Next"> 
</form>


</body>
</html>