<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>What are you looking for? </title>
</head>
<body> 
	<b> GENERAL SEARCH </b>
	<form name="Itemsearch" method="post" action="searchResult.jsp">
	<table>
	<tr>    
	<td>Manufacturer: </td><td><input type="text" name="Manufacturer" ></td>
	</tr>
	<tr>
	<td>Type: </td><td><input type="text" name="Type" ></td>
	</tr>
	<tr>    
	<td>Model: </td><td><input type="text" name="Model" ></td>
	</tr>
	<tr>    
	<td>PriceMax: </td><td><input type="text" name="Price" ></td>
	</tr>
	<tr>    
	<td>AuctionID: </td><td><input type="text" name="AuctionID" ></td>
	</tr>
	</table>
	<p>Is the Auction Open or Closed? </p> 
	<input type="radio" name="status1" value="open"> Open<br>
	<input type="radio" name="status1" value="closed"> Closed <br>
	<input type="submit" value="Search">
	
	
	</form>
	<b> SPECIFIC SEARCH </b>
	<form name="Itemsearch" method="post" action="searchSpecificResult.jsp">
	<table>
	<tr>    
	<td>Manufacturer: </td><td><input type="text" name="Manufacturer"required ></td>
	</tr>
	<tr>
	<td>Type: </td><td><input type="text" name="Type"required ></td>
	</tr>
	<tr>    
	<td>Model: </td><td><input type="text" name="Model" required></td>
	</tr>
	<tr>    
	<td>AuctionID: </td><td><input type="text" name="AuctionID" required ></td>
	</tr>
	</table>
	<p>Is the Auction Open or Closed? </p> 
	
	<input type="radio" name="status2" value="open"> Open<br>
	<input type="radio" name="status2" value="closed"> Closed <br>
	<input type="submit" value="Search">
	</form>
	

</body>
</html>