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
	String insert ="SELECT * FROM Autobids WHERE username ='" + session.getAttribute("USERNAME") + "'";
	result = stmt.executeQuery(insert);
	
	out.print("Auto bids");
	out.print("<table>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Auction ID");
	out.print("</th>");		
	out.print("<th>");
	out.print("Username");
	out.print("</th>");	
	out.print("<th>");
	out.print("Amount");
	out.print("</th>");		
	out.print("<th>");
	out.print(" ");
	out.print("</th>");	
	
	out.print("</tr>");
	
	while (result.next()) 
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("auction_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("username"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(result.getString("max_amount"));
		out.print("</td>");
		
		out.print("<td>");
		out.print("<form action='deleteAutoBid.jsp' method='get'><button name='autobid' type='submit' value='" + result.getString("autobid_id") + "'>Delete Autobid</button></form>");
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