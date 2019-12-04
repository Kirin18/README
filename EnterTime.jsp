
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

<h2>Please Enter Locked Time</h2>

<body>

<%! class EnterTime{ %>
<%! double hoursBetween (Date lock, Date open){
	double difference = (lock.getTime()- open.getTime())/3600000; //1 hour in miliseconds
	return Math.abs(difference);
}
}%>


    
<%
 Date today = new Date();
 Calendar myNextCalendar = Calendar.getInstance();
 
// String date = request.getParameter("date");
 //SimpleDateFormat var = new SimpleDateFormat("dd-MM-yyyy hh:mm");
// Date lockedtime = var.parse(date);// availableDate is a String Array not a String.
 
 
 
 myNextCalendar.set(2019, 11, 2, 23, 30);
 myNextCalendar.getTime();

 
 // int time =Integer.parseInt(request.getParameter("time")); 
 //myNextCalendar.set(Integer.parseInt(request.getParameter("hours")), Integer.parseInt(request.getParameter("hours")));//, month, date, hourOfDay, minute)
 
 //String lockedtime = request.getParameter("date");  
 //SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
 //Date time = formater.parse(lockedtime);


 Date lockedtime = myNextCalendar.getTime(); 
 
EnterTime myObject = new EnterTime();
 double hours = myObject.hoursBetween(today, lockedtime);
 
SimpleDateFormat DATEFORMAT = new SimpleDateFormat("hh:mm dd-MM-yyyy");
String todaydate = DATEFORMAT.format(today);
String lockeddate = DATEFORMAT.format(lockedtime);
%>

 



Today's date in default format : <%= today %>
<br> <br>
Today's date in time and date format : <%= todaydate %>
<br> <br>
Total hours used is <%= hours %> hours from current time  <%= todaydate%> until  <%=lockedtime %>

<form name="nextpage" action="CountRate.jsp">
 <% session.setAttribute("hours", hours); %>

<input type="submit"  value="Next"> 
</form>


</body>
</html>