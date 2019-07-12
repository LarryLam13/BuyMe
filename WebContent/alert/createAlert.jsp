<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
try {
			//Create a connection string
			
			
			
			if(request.getParameter("type").equals("PC"))
			{
				String newUser = (String)session.getAttribute( "USERNAME" );
				String newMaker = request.getParameter("maker");
				String newModel = request.getParameter("model");
				String newType = request.getParameter("type");
				String newHD = request.getParameter("hd");
				String newRam = request.getParameter("ram");
				//Make an insert statement for the Users table:
				String insert = "INSERT INTO Alerts(username, maker, model, type, hd, ram)"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
			
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1,	newUser);
				ps.setString(2, newMaker);
				ps.setString(3, newModel);
				ps.setString(4, newType);
				ps.setString(5, newHD);
				ps.setString(6, newRam);

				//Run the query against the DB
				ps.executeUpdate();
				out.print("ALERT SUCCESSFUL");
				ps = con.prepareStatement("SELECT * FROM Items i JOIN Auction using (item_id) JOIN PC p using (item_id) WHERE i.maker = ? and i.model = ? and "
						+ "i.type = ? and p.hd = ? and p.ram = ?");
				
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4, newHD);
				ps.setString(5, newRam);
				result = ps.executeQuery();
				

				while (result.next()) 
				{
					String newAuctionID = result.getString("auction_id");
					String newMessage = "Alert! There is a new item you would like.";
					String insert2 = "INSERT INTO Alert_Messages(alert_id, message, auction_id)"
							+ "VALUES (LAST_INSERT_ID(), ?, ?)";
					ps = con.prepareStatement(insert2);
					ps.setString(1, newMessage);
					ps.setString(2, newAuctionID);
					ps.executeUpdate();

				}
			}
			
			if(request.getParameter("type").equals("Laptop"))
			{
				String newUser = (String)session.getAttribute( "USERNAME" );
				String newMaker = request.getParameter("maker");
				String newModel = request.getParameter("model");
				String newType = request.getParameter("type");
				String newHD = request.getParameter("hd");
				String newRam = request.getParameter("ram");
				String newScreen = request.getParameter("screen");

				//Make an insert statement for the Users table:
				String insert = "INSERT INTO Alerts(username, maker, model, type, hd, ram, screen)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			    ps = con.prepareStatement(insert);
			
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1,	newUser);
				ps.setString(2, newMaker);
				ps.setString(3, newModel);
				ps.setString(4, newType);
				ps.setString(5, newHD);
				ps.setString(6, newRam);
				ps.setString(7, newScreen);

				//Run the query against the DB
				ps.executeUpdate();
				out.print("ALERT SUCCESSFUL");
				
				insert = "SELECT * FROM Items i JOIN Auction using (item_id) JOIN Laptops p using (item_id) WHERE i.maker = ? and i.model = ? and "
						+ "i.type = ? and p.hd = ? and p.ram = ? and p.screen = ?";
				ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4, newHD);
				ps.setString(5, newRam);
				ps.setString(6, newScreen);
				result = ps.executeQuery();

				while (result.next()) 
				{
					String newAuctionID = result.getString("auction_id");
					String newMessage = "Alert! There is a new item you would like.";
					String insert2 = "INSERT INTO Alerts_Message(alert_id, message, auction_id)"
							+ "VALUES (LAST_INSERT_ID(), ?, ?)";
					ps = con.prepareStatement(insert2);
					ps.setString(1,	newMessage);
					ps.setString(2, newAuctionID);
				}
			}
			
			if(request.getParameter("type").equals("Tablet"))
			{
				String newUser = (String)session.getAttribute( "USERNAME" );
				String newMaker = request.getParameter("maker");
				String newModel = request.getParameter("model");
				String newType = request.getParameter("type");
				String newScreen = request.getParameter("screen");
				String newCapacity = request.getParameter("capacity");
				String newColor = request.getParameter("color");

				//Make an insert statement for the Users table:
				String insert = "INSERT INTO Alerts(username, maker, model, type, screen, capacity, color)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
			
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1,	newUser);
				ps.setString(2, newMaker);
				ps.setString(3, newModel);
				ps.setString(4, newType);
				ps.setString(5, newScreen);
				ps.setString(6, newCapacity);
				ps.setString(7, newColor);


				//Run the query against the DB
				ps.executeUpdate();
				out.print("ALERT SUCCESSFUL");
				
				insert = "SELECT * FROM Items i JOIN Auction using (item_id) JOIN Tablets p using (item_id) WHERE i.maker = ? and i.model = ? and "
						+ "i.type = ? and p.capacity = ? and p.color = ? and p.screen = ?";
				ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4, newCapacity);
				ps.setString(5, newColor);
				ps.setString(6, newScreen);
				result = ps.executeQuery();

				while (result.next()) 
				{
					String newAuctionID = result.getString("auction_id");
					String newMessage = "Alert! There is a new item you would like.";
					String insert2 = "INSERT INTO Alerts_Message(alert_id, message, auction_id)"
							+ "VALUES (LAST_INSERT_ID(), ?, ?)";
					ps = con.prepareStatement(insert2);
					ps.setString(1,	newMessage);
					ps.setString(2, newAuctionID);
				}
				
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

<a href="../buyer.jsp">Or click here to return </a>
</body>
</html>