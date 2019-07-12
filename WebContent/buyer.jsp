<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<style>
#buttons{
    display:flex;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
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
<head>
<meta charset="ISO-8859-1">
<title>Home:Buyer</title>
</head>
<body>
<h1>Your Buyer Account</h1>
	<style type="text/css">
		body {
			background-image: url("https://inforexbackgroundchecks.com/wp-content/uploads/2016/11/business-background-check.jpg")
		}
		h1 {
			color: silver;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
	</style>

<% 
if(session.getAttribute("ACCOUNT_TYPE").equals("buyer"))
{
	out.print("Logged in as: Buyer");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
}


%>
<img src = "http://www.iconninja.com/files/964/161/289/user-account-profile-icon.png" alt="Avatar" class = "avatar">

<div id = buttons>
<form action="item/browseAuctions.jsp">
    <input type="submit" value="Browse Auctions" />
</form>

<form action="forum/forum.jsp">
    <input type="submit" value="Forum" />
</form>

<form action="search/search.jsp">
    <input type="submit" value="Search" />
</form>

<form action="index.jsp">
    <input type="submit" value="Logout" />
</form>

<form action="alert/viewAlerts.jsp">
    <input type="submit" value="View Alerts" />
</form>

<form action="item/viewBidHistory.jsp">
    <input type="submit" value="Bid History" />
</form>

<form action= "search/userParticipation.jsp">
	<input type = "submit" value ="SearchUserHistory" />
</form> 

<form action= "item/viewAutoBids.jsp">
	<input type = "submit" value ="View Auto Bids" />
</form> 

<form action= "deleteUser.jsp">
	<input type = "submit" value ="Delete User" />
</form> 
<form action="email/email.jsp">
    <input type="submit" value="Email" />
</form>
</div>
<br /> 
Set Up Alert:
<form method="post" action="alert/alert.jsp">
		<select name="type" size=1>
			<option value="PC">Alert for PC</option>
			<option value="Laptop">Alert for Laptop</option>
			<option value="Tablet">Alert for Tablet</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<div>

<br /> 
<% 
String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
//Load JDBC driver
Class.forName("com.mysql.jdbc.Driver");

//Get the database connection
Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
//Create a SQL statement
Statement stmt = con.createStatement();
PreparedStatement ps = null;
ResultSet result = null;
try {
			//Create a connection string
			
			ps = con.prepareStatement( "SELECT * FROM Alerts JOIN Alert_Messages using (alert_id) WHERE username = ?");
			ps.setString(1, (String)session.getAttribute("USERNAME" ));
						
			//Run the query against the database.
			result = ps.executeQuery();
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			out.print("<th>");
			out.print("Alert ID");
			out.print("</th>");		

			out.print("<th>");
			out.print("Message");
			out.print("</th>");	
			
			out.print("<th>");
			out.print(" ");
			out.print("</th>");	
			
			out.print("<th>");
			out.print(" ");
			out.print("</th>");	

			while (result.next()) 
			{
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("alert_id"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("message"));
				out.print("</td>");
				
				out.print("<td>");
				out.print("<form action='item/itemBid.jsp' method='get'><button name='auct' type='submit' value='" + result.getString("auction_id") + "'>View Item</button></form>");
				out.print("</td>");
				
				out.print("<th>");
				out.print("<form action='alert/removeMsg.jsp' method='get'><button name='alrtmsg' type='submit' value='" + result.getString("alert_id") + "'>Delete Message</button></form>");
				out.print("</th>");	
				
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


</div>
</body>
</html>