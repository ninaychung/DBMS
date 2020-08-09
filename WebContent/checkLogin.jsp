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
		
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("type");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT * FROM " + entity + " WHERE Username = '"+ username +"' AND Password = '"+ password +"'";
		// run query against database
		ResultSet result = stmt.executeQuery(str);
		

		if (result.next()) { // success
			out.print("login succeeded\n");
			out.print("Welcome, " + username);
			String redirectUrl;
			if (entity.equals("CustomerRep")) {
				
				redirectUrl = "http://ec2-35-175-238-117.compute-1.amazonaws.com:8080/cs336Project-Group3/customerRepHomepage.jsp";
				response.sendRedirect(redirectUrl);
			} else if(entity.equals("Customer")) {
				redirectUrl = "http://ec2-35-175-238-117.compute-1.amazonaws.com:8080/cs336Project-Group3/customerHomePage.jsp";
				response.sendRedirect(redirectUrl);
			} else { //admin
				redirectUrl = "http://ec2-35-175-238-117.compute-1.amazonaws.com:8080/cs336Project-Group3/adminHomepage.jsp";
				response.sendRedirect(redirectUrl);
			}
			
			/**response.sendRedirect(redirectUrl);*/
		} else {
			out.print("username and/or password does not exist");
		}
		

		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("login failed");
	}
%>
</body>
</html>