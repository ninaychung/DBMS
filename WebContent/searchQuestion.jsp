<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Search Question</title>
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
		
		String search = request.getParameter("search");
		

		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM AskQuestion WHERE Question LIKE '%" + search + "%'";
		
		//Run the query against the database.
		
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
		if (!result.isBeforeFirst()) {
			out.print("Seems like no questions matched your search :/");
		} else {
			out.print("<h2>Result for \"" + search + "\" </h2>");
%>

<table style="width:100%">
		  <tr>
		    <th>Question</th>
		    <th>Asked By</th> 
		    <th>Answer</th>
		    <th>Answered By</th>

		  </tr>
<% 		

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
	<form method="get" action="customerHomePage.jsp">

		<input type="submit" value="Return to Customer Homepage">
	</form>
<br>
</body>
</html>