<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
</head>
<body>
<h1>Welcome to BuyMe!</h1>
	<h2>The Best Products at the Best Prices!</h2>
	<style type="text/css">
		body {
			background-image: url("https://previews.123rf.com/images/slena/slena1402/slena140200139/25941203-i-m-bestseller-buy-me-explosion-design-in-pop-art-style-.jpg")
		}
		h1 {
			color: blue;
			font-size: 35px;
			font-family: "Times New Roman", Times, serif; 
		}
		h2 {
			color: purple;
			font-size: 25px;
		}
	</style>
<br>
	<form method="post" action="login.jsp">
	<table>
	<tr>    
	<td>Username: </td><td><input type="text" name="username" required></td>
	</tr>
	<tr>
	<td>Password: </td><td><input type="password" name="password" required></td>
	</tr>
	</table>
	<input type="submit" value="Log in!">
	</form>
<br>
<div>
<a href="register.jsp">Or click here to register an account</a>
</div>
</body>
</html>