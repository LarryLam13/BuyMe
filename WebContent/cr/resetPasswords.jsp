<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
<h1>Reset User Passwords</h1>
<p> Please fill in the required information to change a user's password </p>
	<style type="text/css">
		body {
			background-image: url("http://www.pptgrounds.com/wp-content/uploads/2017/03/Business-Agreement-PPT-Backgrounds.jpg")
		}
		h1 {
			color: gold;
			font-size: 30px;
			font-family: "Times New Roman", Times, serif;
		}
		p {
			color: darkviolet;
			font-size: 15px;
			font-family: "Times New Roman", Times, serif;
		}
	</style>
<form name = "resetPasswords" method = "post" action = "processReset.jsp">
<div class = "container">
	<hr>
	
	<label for = "User email"><b>Username</b></label>
	<input type = "text" placeholder = "Enter username" name = "username" required>
	<label for = "New user password"><b>New Password</b></label>
	<input type = "text" placeholder = "Enter new password" name = "password" required>
	<input type="submit" value="Change user password">
	
</div>
  
</form> 
<a href="customerRep.jsp">Click here to return home</a> 
</body>
</html>