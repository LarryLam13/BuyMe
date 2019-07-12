<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autobid</title>
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
	String newMaxAmount = request.getParameter("max_amount");
	String insert = "INSERT INTO Autobids(username, max_amount, auction_id) " +
			"VALUES(?, ?, ?)";
	ps = con.prepareStatement(insert);
	ps.setString(1, (String)session.getAttribute("USERNAME"));
	ps.setString(2, newMaxAmount);
	ps.setString(3, (String)session.getAttribute("AUCTION"));
	ps.executeUpdate();
	response.sendRedirect("itemBid.jsp?auct="+ (String)session.getAttribute("AUCTION"));
}
catch (Exception e) 
{
		out.print(e);
}
finally
{
	if (ps != null) ps.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();

}%>


</body>
</html>