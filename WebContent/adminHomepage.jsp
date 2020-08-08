<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function signOut(){
	 window.location = "http://localhost:8080/cs336Sample_(1)/index.jsp";	
}
/*
function reFresh(){
	window.location = "http://localhost:8080/cs336Sample_(1)/adminHomepage.jsp";	
}
*/
</script>
<meta charset="UTF-8">
<title>Admin HomePage</title>
</head>
<body>
Welcome Admin!
<br>
<button onclick="signOut()">Log Out</button>
<br>
<br>

Here are the details on all the Reps:
<br>
	  
   <table border = "1" width = "100%">
   	<tr>
	    	<th>SSN</th>
			<th>Username</th>
			<th>Password</th>
			<th>FirstName</th>
			<th>LastName</th>
	</tr>
	
	 
<%
	try {
		

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT * FROM TrainProject.CustomerRep";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		
		//parse out the results
		while (result.next()) {
			String nn = result.getString("SSN");
			String un = result.getString("UserName");
			String pw = result.getString("Password");
			String fn = result.getString("FirstName");
			String ln = result.getString("LastName");
			out.print("<tr>");
			out.print("<td>"+nn+"</td>");
			out.print("<td>"+un+"</td>");
			out.print("<td>"+pw+"</td>");
			out.print("<td>"+fn+"</td>");
			out.print("<td>"+ln+"</td>");
			out.print("</tr>");
		}
		
		
	
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining Stations failed");
	}
%>
</table>
<br>
<br>
Add New Customer Reps Here:
<br>
<form method="get" action="adminHomepage.jsp">
<table>
	<tr>    
		<td>SSN</td><td><input type="text" name="Ssn" ></td>
		</tr>
	<tr>
	    <td>Username</td><td><input type="text" name="Un"></td>
	</tr>
	<tr>
		<td>Password</td><td><input type="password" name="Pw" ></td>
	</tr>
	<tr>
		<td>FirstName</td><td><input type="text" name="Fn"></td>
	</tr>
	<tr>
		<td>LastName</td><td><input type="text" name="Ln" ></td>
	</tr>
					
</table>
<input type="submit" value="Add Customer Rep" onclick="reFresh()">
</form>


<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con1 = db.getConnection();

	//Create a SQL statement
	Statement stmt1 = con1.createStatement();
	
	String Ssn = request.getParameter("Ssn");
	String Un = request.getParameter("Un");
	String Pw = request.getParameter("Pw");
	String Fn = request.getParameter("Fn");
	String Ln = request.getParameter("Ln");


		//Make an insert statement for the Customer table:
		String insert = "INSERT INTO TrainProject.CustomerRep(SSN, Username, Password, FirstName, LastName)"
						+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con1.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, Ssn);
		ps.setString(2, Un);
		ps.setString(3, Pw);
		ps.setString(4, Fn);
		ps.setString(5, Ln);
		//Run the query against the DB
		ps.executeUpdate();
		/*
		String redirectUrl;
		redirectUrl = "http://localhost:8080/cs336Sample_(1)/adminHomepage.jsp";
		response.sendRedirect(redirectUrl);
		*/
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con1.close();
	
	
} catch (Exception ex) {
	out.print(ex);
	out.print("Insert Failed");
}

%>

<br>
<br>
Delete Customer Reps Here:
<br>
<form method="get" action="adminHomepage.jsp">
<table>
	<tr>    
		<td>SSN</td><td><input type="text" name="Ssn1" ></td>
		</tr>
	<tr>
	    <td>Username</td><td><input type="text" name="Un1"></td>
	</tr>
	<tr>
		<td>Password</td><td><input type="password" name="Pw1" ></td>
	</tr>
	<tr>
		<td>FirstName</td><td><input type="text" name="Fn1"></td>
	</tr>
	<tr>
		<td>LastName</td><td><input type="text" name="Ln1" ></td>
	</tr>
					
</table>
<input type="submit" value="Delete Customer Rep" onclick="reFresh()">
</form>

