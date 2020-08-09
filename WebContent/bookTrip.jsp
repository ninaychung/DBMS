<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Train Schedule</title>
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
		Statement stmt3 = con.createStatement();
		Statement stmt4 = con.createStatement();
		Statement stmt5 = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		
		
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String date = request.getParameter("date");
		String passengerType = request.getParameter("passenger type");
		String tripType = request.getParameter("trip type");
		String username = request.getParameter("username"); 
		java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date2 = new java.util.Date();
		String mydate = dateFormat.format(date2);
		System.out.println("mydate:" + mydate);
		//System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
		//String mydate = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
		String str5 = "SELECT MAX(`reservation number`) AS reservationnum FROM Reservation";
		ResultSet result5 = stmt5.executeQuery(str5);
		result5.next();
		int resNum = (result5.getInt("reservationnum") + 1);
		System.out.println("resnum: " + resNum);
		System.out.println("origin: " + origin);
		String str = "SELECT * FROM Stops WHERE `station name` = \"" + origin + "\"";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		String TLN = result.getString("TransitLineName");
		int trainID = Integer.parseInt(result.getString("train ID"));
		System.out.println("trainID: " + trainID);
		
		String str4 = "SELECT * FROM TrainSchedule WHERE `TransitLineName` = \"" + TLN + "\" AND TrainID = " + trainID + "";
		ResultSet result4 = stmt4.executeQuery(str4);
		result4.next();
		double fare = result4.getDouble("Fare");
				System.out.println("fare: " + fare);
				if(passengerType.equals("Child")){
					fare = fare - (fare*(.25));
					System.out.println("5");
				}else if(passengerType.equals("Senior")){
					fare = fare - (fare*(.35));
				}else if(passengerType.equals("Disabled")){
					fare = fare - (fare*(.50));
				}
				
				
				if(tripType == "One-way"){
					fare = fare*2;
					System.out.println("6");
				}
				//String str = "INSERT INTO `AskQuestion` VALUES ('" + question +"', '" + username + "', NULL, NULL)";
				String str2 = "INSERT INTO `Reservation` VALUES ('" + resNum +"', '" + date +"', '" + mydate +"', '" + passengerType +"',  '" + tripType +"', '" + fare +"', '" + origin +"', '" + destination +"', '" + TLN +"')";
				stmt2.executeUpdate(str2);
				String str3 = "INSERT INTO `Reserves` VALUES ('" + username +"', '" + resNum +"')";
				stmt3.executeUpdate(str3);
				

		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	}
	 	catch (Exception ex) {
		out.print(ex);
		out.print("booking failed");
	}
%>
	</table>
	<br>
	<form method="get" action="customerHomePage.jsp">

		<input type="submit" value="Return to Homepage">
	</form>
<br>
</body>
</html>