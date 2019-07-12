<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserParticipation History Search </title>
</head>
<b> Buyer search</b>
<form name="Usersearch" method="post" action="UserResults.jsp">
	<table>
	
	<tr>    
	<td>Username: </td><td><input type="text" name="Username" ></td>
	</tr>
	</table>
	<input type="submit" value="Search">
</form>
<b> Seller Search</b>
<form name="Usersearch" method="post" action="UserResults1.jsp">
	<table>
	
	<tr>    
	<td>Username: </td><td><input type="text" name="Username1" ></td>
	</tr>
	</table>
	<input type="submit" value="Search">
</form>
	
<body>

</body>
</html>