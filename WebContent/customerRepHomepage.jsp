<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Customer Rep HomePage</title>
</head>
<body>
YOU ARE AT THE CUSTOMER REP HOMEPAGE
<br>

<br>
Search Train Schedules:

<!-- query stations -->
<br>
	<form method="get" action="searchTrainSchedules.jsp">
	<label for="station">Station:</label>
	  <select name="station" id="station">

	  
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

		<input type="submit" value="Search">
	</form>
<br>
Edit and Delete Information from Train Schedules:
<form method="get" action="editTrainSchedules.jsp">
		<input type="radio" name="type" value="Train Schedule" required> Train Schedule
		<input type="radio" name="type" value="Stops"> Stops
		<input type="submit" value="Go">
	</form>

<br>
Customer Questions
<br>
<table style="width:100%">
		  <tr>
		    <th>Customer Username:</th>
		    <th>Question</th> 
		    <th>Answer</th>
		    <th>Answered By:</th>
		  </tr>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmt2 = con.createStatement();

		String str = "SELECT * FROM AskQuestion";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		//parse out the results
		while (result.next()) {
			
			String customer = result.getString("Username");
			String question = result.getString("Question");
			String answer = result.getString("Answer");
			String SSN = result.getString("SSN");
			String customerrep = "";
			if (!SSN.equals("")) {
				// get customer rep's username
				String str2 = "SELECT Username FROM CustomerRep WHERE SSN = \"" + result.getString("SSN") + "\"";
				ResultSet result2 = stmt2.executeQuery(str2);
				result2.next();
				customerrep = result2.getString("Username");
			}
			out.print("<tr>");
			out.print("<td>" + customer + "</td>");
			out.print("<td>" + question + "</td>");
			out.print("<td>" + answer + "</td>");
			out.print("<td>" + customerrep + "</td>");
			out.print("</tr>");
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining questions failed");
	}
%>
</table>
<br>
	<form method="get" action="answerQuestions.jsp">

		<input type="submit" value="Answer Customer Questions">
	</form>
<br>
	<form method="get" action="index.jsp">

		<input type="submit" value="Logout">
	</form>

</body>
</html>