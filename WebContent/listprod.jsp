<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>CJLR Grocery</title>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<input type="text" name="productName" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<table>
	<tbody>
		<tbody><tr><th></th><th>Product Name</th><th>Price</th></tr>
			<tr><td><a href="addcart.jsp?id=1&amp;name=Chair&amp;price=18.0">Add to Cart</a></td><td>Chair</td><td>$18.00</td></tr>
			<tr><td><a href="addcart.jsp?id=2&amp;name=Chang&amp;price=19.0">Add to Cart</a></td><td>Chang</td><td>$19.00</td></tr>
			<tr><td><a href="addcart.jsp?id=3&amp;name=Aniseed Syrup&amp;price=10.0">Add to Cart</a></td><td>Aniseed Syrup</td><td>$10.00</td></tr>
			<tr><td><a href="addcart.jsp?id=4&amp;name=Chef Anton's Cajun Seasoning&amp;price=22.0">Add to Cart</a></td><td>Chef Anton's Cajun Seasoning</td><td>$22.00</td></tr>
			<tr><td><a href="addcart.jsp?id=5&amp;name=Chef Anton's Gumbo Mix&amp;price=21.35">Add to Cart</a></td><td>Chef Anton's Gumbo Mix</td><td>$21.35</td></tr>
			<tr><td><a href="addcart.jsp?id=6&amp;name=Grandma's Boysenberry Spread&amp;price=25.0">Add to Cart</a></td><td>Grandma's Boysenberry Spread</td><td>$25.00</td></tr>
			<tr><td><a href="addcart.jsp?id=7&amp;name=Uncle Bob's Organic Dried Pears&amp;price=30.0">Add to Cart</a></td><td>Uncle Bob's Organic Dried Pears</td><td>$30.00</td></tr>
			<tr><td><a href="addcart.jsp?id=8&amp;name=Northwoods Cranberry Sauce&amp;price=40.0">Add to Cart</a></td><td>Northwoods Cranberry Sauce</td><td>$40.00</td></tr>
			<tr><td><a href="addcart.jsp?id=9&amp;name=Mishi Kobe Niku&amp;price=97.0">Add to Cart</a></td><td>Mishi Kobe Niku</td><td>$97.00</td></tr>
			<tr><td><a href="addcart.jsp?id=10&amp;name=Ikura&amp;price=31.0">Add to Cart</a></td><td>Ikura</td><td>$31.00</td></tr>
			<tr><td><a href="addcart.jsp?id=11&amp;name=Queso Cabrales&amp;price=21.0">Add to Cart</a></td><td>Queso Cabrales</td><td>$21.00</td></tr>
			<tr><td><a href="addcart.jsp?id=12&amp;name=Queso Manchego La Pastora&amp;price=38.0">Add to Cart</a></td><td>Queso Manchego La Pastora</td><td>$38.00</td></tr>
			<tr><td><a href="addcart.jsp?id=13&amp;name=Tofu&amp;price=23.25">Add to Cart</a></td><td>Tofu</td><td>$23.25</td></tr>
			<tr><td><a href="addcart.jsp?id=14&amp;name=Genen Shouyu&amp;price=15.5">Add to Cart</a></td><td>Genen Shouyu</td><td>$15.50</td></tr>
			<tr><td><a href="addcart.jsp?id=15&amp;name=Pavlova&amp;price=17.45">Add to Cart</a></td><td>Pavlova</td><td>$17.45</td></tr>
			<tr><td><a href="addcart.jsp?id=16&amp;name=Alice Mutton&amp;price=39.0">Add to Cart</a></td><td>Alice Mutton</td><td>$39.00</td></tr>
			<tr><td><a href="addcart.jsp?id=17&amp;name=Carnarvon Tigers&amp;price=62.5">Add to Cart</a></td><td>Carnarvon Tigers</td><td>$62.50</td></tr>
			<tr><td><a href="addcart.jsp?id=18&amp;name=Teatime Chocolate Biscuits&amp;price=9.2">Add to Cart</a></td><td>Teatime Chocolate Biscuits</td><td>$9.20</td></tr>
			<tr><td><a href="addcart.jsp?id=19&amp;name=Sir Rodney's Marmalade&amp;price=81.0">Add to Cart</a></td><td>Sir Rodney's Marmalade</td><td>$81.00</td></tr>
			<tr><td><a href="addcart.jsp?id=20&amp;name=Sir Rodney's Scones&amp;price=10.0">Add to Cart</a></td><td>Sir Rodney's Scones</td><td>$10.00</td></tr>
			<tr><td><a href="addcart.jsp?id=21&amp;name=Gustaf's Knackebread&amp;price=21.0">Add to Cart</a></td><td>Gustaf's Knackebread</td><td>$21.00</td></tr>
			<tr><td><a href="addcart.jsp?id=22&amp;name=Sasquatch Ale&amp;price=14.0">Add to Cart</a></td><td>Sasquatch Ale</td><td>$14.00</td></tr>
			<tr><td><a href="addcart.jsp?id=23&amp;name=Steeleye Stout&amp;price=18.0">Add to Cart</a></td><td>Steeleye Stout</td><td>$18.00</td></tr>
			<tr><td><a href="addcart.jsp?id=24&amp;name=Inlagd Sill&amp;price=19.0">Add to Cart</a></td><td>Inlagd Sill</td><td>$19.00</td></tr>
			<tr><td><a href="addcart.jsp?id=25&amp;name=Boston Crab Meat&amp;price=18.4">Add to Cart</a></td><td>Boston Crab Meat</td><td>$18.40</td></tr>
			<tr><td><a href="addcart.jsp?id=26&amp;name=Jack's New England Clam Chowder&amp;price=9.65">Add to Cart</a></td><td>Jack's New England Clam Chowder</td><td>$9.65</td></tr>
			<tr><td><a href="addcart.jsp?id=27&amp;name=Singaporean Hokkien Fried Mee&amp;price=14.0">Add to Cart</a></td><td>Singaporean Hokkien Fried Mee</td><td>$14.00</td></tr>
			<tr><td><a href="addcart.jsp?id=28&amp;name=Louisiana Fiery Hot Pepper Sauce&amp;price=21.05">Add to Cart</a></td><td>Louisiana Fiery Hot Pepper Sauce</td><td>$21.05</td></tr>
			<tr><td><a href="addcart.jsp?id=29&amp;name=Laughing Lumberjack Lager&amp;price=14.0">Add to Cart</a></td><td>Laughing Lumberjack Lager</td><td>$14.00</td></tr>		
	</tbody>
</table>

<% // Get product name to search for
		


//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

String prodName = request.getParameter("productName");
String prodPrice = request.getParameter("productPrice");

try(Connection con = DriverManager.getConnection(url, uid, pw);)
{
	String sql = "Select productName, productPrice FROM Product";

	boolean hasProd = prodName != null && !prodName.equals("");

	PreparedStatement pstmt = null;
	ResultSet rst = null;

	if(hasProd)
		prodName = "%" + prodName + "%";
	if (!hasProd) 
	{
		pstmt = con.prepareStatement(sql);
		rst = pstmt.executeQuery();
	} 
	else if (hasProd) {
		sql += " WHERE productName LIKE ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, prodName);
		rst = pstmt.executeQuery();
    }

	sql = pstmt.toString();
	out.println("<h2>SQL Query: " + sql + "</h2>");
	out.print("<table><tr><th>Product Name</th><th>Price</th></tr>");
	while (rst.next()) {
		out.println("<tr><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td><td>");
	}
	out.println("</table></body></html>");		
} catch (SQLException ex) {
	out.println(ex);
} 


// Make the connection

// Print out the ResultSet

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice
// Close connection

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);	// Prints $5.00
%>

</body>
</html>