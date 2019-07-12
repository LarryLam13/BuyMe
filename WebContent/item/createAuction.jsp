
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
	<% 
	//Create a connection string
	
	String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
	//Load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
	
	//Get the database connection
	Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
	//Create a SQL statement
	Statement stmt = con.createStatement();
	PreparedStatement ps = null;
	ResultSet result = null;
	
	String newScreen = null;
	String newCapacity = null;
	String newColor = null;
	String newRam = null;
	String newHd = null;
	String newType = null;
	String newMaker = null;
	String newModel = null;
	
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
			//Get the combobox from the index.jsp
			newType = request.getParameter("type");
			newMaker = request.getParameter("maker");
			newModel = request.getParameter("model");
			String insert2 = "INSERT INTO Items(type, maker, model)"
					+ "VALUES (?, ?, ?);";
					
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert2);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newType);
			ps.setString(2, newMaker);
			ps.setString(3, newModel);
			//Run the query against the DB
			ps.executeUpdate();
			
			if(newType.equals("PC"))
			{
				newRam = request.getParameter("ram");
				newHd = request.getParameter("hd");
				String insert = "INSERT INTO PC(item_id, ram, hd, model)"
						+ "VALUES (LAST_INSERT_ID(), ?, ?, ?);";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newRam);
				ps.setString(2, newHd);
				ps.setString(3, newModel);

				//Run the query against the DB
				ps.executeUpdate();
				out.print("SUCCESSFUL PC INSERT");
			}

			if(newType.equals("Laptop"))
			{
				newRam = request.getParameter("ram");
				newHd = request.getParameter("hd");
				newScreen = request.getParameter("screen");
				String insert = "INSERT INTO Laptops(item_id, ram, hd, model, screen)"
						+ "VALUES (LAST_INSERT_ID(), ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newRam);
				ps.setString(2, newHd);
				ps.setString(3, newModel);
				ps.setString(4, newScreen);


				//Run the query against the DB
				ps.executeUpdate();
				out.print("SUCCESSFUL LAPTOP INSERT");

			}
			if(newType.equals("Tablet"))
			{
				newScreen = request.getParameter("screen");
				newCapacity = request.getParameter("capacity");
				newColor = request.getParameter("color");
				String insert = "INSERT INTO Tablets(item_id, model, screen, capacity, color)"
						+ "VALUES (LAST_INSERT_ID(), ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, newModel);
				ps.setString(2, newScreen);
				ps.setString(3, newCapacity);
				ps.setString(4, newColor);

				//Run the query against the DB
				ps.executeUpdate();
				out.print("SUCCESSFUL TABLET INSERT");
			}
			String newStartDate = request.getParameter("start_date");
			String newEndDate = request.getParameter("end_date");
			String newMin = request.getParameter("min_price");
			String newPrice = request.getParameter("price");
			String newUser = (String)session.getAttribute( "USERNAME" );
			String insert = "INSERT INTO Auction(item_id, start_date, end_date, min_price, username, status, price)"
					+ "VALUES (LAST_INSERT_ID(), ?, ?, ?, ?, ?, ?)";	
			ps = con.prepareStatement(insert);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newStartDate);
			ps.setString(2, newEndDate);
			ps.setString(3, newMin);
			ps.setString(4, newUser);
			ps.setString(5, "open");
			ps.setString(6, newPrice);


			//Run the query against the DB
			ps.executeUpdate();
			out.print("SUCCESSFUL AUCTION CREATION");
			
			String getAuctID = "SELECT * FROM Auction WHERE auction_id = LAST_INSERT_ID()";
			result = stmt.executeQuery(getAuctID);
			result.next();
			String TEMP_AUCTIONID = result.getString("auction_id");
			

			insert = "INSERT INTO Bids(auction_id, amount)" 
				+ "VALUES(?, ?)";
			
			ps = con.prepareStatement(insert);
			ps.setString(1, TEMP_AUCTIONID);
			ps.setString(2, newPrice);
			ps.executeUpdate();
			out.print("(SUCCESSFUL BID SETUP)");
			
			//IF ALERT OF ITEM EXISTS
			//CREATE A MESSAGE FOR ALERT_MESSAGE
			if(newType.equals("PC"))
			{
				insert ="SELECT * FROM Alerts left join Alert_Messages using (alert_id) " +
						"WHERE maker = ? and model = ? and type = ? and ram = ? and hd = ? ";
				ps = con.prepareStatement(insert);
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4,	newRam);
				ps.setString(5,	newHd);
				result = ps.executeQuery();
			
			

				while (result.next()) 
				{	
					out.print("Alerting user...");

						String newAlertID = result.getString("alert_id");
						String newMessage = "Alert! There is a new item you would like.";
						insert2 = "INSERT INTO Alert_Messages(message, alert_id, auction_id)"
							+ "VALUES (?, ?, ?)";
						ps = con.prepareStatement(insert2);
						ps.setString(1,	newMessage);
						ps.setString(2,	newAlertID);
						ps.setString(3, TEMP_AUCTIONID);
						ps.executeUpdate();
				}	
				
			}
			
			if(newType.equals("Laptop"))
			{
				insert ="SELECT * FROM Alerts left join Alert_Messages using (alert_id) " +
						"WHERE maker = ? and model = ? and type = ? and ram = ? and hd = ? and screen = ?";
				ps = con.prepareStatement(insert);
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4,	newRam);
				ps.setString(5,	newHd);
				ps.setString(6,	newScreen);
				result = ps.executeQuery();
			
			

				while (result.next()) 
				{	
					out.print("Alerting user...");

						String newAlertID = result.getString("alert_id");
						String newMessage = "Alert! There is a new item you would like.";
						insert2 = "INSERT INTO Alert_Messages(message, alert_id, auction_id)"
							+ "VALUES (?, ?, ?)";
						ps = con.prepareStatement(insert2);
						ps.setString(1,	newMessage);
						ps.setString(2,	newAlertID);
						ps.setString(3, TEMP_AUCTIONID);
						ps.executeUpdate();
				}	
				
			}
			
			if(newType.equals("Tablet"))
			{
				insert ="SELECT * FROM Alerts left join Alert_Messages using (alert_id) " +
						"WHERE maker = ? and model = ? and type = ? and color = ? and capacity = ? and screen = ?";
				ps = con.prepareStatement(insert);
				ps.setString(1, newMaker);
				ps.setString(2, newModel);
				ps.setString(3, newType);
				ps.setString(4,	newColor);
				ps.setString(5,	newCapacity);
				ps.setString(6,	newScreen);
				result = ps.executeQuery();

				while (result.next()) 
				{	
					out.print("Alerting user...");

						String newAlertID = result.getString("alert_id");
						String newMessage = "Alert! There is a new item you would like.";
						insert2 = "INSERT INTO Alert_Messages(message, alert_id, auction_id)"
							+ "VALUES (?, ?, ?)";
						ps = con.prepareStatement(insert2);
						ps.setString(1,	newMessage);
						ps.setString(2,	newAlertID);
						ps.setString(3, TEMP_AUCTIONID);
						ps.executeUpdate();
				}	
				
			}
			
			response.sendRedirect("itemBid.jsp?auct=" + TEMP_AUCTIONID);

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