<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%

// TODO: Print Customer information
if(userName != null){
	String sql = "SELECT customerId, firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid FROM customer WHERE customer.userid = /"/ + userName + "//";
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rst = ps.executeQuery();
	out.print("<table>"+
		"<tr>"+
			"<th>Id</th>"+
			"<th>rst.getString(1)</th>"+
		"</tr><tr>"+
			"<th>First Name</th>"+
			"<th>rst.getString(2)</th>"+
		"</tr><tr>"+
			"<th>Last Name</th>"+
			"<th>rst.getString(3)</th>"+
		"</tr><tr>"+
			"<th>Email</th>"+
			"<th>rst.getString(4)</th>"+
		"</tr><tr>"+
			"<th>Phone</th>"+
			"<th>rst.getString(5)</th>"+
		"</tr><tr>"+
			"<th>Address</th>"+
			"<th>rst.getString(6)</th>"+
		"</tr><tr>"+
			"<th>City</th>"+
			"<th>rst.getString(7)</th>"+
		"</tr><tr>"+
			"<th>State</th>"+
			"<th>rst.getString(8)</th>"+
		"</tr><tr>"+
			"<th>Postal Code</th>"+
			"<th>rst.getString(9)</th>"+
		"</tr><tr>"+
			"<th>Country</th>"+
			"<th>rst.getString(10)</th>"+
		"</tr><tr>"+
			"<th>User id</th>"+
			"<th>rst.getString(11)</th>"+


		"</tr>");
		out.print("</table>");
	}
	catch (SQLException ex){ 	
		out.println(ex); 
	}
	
}else{
	out.println("You are not signed in");
}


// Make sure to close connection
%>

</body>
</html>

