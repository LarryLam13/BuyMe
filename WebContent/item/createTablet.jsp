<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new Tablet item</title>
</head>
<body>
<h1>Sell your Tablet</h1>
	<style type="text/css">
		body {
			background-image: url("https://media.wired.com/photos/5a2b2d4ea850e23a4736f3be/master/w_2400,c_limit/amazonfire-TA.jpg")
		}
		h1 {
			color: maroon;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
	</style>
<%
if(session.getAttribute("ACCOUNT_TYPE").equals("seller"))
{
	out.print("Logged in as: Seller");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
}

if(session.getAttribute("ACCOUNT_TYPE").equals("buyer"))
{
	out.print("Logged in as: Buyer");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
}
%>
<br>
	<form name="regForm" method="post" action="createAuction.jsp">
	<table>
	<tr>    
	<td>Type: </td><td><input type="text" name="type" value="Tablet" readonly="readonly"></td>
	</tr>
	<tr>    
	<td>Manufacturer: </td><td><input type="text" name="maker" required></td>
	</tr>
	<tr>    
	<td>Model: </td><td><input type="text" name="model" required></td>
	</tr>
	<tr>    
	<td>Color: </td><td><input type="text" name="color" required></td>
	</tr>
	<tr>    
	<td>Capacity: </td><td><input type="text" name="capacity" required></td>
	</tr>
	<tr>    
	<td>Screen: </td><td><input type="text" name="screen" required></td>
	</tr>   
	
	<tr>    
	<td>Start Date: </td><td><input type="datetime-local" name="start_date" required></td>
	</tr>
	
	<tr>    
	<td>End Date: </td><td><input type="datetime-local" name="end_date" required></td>
	</tr> 
	
	<tr>    
	<td>Min Price: </td><td><input type="text" name="min_price" required></td>
	</tr>	
	<tr>    
	<td>Starting Price: </td><td><input type="text" name="price" required></td>
	</tr>	
	</table>
	<input type="submit" value="Create Auction">
	
	</form>
</body>
</html>