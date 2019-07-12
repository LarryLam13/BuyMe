<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date"%>
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
PreparedStatement ps = null;
try {

			
			
			//Get the combobox from the index.jsp
			String newUser = (String)session.getAttribute( "USERNAME" );
			String newText = request.getParameter("q_text");
			java.util.Date date = new Date();
			Object newTime = new java.sql.Timestamp(date.getTime());
		
			String insert = "INSERT INTO Forum(username)"
					+ "VALUES (?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, newUser);
			ps.executeUpdate();
			
			insert = "INSERT INTO Questions(forum_id, poster, q_text, post_time)" + 
				"VALUES (LAST_INSERT_ID(), ?, ?, ?)";
			ps = con.prepareStatement(insert);
			ps.setString(1, newUser);
			ps.setString(2, newText);
			ps.setObject(3, newTime);
			ps.executeUpdate();
			
			insert = "INSERT INTO Answers(forum_id)" + 
					"VALUES (LAST_INSERT_ID())";
				ps = con.prepareStatement(insert);
				ps.executeUpdate();
				
			out.print("QUESTION POSTED SUCCESSFULLY");
			con.close();
			response.sendRedirect("../forum/forum.jsp");

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