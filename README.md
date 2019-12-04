# README

ONLINE LOCKER SYSTEM

  Functionality of the system:
    - Check availability of the lockers
    - Allow the user to choose one locker from 30 available lockers
    - Allow the user to set password for chosen locker
    - Set the start time of locker usage
    - End the time of locker usage
    - Count the rate based on the total time used:
        - First 6 hour = RM0.50 per hour
        - After 6 hour within the first 24 hour = RM2 per hour
        - The next hour within 2 days = RM5 per hour
        - Unclaimed items after 2 days will be fined = RM10 per day
    

  Task distribution:
    - Homepage = Ahmad Huzaifi
    - Locker Availability = Abdul Azim
    - Locker Password = Abdul Azim
    - Timer = Muhamad Murshyid
    - Rate Count = Muhamad Murshyid
    - Payment = Syafiq Asyraf
    - Item Retrievel Confirmation = Syafiq Asyraf
    
  
  System Codes based on functionalities:
  
    - Homepage
    
    - Locker Availability and Password [ Azim ] 
    // HTML form
    <html>

	    <form action="password.jsp" method="post">
	
    	<table>
	
	    	<tr><td>Locker Number:</td><td><input type="number" name="lockerNo" ></td></tr>
	    	<tr><td>Set Password</td><td><input type="password" name="lockerPass"></td></tr>
	    	<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr>
	    	<tr><td><input type="submit" value="Change Password"></td></tr>
		
	    </table>
	
	    </form>
	
     </html>
     
     // password.jsp
     
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*"%>
      <%@page import="java.io.*"%>

	    <%! 
	
	        int i;
        	boolean[] status = new boolean[30]; 
	
     	%>

      <%
    	int lockerNo = Integer.parseInt(request.getParameter("lockerNo"));
	    String lockerPass = request.getParameter("lockerPass");
	    String conPass = request.getParameter("confirm");
      %>
	    <%for(i = 0; i < 30; i++){%>
		
		   <% if(status[lockerNo] != true){
			
			  status[lockerNo] = true; 
			  out.print("Locker Number: " +lockerNo); 
		  	out.print("Locker Password: " +lockerPass);
			  <jsp:include page='setTime.jsp' flush='true' />
			
		  }
		
		  else{%>
			
			   You've selected an occupied locker. Please choose another locker.
			
		    <%}%>
	    <%}%>
	
      %>
      
      
  
 
