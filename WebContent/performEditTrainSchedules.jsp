<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
		String select = request.getParameter("select");
		
		if (action == null) { // train schedule
			String edit = request.getParameter("edit");
			String time = request.getParameter("time");
			String str = "UPDATE TrainSchedule SET `" + edit + "`=\"" + time + "\" WHERE trainID = " + select + "";
			stmt.executeUpdate(str);
			out.println("Update successful");
		} else { // stops
			String trainID = select.substring(0, 4);
			String stationID = select.substring(4);

			if (action.equals("Edit")) {
				String time = request.getParameter("time");
				String edit = request.getParameter("edit");
				String str = "UPDATE Stops SET `" + edit + "`=\"" + time + "\" WHERE `train ID` = " + trainID + " AND `station ID` = " + stationID + "";
				stmt.executeUpdate(str);
				out.println("Update successful");

			} else { // delete
				String str = "DELETE FROM Stops WHERE `train ID` = " + trainID + " AND `station ID` = " + stationID + "";
				stmt.executeUpdate(str);
				out.print("Delete Successful");
			}	
		}
			
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("perform edit train schedule failed");
	}
%>

<form method="get" action="customerRepHomepage.jsp">
	<input type="submit" value="Return to Homepage">
</form>

</body>
</html>