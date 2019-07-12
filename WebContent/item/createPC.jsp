<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new PC item</title>
</head>
<body>
<h1>Sell your PC</h1>
	<style type="text/css">
		body {
			background-image: url("https://brain-images-ssl.cdn.dixons.com/9/3/10164639/u_10164639.jpg")
		}
		h1 {
			color: indigo;
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
	<td>Type: </td><td><input type="text" name="type" value="PC" readonly="readonly"></td>
	</tr>
	<tr>    
	<td>Manufacturer: </td><td><input type="text" name="maker" required></td>
	</tr>
	<tr>    
	<td>Model: </td><td><input type="text" name="model" required></td>
	</tr>
	<tr>    
	<td>RAM: </td><td><input type="text" name="ram" required></td>
	</tr>
	<tr>    
	<td>Hard Drive: </td><td><input type="text" name="hd" required></td>
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