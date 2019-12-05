<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
  <%@ page session="true"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Count Rate Page</title>
</head>

<style>

body {
  font-family:sans-serif;
  background-color: linen;
}

}

h2 {
  color: maroon;
  margin-left: 40px;}


</style>

<body>

<h2> Total Rate Locker Storage </h2>
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
Total locker rental fees need to be paid is <mark> <b>RM<%= rate %> </b>  </mark>

</body>
</html>