<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN PAGE</title>
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
			//Create a connection string
			//Get the combobox from the index.jsp
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			String str = "SELECT username, password FROM Users WHERE username ='" + username + "'";
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			
			if(password.equals(result.getString("password")))
			{
				out.print("Login Successful");
				
				String buyer = "SELECT username FROM Buyers WHERE username ='" + username + "'";
				ResultSet result1 = stmt.executeQuery(buyer);
				if (!(result1.first() == false))
				{
					response.sendRedirect("buyer.jsp");
					session.setAttribute( "USERNAME", username );
					session.setAttribute( "ACCOUNT_TYPE", "buyer"  );
				} 
					
				String seller = "SELECT username FROM Sellers WHERE username ='" + username + "'";
				ResultSet result2 = stmt.executeQuery(seller);
				if (!(result2.first() == false)) 
				{
					response.sendRedirect("seller.jsp");
					session.setAttribute( "USERNAME", username );
					session.setAttribute( "ACCOUNT_TYPE", "seller"  );

				} 
					
				String cust_rep = "SELECT username FROM Customer_Rep WHERE username ='" + username + "'";
				ResultSet result3 = stmt.executeQuery(cust_rep);
				if (!(result3.first() == false)) 
				{
					response.sendRedirect("cr/customerRep.jsp");
					session.setAttribute( "USERNAME", username );
					session.setAttribute( "ACCOUNT_TYPE", "cr"  );

				} 
					
				String admin = "SELECT username FROM Admin WHERE username ='" + username + "'";
				ResultSet result4 = stmt.executeQuery(admin);
				if (!(result4.first() == false)) 
				{
					response.sendRedirect("admin.jsp");
					session.setAttribute( "USERNAME", username );
					session.setAttribute( "ACCOUNT_TYPE", "admin"  );
				} 
			}
			else
				out.print("Login FAILED.");
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