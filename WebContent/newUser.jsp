<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User! </title>
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
PreparedStatement ps = null;
ResultSet result = null;

try {

			//Get the combobox from the index.jsp
			String newUsername = request.getParameter("username");
			String newPassword = request.getParameter("password");
			String newAddress = request.getParameter("address");
			String newEmail = request.getParameter("email");
			String newPhone = request.getParameter("phone_num");
			String newAccountType = request.getParameter("account_type");
			//Make an insert statement for the Users table:
			String insert = "INSERT INTO Users(username, password, address, email, phone_num)"
					+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);
			
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, newUsername);
			ps.setString(2, newPassword);
			ps.setString(3, newAddress);
			ps.setString(4, newEmail);
			ps.setString(5, newPhone);
			//Run the query against the DB
			ps.executeUpdate();
			//Run the query against the DB
			if(newAccountType.equals("buyer"))
			{
				insert = "INSERT INTO Buyers(username)"
						+ "VALUES (?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				ps.setString(1, newUsername);
				ps.executeUpdate();
				session.setAttribute( "USERNAME", newUsername );
				session.setAttribute( "ACCOUNT_TYPE", "buyer"  );
				response.sendRedirect("buyer.jsp");
				

			}
			
			if(newAccountType.equals("customer_rep"))
			{
				insert = "INSERT INTO Customer_Rep(username)"
						+ "VALUES (?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				ps.setString(1, newUsername);
				ps.executeUpdate();
				session.setAttribute( "USERNAME", newUsername );
				session.setAttribute( "ACCOUNT_TYPE", "customer_rep"  );
				response.sendRedirect("cr/customerRep.jsp");
			}
				
			if(newAccountType.equals("seller"))
			{
				insert = "INSERT INTO Sellers(username)"
						+ "VALUES (?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				ps = con.prepareStatement(insert);
				ps.setString(1, newUsername);
				ps.executeUpdate();
				session.setAttribute( "USERNAME", newUsername );
				session.setAttribute( "ACCOUNT_TYPE", "seller"  );
				response.sendRedirect("seller.jsp");

			}
			out.print("INSERT SUCCESSFUL. USERNAME: " + newUsername + "; ACCOUNT TYPE: " + newAccountType );
			
		
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