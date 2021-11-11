<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>YOUR NAME Grocery Order List</title>
</head>
<body>
	<style>
		table, th, td {
			border: 1px solid black;
		}
	</style>
<h1>Order List</h1>

<%
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection
try ( Connection con = DriverManager.getConnection(url, uid, pw);
      Statement stmt = con.createStatement();) 
// Write query to retrieve all order summary records
{		
	ResultSet rst = stmt.executeQuery("SELECT orderId, orderDate, customer.customerId, CONCAT(firstName,SPACE(1),lastName) AS customerName, totalAmount FROM customer JOIN orderSummary ON orderSummary.customerId = customer.customerId");		
	out.println("<table><tr><th>Order Id</th><th>Order Date</th><th>Customer Id</th><th>Customer Name</th><th>Total Amount</th></tr>");
	while (rst.next())
	{	out.println("<tr><td>"+rst.getString(1)+"</td>"+"<td>"+rst.getDate(2)+"</td>"+"<td>"+rst.getString(3)+"</td>"+"<td>"+rst.getString(4)+"</td>"+"<td>"+"$"+rst.getString(5)+"</td></tr>");
	}
	out.println("</table>");
}
// For each order in the ResultSet

	// Print out the order summary information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 
catch (SQLException ex) 
{ 	out.println(ex); 
}
// Close connection
%>

</body>
</html>

