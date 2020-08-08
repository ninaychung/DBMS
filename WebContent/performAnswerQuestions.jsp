<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>performAnswerQuestions</title>
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
		String select = request.getParameter("select");
		String[] arr = select.split(" ");
		String answer = request.getParameter("answer");
		String repun = request.getParameter("repun");
		// get SSN
		String str = "SELECT SSN FROM CustomerRep WHERE Username = \"" + repun + "\"";
		ResultSet result = stmt.executeQuery(str);
		String SSN = "";
		while (result.next()) {
			SSN = result.getString("SSN");
			
		}
		String str2 = "UPDATE AskQuestion SET Answer = \"" + answer + "\", SSN = \"" + SSN + "\" WHERE Username = \"" + arr[0] + "\" AND Question = \"" + arr[1] + "\"";
		stmt2.executeUpdate(str2);
		
		out.println("Update successful");

		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Update failed");
	}
%>
<form method="get" action="customerRepHomepage.jsp">
	<input type="submit" value="Return to Homepage">
</form>
</body>
</html>