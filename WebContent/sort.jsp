<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width:70%">
		<tr>
			<th>Transit Line</th>
			<th>Origin</th>
			<th>Destination</th> 
			<th>Departure Date</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Fare</th>
			<th>Train ID</th>
			
		</tr>
		
		<form method="get" action="index.jsp">
		<input type="submit" value="Back to Home">
	</form>
<br>
<%
try {
		String origin = request.getParameter("fromStation");
		String destination = request.getParameter("toStation");
		String departure = request.getParameter("departDate");
		String arrival = request.getParameter("returnDate");
		String sortCriteria = request.getParameter("sortBy");
		
		out.print(origin);
		out.print(destination);
		out.print(departure);
		//out.print(arrival);
		out.print("Sort Criteria: " + sortCriteria);
		out.println(" ");
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "'";
		
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "'";
		String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "' ORDER BY " + sortCriteria + "";
		//String str = "SELECT * FROM TrainSchedule ORDER BY " + sortCriteria + "";
		//'" + sortCriteria + "'";
		
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
		while (result.next()) {
			String print_TLN = result.getString("TransitLineName");
			String print_origin = result.getString("Origin");
			String print_destination = result.getString("Destination");
			String print_departure = result.getString("DepartureDate");
			String print_departureTime = result.getString("DepartureTime");
			String print_arrivalTime= result.getString("ArrivalTime");
			String print_fare = result.getString("Fare");
			String print_ID = result.getString("TrainID");
			
			
			out.print("<tr>");
			out.print("<td>" + print_TLN + "</td>");
			out.print("<td>" + print_origin + "</td>");
			out.print("<td>" + print_destination + "</td>");
			out.print("<td>" + print_departure + "</td>");
			out.print("<td>" + print_arrivalTime + "</td>");
			out.print("<td>" + print_departureTime + "</td>");
			out.print("<td>" + print_fare + "</td>");
			out.print("<td>" + print_ID + "</td>");

			

			out.print("</tr>");
		}
			
		con.close();
				
	}catch (Exception ex) {
			out.print(ex);
			out.print("Operation failed");
}
%>

</body>
</html>