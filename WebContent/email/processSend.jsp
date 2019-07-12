<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<br>
<% 
String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
//Load JDBC driver
Class.forName("com.mysql.jdbc.Driver");

//Get the database connection
Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
//Create a SQL statement
Statement stmt = con.createStatement();
PreparedStatement ps = null;

try 
{
	String insert = "INSERT INTO Email(`from`, `to`, date_time, `subject`, `content`) VALUES(?, ?, NOW(), ?, ?)";	
	ps = con.prepareStatement(insert);
	ps.setString(1, request.getParameter("from"));
	ps.setString(2, request.getParameter("to"));
	ps.setString(3, request.getParameter("subject"));
	ps.setString(4, request.getParameter("content"));
	ps.executeUpdate();
	response.sendRedirect("email.jsp");
	
}
	catch (Exception e) 
	{
			out.print(e);
	}
	finally
	{
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>
	<br/>
	Answer:
	<form method="post" action="processAnswer.jsp">
	<textarea style=" height: 220px; width:280px; " name="a_text"></textarea>
	<br/>
	<input type="submit" value="Post Answer">
	</form>
	
</body>
</html>