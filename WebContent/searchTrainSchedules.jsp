<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Train Schedule</title>
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
		
		String station = request.getParameter("station");
		out.print("<h2> Train Schedules that pass through " + station + " </h2>"); %>
		<table style="width:100%">
		  <tr>
		    <th>Transit Line Name</th>
		    <th>Train ID</th> 
		    <th>Final Destination</th>
		    <th>Arriving At:</th>
		    <th>Departing At:</th>
		  </tr>
		<%

		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM Stops WHERE `station name` = \"" + station + "\"";
		
		//Run the query against the database.
		
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
			
		while (result.next()) {
				
			String transitLine = result.getString("Transit Line Name");
			String trainID = result.getString("train ID");
			String arrival = result.getString("arrival datetime");
			String departure = result.getString("departure datetime");
		
			String str2 = "SELECT * FROM TrainSchedule WHERE trainID = " + trainID + "";
			ResultSet result2 = stmt2.executeQuery(str2);
			result2.next();
			String dest = result2.getString("Destination");
			
			out.print("<tr>");
			out.print("<td>" + transitLine + "</td>");
			out.print("<td>" + trainID + "</td>");
			out.print("<td>" + dest + "</td>");
			out.print("<td>" + arrival + "</td>");
			out.print("<td>" + departure + "</td>");
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
	<br>
	<form method="get" action="customerRepHomepage.jsp">

		<input type="submit" value="Return to Homepage">
	</form>
<br>
</body>
</html>