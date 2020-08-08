<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Most Reservations</title>
</head>
<body>
<h2>5 Most Active Transit Line Names</h2>
<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String month = request.getParameter("month");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		//String str = "SELECT SUM(`fare cost`)sum FROM Reservation WHERE MONTH(CAST(reservation_date AS DATE)) = " + month + "";
		String str = "SELECT COUNT(TLN) AS count, TLN FROM Reservation WHERE MONTH(CAST(reservation_date AS DATE)) = " + month + " GROUP BY TLN ORDER BY COUNT(TLN) DESC";
		
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		//parse out the results
		System.out.println("result: " + result);
		
		if (!result.isBeforeFirst()) {
			out.print("Seems like there were no reservations for this month :/");
		} else {
			
%>
<table style="width:100%">
	<tr>
		<th>Transit Line Name</th>
		<th>Number of Reservations</th>
	</tr>
<% 
			int num = 0;
			
			while (result.next() && num < 5) {
					
				String count = result.getString("count");
				String tln = result.getString("TLN");
				
				out.print("<tr>");
				out.print("<td>" + tln + "</td>");
				out.print("<td>" + count + "</td>");
				out.print("</tr>");
				num++;
				
				
			}
		}
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(" obtaining most reservations failed");
	}
%>

</table>
<br>
	<form method="get" action="adminHomepage.jsp">

		<input type="submit" value="Return to Admin Homepage">
	</form>
</body>
</html>