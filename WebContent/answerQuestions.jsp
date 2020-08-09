<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Answer Questions</title>
</head>
<body>
Customer Questions
<br>
<form method="get" action="performAnswerQuestions.jsp">
<table style="width:100%">
		  <tr>
		    <th>Select</th>
		    <th>Customer Username:</th>
		    <th>Question</th> 
		  </tr>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT * FROM AskQuestion";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		//parse out the results
		while (result.next()) {
			
			String customer = result.getString("CustomerUN");
			String question = result.getString("Question");
			String SSN = result.getString("Rep SSN");
			if (SSN == null) { // you can only answer questions that has not been answered
				out.print("<td><input type=\"radio\" name=\"select\" value=\"" + customer + " " + question +  "\"required></td>");
				out.print("<td>" + customer + "</td>");
				out.print("<td>" + question + "</td>");
				out.print("</tr>");
			}
			
			
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining AskQuestions database failed");
	}
%>
</table>
	Answer:<input type="text" id="answer" name="answer"/>
	<br>
	<label for="repun">Your Username:</label>
	  <select name="repun" id="repun">
<%
	// get customer rep username
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT Username FROM CustomerRep";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		//parse out the results
		while (result.next()) {
			
			String repun = result.getString("Username");
			String val = "\"<option value=\"" + repun + "\">" + repun + "</option>\"";
			out.print(val);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining Customer database failed");
	}
%>	
		</select>
		<br>
	<input type="submit" value="Answer Question"/>
</form>
<form method="get" action="customerRepHomepage.jsp">
	<input type="submit" value="Return to Homepage">
</form>
</body>
</html>