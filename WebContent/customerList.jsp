<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
</head>
<body>

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		
		String transitline = request.getParameter("transitline");
		System.out.println("transitline: " + transitline);
		String date = request.getParameter("date");
		System.out.println("date: " + date);
		out.print("<h2> List of Customers who have reservations on " + transitline + " on " + date + "</h2>"); 
%>
		<table style="width:100%">
		  <tr>
		    <th>Customer Username: </th>
		  </tr>
<%
//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str3 = "SELECT DISTINCT Username FROM Reserves WHERE `reservation number` IN (SELECT `reservation number` FROM Reservation WHERE TLN = \"" + transitline + "\" AND CAST(reservation_date AS DATE) = \"" + date + "\")";

		//Run the query against the database.
		
		ResultSet result = stmt.executeQuery(str3);
		
		//parse out the results
		
		while (result.next()) {
			String username = result.getString("Username");
			System.out.println("username: " + username);
			out.print("<tr>");
			out.print("<th>" + username + "</th>");
			out.print("</tr>");
		}	
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("searchfailed");
	}
%>
	</table>
<form method="get" action="customerRepHomepage.jsp">
	<input type="submit" value="Return to Homepage">
</form>
</body>
</html>