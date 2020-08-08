<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer Rep</title>
</head>
<body>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String ssn = request.getParameter("ssn");
		String edit = request.getParameter("edit");
		String editTo = request.getParameter("editTo");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str = "UPDATE CustomerRep SET `" + edit + "`=\"" + editTo + "\" WHERE SSN = " + ssn + "";
		stmt.executeUpdate(str);
		out.println("Update successful");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining questions failed");
	}
%>
<br>
	<form method="get" action="adminHomepage.jsp">

		<input type="submit" value="Return to Admin Homepage">
	</form>
</body>
</html>