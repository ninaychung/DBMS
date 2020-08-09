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
	<label for="date">Date of Trip:</label>
	  <select name="date" id="date">

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT DISTINCT `departure date` FROM Stops ORDER BY `departure date` ASC";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
		while (result.next()) {
			String deptDate = result.getString("departure date");
			String val = "\"<option value=\"" + deptDate + "\">" + deptDate + "</option>\"";
			//Make an HTML table to show the results in:
			out.print(val);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining dates failed");
	}
%>
		</select>
		<br>
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
		Statement stmt2 = con.createStatement();

		String str2 = "SELECT * FROM Station";
		// run query against database
		ResultSet result2 = stmt2.executeQuery(str2);
		
		//parse out the results
		while (result2.next()) {
			String stationName = result2.getString("station name");
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
<form method="get" action="reservationHistory.jsp">
		<table>
			<tr>    
				<td>Username:</td><td><input type="text" name="username" required></td>
			</tr>
		</table>
		<br>
		<br>
	<form method="get" action="bookTrip.jsp">
		<input type="submit" value="Book Trip">
	</form>
<br>
	
<br>
Question & Answer Forum:
<table style="width:100%">
		  <tr>
		    <th>Question</th>
		    <th>Asked By</th> 
		    <th>Answer</th>
		    <th>Answered By</th>

		  </tr>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();
		

		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM AskQuestion";
		
		//Run the query against the database.
		
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
			
		while (result.next()) {
				
			String question = result.getString("Question");
			String customerun = result.getString("CustomerUN");
			out.print("<tr>");
			out.print("<td>" + question + "</td>");
			out.print("<td>" + customerun + "</td>");

			String answer = result.getString("Answer");
			if (answer == null) {
				out.print("<td></td>");
				out.print("<td></td>");
			} else {
				String ssn = result.getString("Rep SSN");
				String str2 = "SELECT Username FROM CustomerRep WHERE SSN = \"" + ssn + "\"";
				ResultSet result2 = stmt2.executeQuery(str2);
				result2.next();
				String repun = result2.getString("Username");
				out.print("<td>" + answer + "</td>");
				out.print("<td>" + repun + "</td>");
			}
			
			out.print("</tr>");
		}
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(" Getting AskQuestion Database failed");
	}
%>
</table>
<br>
Search Question by Keyword:
	<form method="get" action="searchQuestion.jsp">
		<input type="text" name="search" required>
		<input type="submit" value="Search">
	</form>
		
<br>
Ask a Question:
	<form method="get" action="askQuestion.jsp">
		<input type="text" name="question">		
		
		<label for="username">Your Username:</label>
	  	<select name="username" id="username" required>

<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();

		//Create a SQL statement
		Statement state = conn.createStatement();
		
		String strng = "SELECT Username FROM Customer";
		// run query against database
		ResultSet rslt = state.executeQuery(strng);
		
		//parse out the results
		while (rslt.next()) {
			String username = rslt.getString("Username");
			String valu = "\"<option value=\"" + username + "\">" + username + "</option>\"";
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



		<input type="submit" value="Ask Away!">
	</form>

	<form method="get" action="index.jsp">

		<input type="submit" value="Logout">
	</form>

</body>
</html>