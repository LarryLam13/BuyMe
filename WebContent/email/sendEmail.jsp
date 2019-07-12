<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Email</title>
</head>
<body>
<br>
		<%session.setAttribute( "EMAIL", request.getParameter("email"));%>

	<form name="emailsent" method="post" action="processSend.jsp">
	<table>
	<tr>    
	<td>To: </td><td><input type="text" name="to" required></td>
	</tr>
	<tr>
	<% out.print("<td>From: </td><td><input type='text' name='from' value ='" + request.getParameter("email") + "' required ></td>");%>
	</tr>
	<tr>    
	<td>Subject </td><td><input type="text" name="subject" required></td>
	</tr>
	<tr>    
	<form method="post" action="proccessSend.jsp">
	<textarea style=" height: 220px; width:280px; " name="content"></textarea>
	</tr>
	<br/>
	</table>
	<input type="submit" value="Send Email">
	</form>
<br>
</body>
</html>