<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con1 = db.getConnection();

	//Create a SQL statement
	Statement stmt1 = con1.createStatement();
	
	String Ssn1 = request.getParameter("Ssn1");
	String Un1 = request.getParameter("Un1");
	String Pw1 = request.getParameter("Pw1");
	String Fn1 = request.getParameter("Fn1");
	String Ln1 = request.getParameter("Ln1");


		//Make an insert statement for the Customer table:
		String delete2 = "DELETE FROM CustomerRep WHERE SSN = \"" + Ssn1 + "\"";
		stmt1.executeUpdate(delete2);
		String delete = "DELETE FROM TrainProject.CustomerRep(SSN=?, Username=?, Password=?, FirstName=?, LastName=?)";
		/*
	String redirectUrl;
	redirectUrl = "http://localhost:8080/cs336Sample_(1)/adminHomepage.jsp";
	response.sendRedirect(redirectUrl);
	*/
	//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	con1.close();
	
	
} catch (Exception ex) {
	out.print(ex);
	out.print("Deletion Failed");
}

%>

<br>
<br>
Edit Customer Rep Info:
<form method="get" action="editCustomerRep.jsp">
<label for="ssn">SSN:</label>
	  <select name="ssn" id="ssn">
<%
	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT SSN FROM CustomerRep";
		ResultSet result = stmt.executeQuery(str);
		//parse out the results
		while (result.next()) {
			String ssn = result.getString("SSN");
			String val = "\"<option value=\"" + ssn + "\">" + ssn + "</option>\"";
			out.print(val);
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
	
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining Customer Rep SSN Failed");
	}
%>
	</select>
<label for="edit">Edit:</label>
	  <select name="edit" id="edit">
	  	<option value="Username">Username</option>
	  	<option value="Password">Password</option>
	  	<option value="FirstName">FirstName</option>
	  	<option value="LastName">LastName</option>
	  </select>
	  <input type="text" name="editTo" required>
	  <input type="submit" value="Submit">
</form>


<br>
Sales Report:	
<br>

   <table border = "1" width = "100%">
   	<tr>
	    	<th>Reservation Number</th>
			<th>Departure Date</th>
			<th>Reservation Date</th>
			<th>Fare Type</th>
			<th>Trip Type</th>
			<th>Fare Cost</th>
			<th>Origin Station</th>
			<th>Destination Station</th>
	</tr>

<%
	try {
		

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT * FROM TrainProject.Reservation";
		//String str2 = "SELECT CAST(reservation_date AS DATE)date FROM Reservation";
		ResultSet result = stmt.executeQuery(str);
		//ResultSet result1 = stmt.executeQuery(str2);
		//parse out the results
		while (result.next()) {
			String rn = result.getString("reservation number");
			String dd = result.getString("departure_date");
			String rd = result.getString("reservation_date");
			String ft = result.getString("fare type");
			String tt = result.getString("trip type");
			String fc = result.getString("fare cost");
			String os = result.getString("origin station");
			String ds = result.getString("destination station");
			out.print("<tr>");
			out.print("<td>"+rn+"</td>");
			out.print("<td>"+dd+"</td>");
			out.print("<td>"+rd+"</td>");
			out.print("<td>"+ft+"</td>");
			out.print("<td>"+tt+"</td>");
			out.print("<td>"+fc+"</td>");
			out.print("<td>"+os+"</td>");
			out.print("<td>"+ds+"</td>");
			out.print("</tr>");
		}
		
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("obtaining Sales Report Failed");
	}
%>
</table>
<br>
List of reservations By:
<form method="get" action="adminHomepage.jsp">		
<br>
<label>Sort By:</label>
<select name="sortBy">
<option> </option>
<option>Transit Line</option>
<option>customer Name</option>
</select>
<input type="submit" value="Sort">

<%
String sortBy = request.getParameter("sortBy");

%>
 </form>
 

<br>
Obtain Sales Report By Month:
<form method="get" action="salesReport.jsp">
	  <select name="month" id="month">
	  	<option value="1">January</option>
	  	<option value="2">February</option>
	  	<option value="3">March</option>
	  	<option value="4">April</option>
	  	<option value="5">May</option>
	  	<option value="6">June</option>
	  	<option value="7">July</option>
	  	<option value="8">August</option>
	  	<option value="9">September</option>
	  	<option value="10">October</option>
	  	<option value="11">November</option>
	  	<option value="12">December</option>
	  	
	</select>
	<input type="submit" value="Go">
</form>

</body>
</html>
