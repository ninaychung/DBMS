<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
<%
/**String un = session.getAttribute("username").toString();*/   
%>

<br>
Book a Trip
<br>
<div>
	
		<table style= "display: inline-block;">
		<!--style="background-color: lightgreen; margin-left: 20px; margin-left:20px"-->
		
			<tr>    
				<td>From</td><td><input type="fromStation" name="fromStation" required></td>
			</tr>
			<tr>
				<td>To</td><td><input type="toStation" name="toStation" required></td>
			</tr>
			
		</table>
		<input type="radio" name="type" value="Admin" required> One-Way
		<input type="radio" name="type" value="CustomerRep"> Round-Trip
		<input type="submit" value="Login">
	
<br>

<br>
Book a Trip
<br>
	
		<table style= "float: left">
		<!--  style="background-color: lightgreen; margin-left: 20px; margin-left:20px"-->
			<tr>    
				<td>Depart Date</td><td><input type="departDate" name="departDate" required></td>
			</tr>
			<tr>
				<td>Return Date</td><td><input type="returnDate" name="returnDate" required></td>
			</tr>
			
		</table>
		<input type="radio" name="type" value="Admin" required> One-Way
		<input type="radio" name="type" value="CustomerRep"> Round-Trip
		<input type="submit" value="Login">
</div>
	
<br>
</body>
</html>