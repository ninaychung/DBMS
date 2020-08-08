<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Reservation History</title>
</head>
<body>

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		
		String username = request.getParameter("username");

		out.print("<h2> Reservation History for " + username + " </h2>"); %>
		<br>
		<table style="width:100%">
		  <tr>
		    <th>Reservation Number</th>
		    <th>Departure Date</th> 
		    <th>Reservation Date</th>
		    <th>Passenger Type</th>
		    <th>Trip Type</th>
		    <th>Fare Total</th>
		    <th>Origin</th>
		    <th>Destination</th>
		  </tr>
		<%
		//Get the selected radio button from the index.jsp
	//	String type = request.getParameter("type");
	//	System.out.println("type: " + type);
		
		
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM Reservation WHERE `reservation number` IN (SELECT `reservation number` FROM Reserves WHERE Username = \"" + username + "\")";
		
		//Run the query against the database.
		
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
			
		while (result.next()) {

				String resNum = result.getString("reservation number");
				System.out.println("Reservation Number " + resNum);
				
				String deptDate = result.getString("departure_date");
				System.out.println("Departure Date: " + deptDate);
				
				String resDate = result.getString("reservation_date");
				System.out.println("Reservation Date " + resDate);
				
				String passType = result.getString("fare type");
				System.out.println("Passenger Type: " + passType);
				
				String tripType = result.getString("trip type");
				System.out.println("Trip Type: " + tripType);
				
				String fareCost = result.getString("fare cost");
				System.out.println("Fare Total: " + fareCost);
				
				String orgStation = result.getString("origin station");
				System.out.println("Origin: " + orgStation);
				
				String destStation = result.getString("destination station");
				System.out.println("Destination: " + destStation);
				
				
				out.print("<tr>");
				out.print("<td>" + resNum + "</td>");
				out.print("<td>" + deptDate + "</td>");
				out.print("<td>" + resDate + "</td>");
				out.print("<td>" + passType + "</td>");
				out.print("<td>" + tripType + "</td>");
				out.print("<td>" + fareCost + "</td>");
				out.print("<td>" + orgStation + "</td>");
				out.print("<td>" + destStation + "</td>");
				out.print("</tr>");

			
		}
	
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("no reservation history");
	}
%> 
	</table>
	<form method="get" action="cancelReservation.jsp">
		<table>
			<tr>    
				<td>Enter number of reservation you would like to cancel:</td><td><input type="text" name="cancel" required></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<form method="get" action="customerHomePage.jsp">

		<input type="submit" value="Return to Homepage">
	</form>
<br>
</body>
</html>