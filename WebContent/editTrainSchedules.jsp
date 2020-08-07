<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Edit/Delete Train Schedule</title>
</head>
<body>
<form method="get" action="performEditTrainSchedules.jsp">
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//Get the selected radio button from customerRepHome.jsp
		String entity = request.getParameter("type");
		if (entity.equals("Train Schedule")) {
			out.print("<h2>Editing Train Schedule</h2>"); 
			out.print("Select the row you want to edit. Then specify the changes below.<br>"); 
%>

<table style="width:100%">
	<tr>
		<th>Select</th>
		<th>Train ID</th>
		<th>Transit Line Name</th> 
		<th>Origin</th>
		<th>Destination</th>
		<th>Arrival Date Time:</th>
		<th>Departure Date Time:</th>
	</tr>
	
<%
		
			String str = "SELECT * FROM TrainSchedule";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//parse out the results
				
			while (result.next()) {
				String trainID = result.getString("trainID");
				String transitLine = result.getString("TransitLineName");
				String origin = result.getString("Origin");
				String dest = result.getString("Destination");
				String arrival = result.getString("ArrivalDateTime");
				String departure = result.getString("DepartureDateTime");
				
				out.print("<tr>");
				out.print("<td><input type=\"radio\" name=\"select\" value=\"" + trainID + "\"required></td>");
				out.print("<td>" + trainID + "</td>");
				out.print("<td>" + transitLine + "</td>");
				out.print("<td>" + origin + "</td>");
				out.print("<td>" + dest + "</td>");
				out.print("<td>" + arrival + "</td>");
				out.print("<td>" + departure + "</td>");
				out.print("</tr>");
			}
%>
</table>
<br>

	<label for="edit">Edit:</label>
	
	<select name="edit" id="edit">
	  <option value="ArrivalDateTime">Arrival DateTime</option>
	  <option value="DepartureDateTime">Departure DateTime</option>
	</select>
	to
	<input type="datetime-local" id="time" value = "2020-08-08 9:20:00"
	       name="time">
	<input type="submit" value="Submit">
</form>
Please format the time as "YYYY-MM-DD HH:MM:SS", otherwise it will not work.

<%		
			
			
		} else {
			out.print("<h2>Editing Stops</h2>");
%>
<table style="width:100%">
	<tr>
		<th>Select</th>
		<th>Train ID</th>
		<th>Transit Line Name</th> 
		<th>Station ID</th>
		<th>Station Name</th>
		<th>Arrival Date Time:</th>
		<th>Departure Date Time:</th>
	</tr>
<%
			String str = "SELECT * FROM Stops";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//parse out the results
			while (result.next()) {
				String trainID = result.getString("train ID");
				String transitLine = result.getString("TransitLineName");
				String stationID = result.getString("station ID");
				String stationName = result.getString("station name");
				String arrival = result.getString("arrival datetime");
				String departure = result.getString("departure datetime");
				
				out.print("<tr>");
				out.print("<td><input type=\"radio\" name=\"select\" value=\"" + trainID + stationID +  "\"required></td>");
				out.print("<td>" + trainID + "</td>");
				out.print("<td>" + transitLine + "</td>");
				out.print("<td>" + stationID + "</td>");
				out.print("<td>" + stationName + "</td>");
				out.print("<td>" + arrival + "</td>");
				out.print("<td>" + departure + "</td>");
				out.print("</tr>");
			}
%>
</table>
<br>
	<input type="radio" name="action" value="Edit" required> Edit
	<input type="radio" name="action" value="Delete"> Delete
	<br>
	<select name="edit" id="edit">
		<option value="arrival datetime">Arrival DateTime</option>
		<option value="departure datetime">Departure DateTime</option>
	</select>
	to
	<input type="datetime-local" id="time" value = "2020-08-08 9:20:00" name="time">
	
	<br>		
	<input type="submit" value="Submit">
	<br>
	
</form>
<br>
Please format the time as "YYYY-MM-DD HH:MM:SS", otherwise it will not work.
<br>
<br>
<form method="get" action="customerRepHomepage.jsp">
	<input type="submit" value="Return to Homepage">
</form>

<%	
		}
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed while doing editTrainSchedules.jsp");
	}
%>
	
</body>
</html>