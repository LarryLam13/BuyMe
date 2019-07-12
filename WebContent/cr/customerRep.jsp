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
<title>Main Page: Customer Rep</title>
</head>
<body>
<h1>Your Customer Representative Account</h1>
	<style type="text/css">
		body {
			background-image: url("http://www.pptgrounds.com/wp-content/uploads/2017/03/Business-Agreement-PPT-Backgrounds.jpg")
		}
		h1 {
			color: gold;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
	</style>
	<img src = "https://cdn.iconscout.com/public/images/icon/free/png-256/avatar-user-business-man-399587fe24739d5a-256x256.png" alt="Avatar" class = "avatar">
<div id = buttons>

<form action="../cr/browseAuctionsCR.jsp">
    <input type="submit" value="Browse Auctions" />
</form>

<form action="../forum/forumCP.jsp">
    <input type="submit" value="Forum" />
</form>

<form action="../search/search.jsp">
    <input type="submit" value="Search" />
</form>


<form action="modifyBids.jsp">
    <input type="submit" value="Modify Bids" />
</form>

<form action="resetPasswords.jsp">
	<input type="submit" value="Reset User Passwords" />
</form>

<form action="../email/email.jsp">
    <input type="submit" value="Email" />
</form>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<form action="../index.jsp">
    <input type="submit" value="Logout" />
</form>
<form action= "../deleteUser.jsp">
	<input type = "submit" value ="Delete User" />
</form> 

</div>

</body>
</html>