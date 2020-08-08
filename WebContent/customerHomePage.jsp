<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<title>Customer Home Page</title>
</head>

<body>

WELCOME TO THE HOME PAGE 		
<br>
<br>
View Reservation History
<br>
<br>
<form method="get" action="enterUsername.jsp">
<input type="submit" value="Reservation History">
</form>

<br>


Book Trip
<br>

<!-- query stations -->
<br>
	<form method="get" action="bookTrip.jsp">
	<label for="origin">Origin:</label>
	  <select name="origin" id="origin">

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT * FROM Station";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
		while (result.next()) {
			String stationName = result.getString("station name");
			String val = "\"<option value=\"" + stationName + "\">" + stationName + "</option>\"";
			//Make an HTML table to show the results in:
			out.print(val);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining Stations failed");
	}
%>
		</select>

<br>

<br>
	<form method="get" action="bookTrip.jsp">
	<label for="destination">Destination:</label>
	  <select name="destination" id="destination">

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();

		//Create a SQL statement
		Statement state = conn.createStatement();
		String username = request.getParameter("username");
		
		String strng = "SELECT * FROM Station";
		// run query against database
		ResultSet rslt = state.executeQuery(strng);
		
		//parse out the results
		while (rslt.next()) {
			String statName = rslt.getString("station name");
			String valu = "\"<option value=\"" + statName + "\">" + statName + "</option>\"";
			//Make an HTML table to show the results in:
			out.print(valu);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		conn.close();
		
		
	} catch (Exception except) {
		out.print(except);
		out.print("obtaining Stations failed");
	}
%>

</select>
<br>
<br>
Passenger: 

<input type="radio" name="passenger type" value="Adult" required> Adult
<input type="radio" name="passenger type" value="Child"> Child
<input type="radio" name="passenger type" value="Senior"> Senior
<input type="radio" name="passenger type" value="Disabled"> Disabled

<br>
<br>

Select:
<input type="radio" name="trip type" value="One-Way" required> One-Way
<input type="radio" name="trip type" value="Round-Trip"> Round-Trip

<br>
<!-- submit -->
<br>
	<form method="get" action="bookTrip.jsp">
		<input type="submit" value="Search">
	</form>

	<form method="get" action="index.jsp">

		<input type="submit" value="Logout">
	</form>
<br>
</body>
</html>