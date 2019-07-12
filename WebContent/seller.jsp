<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller Page</title>
</head>
<body>
<h1>Your Seller Account</h1>
	<style type="text/css">
		body {
			background-image: url("http://www.cheerupbuttercups.com/wp-content/uploads/2018/07/background-color-4706-theme-colorful-wallpaper-for-pages-coking-pages-background-color-image.jpg")
		}
		h1 {
			color: blue;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
	</style>

<%
if(session.getAttribute("ACCOUNT_TYPE").equals("seller"))
{
	out.print("Logged in as: Seller");
	out.print("<br/>");
	out.print("Username: " +  session.getAttribute("USERNAME"));
	out.print("<br/>");
}
%>
<img src = "http://www.iconninja.com/files/964/161/289/user-account-profile-icon.png" alt="Avatar" class = "avatar">
<div>
<form action="item/browseAuctions.jsp">
    <input type="submit" value="Browse Auctions" />
</form>

<form action="item/createPC.jsp">
    <input type="submit" value="Auction a PC" />
</form>

<form action="item/createLaptop.jsp">
    <input type="submit" value="Auction a Laptop" />
</form>

<form action="item/createTablet.jsp">
    <input type="submit" value="Auction a Tablet" />
</form>
</div>

<div>
<form action="forum/forum.jsp">
    <input type="submit" value="Forum" />
</form>

<form action="search/search.jsp">
    <input type="submit" value="Search" />
</form>

<form action= "search/userParticipation.jsp">
	<input type = "submit" value ="SearchUserHistory"/>
</form> 

<form action= "deleteUser.jsp">
	<input type = "submit" value ="Delete User" />
</form> 

<form action="index.jsp">
    <input type="submit" value="Logout" />
</form>

<form action="email/email.jsp">
    <input type="submit" value="Email" />
</form>

</div>
</body>
</html>