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
<title>Search result </title>
</head>
<body>

	<% 
	String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
	//Load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
	
	//Get the database connection
	Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
	//Create a SQL statement
	Statement stmt = con.createStatement();
	ResultSet result = null;
	try {
			String makerv= request.getParameter("Manufacturer");
			String modelv= request.getParameter("Model");
			String typev= request.getParameter("Type");
			String pricev = request.getParameter("Price");
			String auctionidv=request.getParameter("AuctionID");
			String statusv= request.getParameter("status2");
			//query 
			String str = "Select maker, type, model,auction_id,min_price from Auction Join Items using(item_id) WHERE (maker ='" + makerv + "') and (type ='" + typev + "') and (model ='" + modelv + "') and  (auction_id = '" + auctionidv + "') and (status ='" + statusv  + "') ;";
			//Run the query against the database.
			 result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");	

			out.print("<th>");
			out.print("maker");
			out.print("</th>");	

			out.print("<th>");
			out.print("type");
			out.print("</th>");	

			out.print("<th>");
			out.print("Model");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Auction_ID");
			out.print("</th>");

			
			while (result.next()) 
			{
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("Maker"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("Type"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("Model"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("auction_id"));
				out.print("</td>");
				
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
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>

</body>
</html>