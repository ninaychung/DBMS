<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		
		// check if customer exists in the db already via username: 
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT * FROM Customer WHERE Username = '"+ username + "'";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		if (result.next()) {
			out.print("username already exists in the database");
		} else {
		
		
			//Make an insert statement for the Customer table:
			String insert = "INSERT INTO Customer(Username, Password, FirstName, LastName, Email)"
							+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, firstname);
			ps.setString(4, lastname);
			ps.setString(5, email);
			//Run the query against the DB
			ps.executeUpdate();		
			
				String redirectUrl = "http://localhost:8080/cs336Sample_(2)/index.jsp";
				response.sendRedirect(redirectUrl);
			
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("signup failed");
	}
%>
	

</body>
</html>