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
<h1>Forum</h1>
	<style type="text/css">
		body {
			background-image: url("https://metrocebu.news/wp-content/uploads/2018/03/Employers-Forum-16-1296x652.png")
		}
		h1 {
			color: mediumvioletred;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
		</style> 
<div id = "buttons">
<form action='postQuestion.jsp'><input type="submit" value = "Post Question" /></form>
</div>

	<% //Create a connection string
	
	String url = "jdbc:mysql://cs336db.ceppltipnhmk.us-east-1.rds.amazonaws.com:3306/cs336Project";
	//Load JDBC driver
	Class.forName("com.mysql.jdbc.Driver");
	
	//Get the database connection
	Connection con = DriverManager.getConnection(url, "cs336", "gamer5221");
	//Create a SQL statement
	Statement stmt = con.createStatement();
	
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
			
			String str = "SELECT * FROM Forum JOIN Questions using (forum_id) JOIN Answers using (forum_id) ORDER BY (forum_id) ASC;";
			
			//Run the query against the database.
			result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			out.print("<th>");
			out.print("Forum ID");
			out.print("</th>");		

			out.print("<th>");
			out.print("Post By");
			out.print("</th>");	

			out.print("<th>");
			out.print("Post Time");
			out.print("</th>");	

			out.print("<th>");
			out.print("Question");
			out.print("</th>");
			
			out.print("<th>");
			out.print("Reponse By");
			out.print("</th>");	

			out.print("<th>");
			out.print("Reponse Time");
			out.print("</th>");	

			out.print("<th>");
			out.print("Answer");
			out.print("</th>");
			out.print("</tr>");
			
			while (result.next()) 
			{
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("forum_id"));
				out.print("</td>");

				out.print("<td>");
				out.print(result.getString("poster"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("post_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("q_text"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("replyer"));
				out.print("</td>");
		 
				out.print("<td>");
				out.print(result.getString("reply_time"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("a_text"));
				out.print("</td>");
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
		if (stmt != null) stmt.close();
		if (con != null) con.close();
	}%>
		
			


</body>
</html>