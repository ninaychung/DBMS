<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Ask Question</title>
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
		
		String question = request.getParameter("question");
		String username = request.getParameter("username");
		String str = "INSERT INTO `AskQuestion` VALUES ('" + question +"', '" + username + "', NULL, NULL)";
		stmt.executeUpdate(str);
		out.println("Update successful");
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("asking question failed :(");
	}
%>

	<br>
	<form method="get" action="customerHomePage.jsp">

		<input type="submit" value="Return to Customer Homepage">
	</form>
<br>
</body>
</html>