<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid</title>
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
try 
{
	//Get the combobox from the index.jsp
	String newBid = request.getParameter("bid");
	String newAuction = (String)session.getAttribute( "AUCTION" );
	String newUser = (String)session.getAttribute( "USERNAME" );
	
	String prevBid = "SELECT * FROM Bids JOIN Auction using (auction_id) WHERE auction_id = ? and amount = (SELECT max(amount) FROM Bids WHERE auction_id = ?)";
	ps = con.prepareStatement(prevBid);
	ps.setString(1, newAuction);
	ps.setString(2, newAuction);
	result = ps.executeQuery();
	result.next();
	
	String initialPrice = result.getString("price");
	String previousBid = result.getString("amount");
	if((Float.parseFloat(newBid) <= Float.parseFloat(previousBid)) || (Float.parseFloat(newBid) < Float.parseFloat(initialPrice)))
	{
		throw new Exception("You can't bid lower than the initial price or the previous highest bid!");
	}
	
	String loserUser = result.getString("buyer");
	if(loserUser != null)
	{
		String message = "You have been outbid on Auction #" + newAuction + "!";
		String insert2 = "INSERT INTO Alerts(username) VALUES(?)";
		ps = con.prepareStatement(insert2);
		ps.setString(1, loserUser);
		ps.executeUpdate();
		
		insert2 = "INSERT INTO Alert_Messages(alert_id, auction_id, message) VALUES(LAST_INSERT_ID(), ?, ?)";
		ps = con.prepareStatement(insert2);
		ps.setString(1, newAuction);
		ps.setString(2, message);
		ps.executeUpdate();
	}
	//Make an insert statement for the Users table:
	String insert = "INSERT INTO Bids(buyer, amount, auction_id)"
					+ "VALUES (?, ?, ?)";
	//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	ps = con.prepareStatement(insert);
			
	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	ps.setString(1, newUser);
	ps.setString(2, newBid);
	ps.setString(3, newAuction);
	//Run the query against the DB
	ps.executeUpdate();
	//response.sendRedirect("itemBid.jsp?auct="+ newAuction);
			
	insert = "SELECT * FROM Autobids WHERE auction_id = ? and username = ?";
	ps = con.prepareStatement(insert);
	ps.setString(1, newAuction);
	ps.setString(2, (String)session.getAttribute( "USERNAME" ));
	result = ps.executeQuery();
			
	if(!result.isBeforeFirst())
	{
		out.print("<br/>");
		out.print("Bid successful.");
		out.print("<br/>");
		out.print("Set up an autobid?");
		out.print("<form method='post' action='createAutobid.jsp'>");
		out.print("<table>");
		out.print("<tr>");    
		out.print("<td>Max Bid: </td><td><input type='text' name='max_amount' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Set Autobid'>");
		out.print("</form>");
		out.print("<br/>");
		out.print("<a href='itemBid.jsp?auct=" + newAuction + "'>Or return to auction</a>");
	}
	
	else
	{
		response.sendRedirect("itemBid.jsp?auct="+ newAuction);
	}
	
	String autoBidCheck = "SELECT * FROM Autobids WHERE auction_id = ? and max_amount > ? Order by max_amount ASC";
	ps = con.prepareStatement(autoBidCheck);
	ps.setString(1, newAuction);
	ps.setString(2, newBid);
	result = ps.executeQuery();

	Float autobid = Float.parseFloat(newBid);
	
	while(result.next())
	{

		if (result.getFloat("max_amount") > autobid)
		{
			ResultSet result2 = null;
			String prevBid2 = "SELECT * FROM Bids JOIN Auction using (auction_id) WHERE auction_id = ? and amount = (SELECT max(amount) FROM Bids WHERE auction_id = ?)";
			ps = con.prepareStatement(prevBid2);
			ps.setString(1, newAuction);
			ps.setString(2, newAuction);
			result2 = ps.executeQuery();
			result2.next();
			
			loserUser = result2.getString("buyer");

			String message = "You have been outbid on Auction #" + newAuction + "!";
			String insert2 = "INSERT INTO Alerts(username) VALUES(?)";
			ps = con.prepareStatement(insert2);
			ps.setString(1, loserUser);
			ps.executeUpdate();
						
			insert2 = "INSERT INTO Alert_Messages(alert_id, auction_id, message) VALUES(LAST_INSERT_ID(), ?, ?)";
			ps = con.prepareStatement(insert2);
			ps.setString(1, newAuction);
			ps.setString(2, message);
			ps.executeUpdate();
			
			autobid = autobid + 1;
			insert = "INSERT INTO Bids(buyer, amount, auction_id)"
			+ "VALUES (?, ?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, result.getString("username"));
			ps.setFloat(2, autobid);
			ps.setString(3, newAuction);
			ps.executeUpdate();
			out.print(autobid + " by " +  result.getString("username") + " ");

		}
		autoBidCheck = "SELECT COUNT(*) FROM (SELECT * FROM Autobids WHERE auction_id = ? and max_amount > ? Order by max_amount ASC)a1";
		ps = con.prepareStatement(autoBidCheck);
		ps.setString(1, newAuction);
		ps.setFloat(2, autobid);
		result = ps.executeQuery();
		result.next();

		
		if(result.getInt("COUNT(*)") > 1 )
		{
			autoBidCheck = "SELECT * FROM Autobids WHERE auction_id = ? and max_amount > ? Order by max_amount ASC";
			ps = con.prepareStatement(autoBidCheck);
			ps.setString(1, newAuction);
			ps.setFloat(2, autobid);
			result = ps.executeQuery();

		}
		else
			break;
	}
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