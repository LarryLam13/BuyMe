<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
#buttons{
    display:flex;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<meta charset="ISO-8859-1">
<title>View Alerts</title>
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
//Create a connection string

String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
//Load JDBC driver
Class.forName("com.mysql.jdbc.Driver");

//Get the database connection
Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
//Create a SQL statement
Statement stmt = con.createStatement();
ResultSet result = null;
PreparedStatement ps = null;

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

try 
{
	String insert ="SELECT * FROM Alerts WHERE type = 'PC' and username ='" + session.getAttribute("USERNAME") + "'";
	result = stmt.executeQuery(insert);
	
	out.print("PC Alerts");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Alert ID");
	out.print("</th>");		
	out.print("<th>");
	out.print("Type");
	out.print("</th>");	
	out.print("<th>");
	out.print("Manufacturer");
	out.print("</th>");	
	out.print("<th>");
	out.print("Model");
	out.print("</th>");	
	out.print("<th>");
	out.print("HD");
	out.print("</th>");	
	out.print("<th>");
	out.print("RAM");
	out.print("</th>");	
	out.print("<th>");
	out.print(" ");
	out.print("</th>");	
	
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("alert_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("maker"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("model"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("hd"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("ram"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='deleteAlert.jsp' method='get'><button name='alert' type='submit' value='" + result.getString("alert_id") + "'>Delete Alert</button></form>");
		out.print("</td>");

		out.print("</tr>");
		
	}
	out.print("</table>");
	
	out.print("<br/>");
	
	insert ="SELECT * FROM Alerts WHERE type = 'Laptop'  and username ='" + session.getAttribute("USERNAME") + "'";
	result = stmt.executeQuery(insert);
	
	out.print("Laptop Alerts");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Alert ID");
	out.print("</th>");		
	out.print("<th>");
	out.print("Type");
	out.print("</th>");	
	out.print("<th>");
	out.print("Manufacturer");
	out.print("</th>");	
	out.print("<th>");
	out.print("Model");
	out.print("</th>");	
	out.print("<th>");
	out.print("HD");
	out.print("</th>");	
	out.print("<th>");
	out.print("RAM");
	out.print("</th>");	
	out.print("<th>");
	out.print("Screen");
	out.print("</th>");	
	out.print("<th>");
	out.print(" ");
	out.print("</th>");	
	
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("alert_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("maker"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("model"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("hd"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("ram"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("screen"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='deleteAlert.jsp' method='get'><button name='alert' type='submit' value='" + result.getString("alert_id") + "'>Delete Alert</button></form>");
		out.print("</td>");

		out.print("</tr>");
		
	}
	out.print("</table>");	
	
	out.print("<br/>");
	
	insert ="SELECT * FROM Alerts WHERE type = 'Tablet' and username ='" + session.getAttribute("USERNAME") + "'";
	result = stmt.executeQuery(insert);
	
	out.print("Tablet Alerts");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Alert ID");
	out.print("</th>");		
	out.print("<th>");
	out.print("Type");
	out.print("</th>");	
	out.print("<th>");
	out.print("Manufacturer");
	out.print("</th>");	
	out.print("<th>");
	out.print("Model");
	out.print("</th>");	
	out.print("<th>");
	out.print("Capacity");
	out.print("</th>");	
	out.print("<th>");
	out.print("Color");
	out.print("</th>");	
	out.print("<th>");
	out.print("Screen");
	out.print("</th>");	
	out.print("<th>");
	out.print(" ");
	out.print("</th>");	
	
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("alert_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("type"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("maker"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("model"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("capacity"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("color"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("screen"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='deleteAlert.jsp' method='get'><button name='alert' type='submit' value='" + result.getString("alert_id") + "'>Delete Alert</button></form>");
		out.print("</td>");

		out.print("</tr>");
		
	}
	out.print("</table>");	
}
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (result != null) result.close();
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();

}%>


</body>
</html>