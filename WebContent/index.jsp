<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Train Project</title>
	</head>
<body>
<img src="train.jpeg" class="train" width="100%" height="180">
<br>

<% out.println("WELCOME TO THE HOME PAGE!"); %> <!-- output the same thing, but using 
                                      jsp programming -->

<br>
Login
<br>
	<form method="get" action="checkLogin.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="password" name="password" required></td>
			</tr>
			
		</table>
		<input type="radio" name="type" value="Admin" required> Admin
		<input type="radio" name="type" value="CustomerRep"> Customer Representative
		<input type="radio" name="type" value="Customer"> Customer
		<input type="submit" value="Login">
	</form>
<br>

Signup - Customers Only
<br>
	<form method="get" action="signup.jsp">
		<table>
			<tr>    
				<td>Username</td><td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="password" name="password" required></td>
			</tr>
			<tr>
				<td>First Name</td><td><input type="text" name="firstname" required></td>
			</tr>
			<tr>
				<td>Last Name</td><td><input type="text" name="lastname" required></td>
			</tr>
			<tr>
				<td>Email</td><td><input type="email" name="email" required></td>
			</tr>
			
		</table>

		<input type="submit" value="Sign Up">
	</form>

<br>
Browse Available Trips:
<br>

<div>
	<form method="get" action="browse.jsp">
		<table 
		style = "background-color: lightgreen; display: inline-block">
			<tr>    
				<td>Day of Travel (YYYY-MM-DD):</td><td><input type="departDate" name="departDate" required></td>
			</tr>
			<tr>    
				<td>Origin Station:</td><td><input type="fromStation" name="fromStation" required></td>
			</tr>
			<tr>
				<td>Destination Station:</td><td><input type="toStation" name="toStation" required></td>
			</tr>
		</table>

<br>

<form method="get" action="browse.jsp">
		<input type="submit" value="Find Trains">
		-->
	</form>
	
<br>
	<form method="get" action="sort.jsp">		
		<label>OR</label>
		<label>Sort Trips By:</label>
		
	<div>
	<form method="get" action="sort.jsp">
	<table 
		style = "background-color: cyan; display: inline-block">
			<tr>    
				<td>Day of Travel (YYYY-MM-DD):</td><td><input type="departDate" name="departDate" required></td>
			</tr>
			<tr>    
				<td>Origin Station:</td><td><input type="fromStation" name="fromStation" required></td>
			</tr>
			<tr>
				<td>Destination Station:</td><td><input type="toStation" name="toStation" required></td>
			</tr>
	</table>
	
<br>

<select name="sortBy">
				<option> </option>
				<option>`arrival time`</option>
				<option>`departure time`</option>
				<option>`Fare`</option>
			</select>
	<input type="submit" value="Sort">
	-->	
	
<br>
</div>

<br>

</body>
</html>





</body>
</html>