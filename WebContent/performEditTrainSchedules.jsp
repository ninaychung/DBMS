<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Perform Edit Train Schedule</title>
</head>
<body>
Perform Edit Train Schedule:
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String action = request.getParameter("action");
		System.out.println("action: " + action);
		String select = request.getParameter("select");
		System.out.println("select: "+ select);
		
		if (action == null) { // train schedule
			System.out.println("in train schedule");
			String edit = request.getParameter("edit");
			System.out.println("edit: " + edit);
			String time = request.getParameter("time");
			System.out.println("time: " + time);
			
			
		} else { // stops
			System.out.println("in stops");
			if (action.equals("Edit")) {
				String edit = request.getParameter("edit");
				System.out.println("edit: " + edit);
				String time = request.getParameter("time");
				System.out.println("time: " + time);
			} else { // delete
				String str = "DELETE * FROM Stops WHERE";
			}	
		}
		
		
		
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("perform edit train schedule failed");
	}
%>

</body>
</html>