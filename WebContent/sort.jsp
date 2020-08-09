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
		
		/*out.print(origin);
		out.print(destination);
		out.print(departure);
		out.print(arrival);
		out.println(" ");*/
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "'";
		
		String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "'";
		//String str2= "SELECT TrainID FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "'";
		
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//ResultSet result2 = stmt2.executeQuery(str2);
		
		//out.print(result2);
		
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
			out.print("<td>" + print_departureTime + "</td>");
			out.print("<td>" + print_arrivalTime + "</td>");
			out.print("<td>" + print_fare + "</td>");
			out.print("<td>" + print_ID + "</td>");
			out.print("</tr>");
		}
		
		//while(result2.next()) {
		//	String print_trainID2 = result2.getString("TrainID");
		//	out.print("<tr>");
		//	out.print(print_trainID2);
		//	out.print("</tr>");
		//}
			
		con.close();
				
	}catch (Exception ex) {
			out.print(ex);
			out.print("Operation failed");
}
%>

<table style="width:30%">
<br>
<br>
		<tr>
			<th>Train ID</th>
			<th>Station Name</th>
			<th>Arrival Date</th> 
			<th>Arrival Time</th>
			<th>Departure Time</th>
			</tr>
			
<%		
try {
		String destination = request.getParameter("toStation");
		String departure = request.getParameter("departDate");
		String arrival = request.getParameter("returnDate");
		String origin = request.getParameter("fromStation");
		String sortCriteria = request.getParameter("sortBy");
		
		//out.print(origin2);
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt2 = con.createStatement();
		
		//String str = "SELECT * FROM `Stops` WHERE `station name` = '" + origin2 + "'";
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "'";
		
		String str2= "SELECT TrainID FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "'";
		
		ResultSet result2 = stmt2.executeQuery(str2);
		//String print_trainID2 = result2.getString("TrainID");
		//out.print(print_trainID2);
		
		//String print_trainID2 = result2.getString("TrainID");
		
		//out.print(print_trainID2);
		//Run the query against the database.
				
		String idholder = "";
		//parse out the results
		
		while (result2.next()) {
			String print_trainID2 = result2.getString("TrainID");
			//out.print(print_trainID2);
			idholder = print_trainID2;
		}
		
		//Create a SQL statement
		Statement stmt3 = con.createStatement();
		
		//String str = "SELECT * FROM `Stops` WHERE `station name` = '" + origin2 + "'";
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "'";
		
		//String str3= "SELECT TrainID FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "'";
		//String str3 = "SELECT * FROM `Stops` WHERE `train ID` = '" + idholder + "' ORDER BY " + sortCriteria + "";
		//String str = "SELECT * FROM TrainSchedule WHERE Origin = '" + origin + "' AND Destination = '" + destination + "' AND DepartureDate = '" + departure + "' ORDER BY " + sortCriteria + "";
		String str3 = "SELECT * FROM `Stops` WHERE `train ID` = '" + idholder + "' ORDER BY " + sortCriteria + "";
	
		//out.print("idholder: " +idholder);
		
		ResultSet result3 = stmt3.executeQuery(str3);
		
		//Run the query against the database.
				
		//parse out the results
		while (result3.next()) {
			//String print_trainID2 = result2.getString("TrainID");
			
			String print_trainID = result3.getString("train ID");
			String print_stationName = result3.getString("station name");
			String print_arrivalDate = result3.getString("arrival date");
			String print_arrivalTime = result3.getString("arrival time");
			String print_departureTime = result3.getString("departure time");
			
			
			out.print("<tr>");
			out.print("<td>" + print_trainID + "</td>");
			out.print("<td>" + print_stationName + "</td>");
			out.print("<td>" + print_arrivalDate + "</td>");
			out.print("<td>" + print_arrivalTime + "</td>");
			out.print("<td>" + print_departureTime + "</td>");

			//out.print(print_trainID2);
		//	out.print("</tr>");
		}
		
		con.close();
				
	}catch (Exception ex) {
			out.print(ex);
			out.print("Operation failed");
}
%>

</body>
</html>