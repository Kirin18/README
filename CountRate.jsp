<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
  <%@ page session="true"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Count Rate Page</title>
</head>
<body>


<%! private double rate; %>

 
<% double hours = Double.parseDouble(session.getAttribute("hours").toString()); %>

 <% if(hours<= 6)
 {  %>

<% 	rate = 0.5 * hours;
}
%>
<%	if(hours> 6 && hours<=24) { %>
	
<%	rate = 2 * hours;
	
	}
%>
<% 	if(hours> 24 && hours <=48) { %>
	
<%	rate = 5 * hours;
	
	}
%>
<% 	if(hours>48) { %>
	
<%	rate = 10 * (hours/24);
	
	}
%>
 <% rate = Double.parseDouble(String.format("%.2f", rate)); %>
Total locker rental fees need to be paid is RM<%= rate %>

</body>
</html>