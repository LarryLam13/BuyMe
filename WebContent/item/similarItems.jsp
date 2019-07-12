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
<title>Similar Items</title>
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
//Get the combobox from the index.jsp
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
try 
{
	String auctionID = request.getParameter("auct");
	String str = "SELECT * FROM Auction " + "JOIN Items using (item_id) " +  
			"WHERE auction_id ='" + auctionID + "'";
	result = stmt.executeQuery(str);
	result.next();	
	out.print("Similar Items");

	if(result.getString("type").equals("PC"))
	{
		str = "SELECT * FROM Auction " + "JOIN Items using (item_id) " + 
				"JOIN PC using (item_id)" +
				"WHERE auction_id ='" + auctionID + "'";
		result = stmt.executeQuery(str);
		result.next();	
		String newMaker = result.getString("maker");
		String newModel = result.getString("model");
		String newRam = result.getString("ram");
		String newHD = result.getString("hd");
		String newType = result.getString("type");
		

		String insert ="SELECT * FROM Items i JOIN Auction using (item_id) JOIN PC p using (item_id) WHERE i.maker = ? and i.model = ? and "
				+ "i.type = ? and p.hd = ? and p.ram = ? and start_date <= (SELECT DATE_ADD(NOW(), INTERVAL -1 MONTH)) and  auction_id <>'" + auctionID + "'"; 
		
		ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newMaker);
		ps.setString(2, newModel);
		ps.setString(3, newType);
		ps.setString(4, newHD);
		ps.setString(5, newRam);
		ResultSet result2 = ps.executeQuery();
		
		out.print("<table>");
		out.print("<tr>");	
		out.print("<th>");
		out.print("Auction ID");
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
		out.print("Start Date");
		out.print("</th>");	
		out.print("<th>");
		out.print("End Date");
		out.print("</th>");	
		out.print("<th>");
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");
		
		while (result2.next()) 
		{
			out.print("<tr>");
			
			out.print("<td>");
			out.print(result2.getString("auction_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("type"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("maker"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("model"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("hd"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("ram"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("start_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("end_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='itemBid.jsp' method='get'><button name='auct' type='submit' value='" + result2.getString("auction_id") + "'>View Item</button></form>");
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
	}
	
	else if(result.getString("type").equals("Laptop"))
	{
		str = "SELECT * FROM Auction " + "JOIN Items using (item_id) " + 
				"JOIN Laptops using (item_id)" +
				"WHERE auction_id ='" + auctionID + "'";
		result = stmt.executeQuery(str);
		result.next();	
		String newMaker = result.getString("maker");
		String newModel = result.getString("model");
		String newRam = result.getString("ram");
		String newHD = result.getString("hd");
		String newScreen = result.getString("screen");
		String newType = result.getString("type");


		String insert ="SELECT * FROM Items i JOIN Auction using (item_id) JOIN Laptops p using (item_id) WHERE i.maker = ? and i.model = ? and "
				+ "i.type = ? and p.hd = ? and p.ram = ? and p.screen = ? and start_date <= (SELECT DATE_ADD(NOW(), INTERVAL -1 MONTH)) and  auction_id <>'" + auctionID + "'"; 
		
		ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newMaker);
		ps.setString(2, newModel);
		ps.setString(3, newType);
		ps.setString(4, newHD);
		ps.setString(5, newRam);
		ps.setString(6, newScreen);
		ResultSet result2 = ps.executeQuery();
		
		out.print("<table>");
		out.print("<tr>");	
		out.print("<th>");
		out.print("Auction ID");
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
		out.print("Start Date");
		out.print("</th>");	
		out.print("<th>");
		out.print("End Date");
		out.print("</th>");	
		out.print("<th>");
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");
		
		while (result2.next()) 
		{
			out.print("<tr>");
			out.print("<td>");
			out.print(result2.getString("auction_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result2.getString("type"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("maker"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("model"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("hd"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("ram"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("screen"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("start_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("end_date"));
			out.print("</td>"); 
			
			out.print("<td>");
			out.print("<form action='itemBid.jsp' method='get'><button name='auct' type='submit' value='" + result2.getString("auction_id") + "'>View Item</button></form>");
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");	
	}
	
	else if(result.getString("type").equals("Tablet"))
	{
		str = "SELECT * FROM Auction " + "JOIN Items using (item_id) " + 
				"JOIN Tablets using (item_id)" +
				"WHERE auction_id ='" + auctionID + "'";
		result = stmt.executeQuery(str);
		result.next();	
		String newMaker = result.getString("maker");
		String newModel = result.getString("model");
		String newCapacity = result.getString("capacity");
		String newColor = result.getString("color");
		String newScreen = result.getString("screen");
		String newType = result.getString("type");

		String insert = "SELECT * FROM Items i JOIN Auction using (item_id) JOIN Tablets p using (item_id) WHERE i.maker = ? and i.model = ? and "
				+ "i.type = ? and p.capacity = ? and p.color = ? and p.screen = ? and start_date <= (SELECT DATE_ADD(NOW(), INTERVAL -1 MONTH)) and  auction_id <>'" + auctionID + "'";
		ps = con.prepareStatement(insert);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newMaker);
		ps.setString(2, newModel);
		ps.setString(3, newType);
		ps.setString(4, newCapacity);
		ps.setString(5, newColor);
		ps.setString(6, newScreen);
		ResultSet result2 = ps.executeQuery();
		
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Auction ID");
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
		out.print("Start Date");
		out.print("</th>");	
		out.print("<th>");
		out.print("End Date");
		out.print("</th>");	
		out.print("<th>");
		out.print(" ");
		out.print("</th>");
		out.print("</tr>");
		
		while (result2.next()) 
		{
			out.print("<tr>");
			out.print("<td>");
			out.print(result2.getString("auction_id"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("type"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("maker"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("model"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("capacity"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("color"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("screen"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("start_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result2.getString("end_date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form action='itemBid.jsp' method='get'><button name='auct' type='submit' value='" + result2.getString("auction_id") + "'>View Item</button></form>");
			out.print("</td>");
			out.print("</tr>");
			
		}
		out.print("</table>");	
	}

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
