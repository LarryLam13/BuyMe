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
<title>LOGIN PAGE</title>
</head>
<body>
	<% //Create a connection string
	
	String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
	//Load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
	
	//Get the database connection
	Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
	//Create a SQL statement
	Statement stmt = con.createStatement();
	
	PreparedStatement ps = null;
	ResultSet result = null;
	
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

	try {
			ResultSet result2 = null;
			String newEmail = null;
			String str1 = "SELECT email FROM Users where username = '" + session.getAttribute("USERNAME") + "';";
			result2 = stmt.executeQuery(str1);
			while(result2.next())
			{
				newEmail = result2.getString("email");

			}
			
			String str = "SELECT * FROM Email WHERE `from` = ? or`to` = ?;";
			ps = con.prepareStatement(str);
			ps.setString(1, newEmail);
			ps.setString(2, newEmail);
			result = ps.executeQuery();
			
			//Make an HTML table to show the results in:
	
			
				
			out.print("<table>");
			//make a row
			out.print("<tr>");
			out.print("<th>");
			out.print("Email ID");
			out.print("</th>");		

			out.print("<th>");
			out.print("From");
			out.print("</th>");	

			out.print("<th>");
			out.print("To");
			out.print("</th>");	

			out.print("<th>");
			out.print("Subject");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Content");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Time Sent");
			out.print("</th>");	
			
			while (result.next()) 
			{
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("email_id"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("from"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("to"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("subject"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("content"));
				out.print("</td>");
		 
				out.print("<td>");
				out.print(result.getString("date_time"));
				out.print("</td>");
			}
			out.print("</table>");	
		    out.print("<form action='sendEmail.jsp' method='get'><button name='email' type='submit' value='" + newEmail + "'>Send Email</button></form>");

			
		} 
	catch (Exception e) 
	{
		out.print(e);
	}
	finally
	{
		if (result != null) result.close();
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>
		
			


</body>
</html>