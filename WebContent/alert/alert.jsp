<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Create</title>
</head>
<body>
<h1>View Alerts</h1>
	<style type="text/css">
		body {
			background-image: url("https://previews.123rf.com/images/gorkemdemir/gorkemdemir1409/gorkemdemir140901183/31676072-alert-red-rubber-stamp-over-a-white-background-.jpg")
		}
		h1 {
			color: mediumseagreen;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
		</style> 
<% 
String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
//Load JDBC driver
Class.forName("com.mysql.jdbc.Driver");
//Get the database connection
Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
//Create a SQL statement
Statement stmt = con.createStatement();
try {
		
			String type = request.getParameter("type");
			if(type.equals("PC"))
			{
				out.print("<form name='regForm' method='post' action='createAlert.jsp'>");
				out.print("<table>");
				out.print("<tr>");    
				out.print("<td>Type: </td><td><input type='text' name='type' value='PC' readonly='readonly'></td>");
				out.print("</tr>");
				out.print("<tr>");   
				out.print("<td>Manufacturer: </td><td><input type='text' name='maker' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>Model: </td><td><input type='text' name='model' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>RAM: </td><td><input type='text' name='ram' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
			    out.print("<td>Hard Drive: </td><td><input type='text' name='hd' required></td>");
			    out.print("</tr>");
			    out.print("</table>");
			    out.print("<input type='submit' value='Create Alert'>");
			    out.print("</form>");
			}
			
			if(type.equals("Laptop"))
			{
				out.print("<form name='regForm' method='post' action='createAlert.jsp'>");
				out.print("<table>");
				out.print("<tr>");    
				out.print("<td>Type: </td><td><input type='text' name='type' value='Laptop' readonly='readonly'></td>");
				out.print("</tr>");
				out.print("<tr>");   
				out.print("<td>Manufacturer: </td><td><input type='text' name='maker' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>Model: </td><td><input type='text' name='model' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>RAM: </td><td><input type='text' name='ram' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
			    out.print("<td>Hard Drive: </td><td><input type='text' name='hd' required></td>");
			    out.print("</tr>");
			    out.print("<tr>");
			    out.print("<td>Screen: </td><td><input type='text' name='screen' required></td>");
			    out.print("</tr>");	
			    out.print("</table>");
			    out.print("<input type='submit' value='Create Alert'>");
			    out.print("</form>");
			}
			
			if(type.equals("Tablet"))
			{
				out.print("<form name='regForm' method='post' action='createAlert.jsp'>");
				out.print("<table>");
				out.print("<tr>");    
				out.print("<td>Type: </td><td><input type='text' name='type' value='Tablet' readonly='readonly'></td>");
				out.print("</tr>");
				out.print("<tr>");   
				out.print("<td>Manufacturer: </td><td><input type='text' name='maker' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>Model: </td><td><input type='text' name='model' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
				out.print("<td>Capacity: </td><td><input type='text' name='capacity' required></td>");
				out.print("</tr>");
				out.print("<tr> ");   
			    out.print("<td>Screen: </td><td><input type='text' name='screen' required></td>");
			    out.print("</tr>");
			    out.print("<tr>");
			    out.print("<td>Color: </td><td><input type='text' name='color' required></td>");
			    out.print("</tr>");	
			    out.print("</table>");
			    out.print("<input type='submit' value='Create Alert'>");
			    out.print("</form>");
			}	
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
		
		


</body>
</html>