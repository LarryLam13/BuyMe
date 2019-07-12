<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN</title>
</head>
<body>
<form action="registerCR.jsp">
    <input type="submit" value="Create Customer Rep" />
</form>
<form action="generateSalesReport.jsp">
    <input type="submit" value="Create Sales Report" />
</form>
<form action="email/email.jsp">
    <input type="submit" value="Email" />
</form>
</body>
</html>