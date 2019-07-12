<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<br>
	<form name="regForm" method="post" action="newUser.jsp">
	<table>
	<tr>    
	<td>Username: </td><td><input type="text" name="username" required></td>
	</tr>
	<tr>
	<td>Password: </td><td><input type="text" name="password" required></td>
	</tr>
	<tr>    
	<td>Address: </td><td><input type="text" name="address" required></td>
	</tr>
	<tr>
	<td>Email: </td><td><input type="text" name="email" required></td>
	</tr>
	<tr>
	<td>Phone: </td><td><input type="text" name="phone_num" required></td>
	</tr>
	</table>
	<input type="radio" name="account_type" value="buyer" checked> Buyer<br>
  	<input type="radio" name="account_type" value="seller"> Seller<br>
	<input type="submit" value="Register User">
	</form>
<br>
<div>
<a href="index.jsp">Or click here to return to login</a>
</div>
</body>
</html>