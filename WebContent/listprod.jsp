<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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

<% // Get product name to search for
String name = request.getParameter("productName");	

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
	String sql = "SELECT productId, productName, productDesc, productPrice FROM product WHERE productName LIKE ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, "%"+ name+ "%");
	
	ResultSet rst = ps.executeQuery();
	boolean generaldisplay=true;
	NumberFormat currFormat = NumberFormat.getCurrencyInstance(new Locale("en", "US"));

		out.print("<br><br><table>"+
					"<thead><tr>"+
						"<th>Add to cart</th>"+
						"<th>Product Name</th>"+
						"<th>Product Description</th>"+
						"<th>Price</th>"+
					"</tr></thead><tbody>");
			
		while(rst.next()){
			String pid= rst.getString(1);
			String pname = rst.getString(2);
			String pdesc = rst.getString(3);
			Double price = rst.getDouble(4);
			String pnameEncoded = java.net.URLEncoder.encode(pname,"UTF-8").replace("+","%20");
			String cartLink = "addcart.jsp?id="+pid+"&name="+pnameEncoded+"&price="+price;
			String productLink = "product.jsp?id="+pid+"&name="+pnameEncoded+"&price="+price;
			
			out.print("<tr>"+
				"<td><a href="+cartLink+">Add to Cart</a></td>"+
				"<td><a href="+productLink+">"+pname+"</a></td>"+
				"<td>"+pdesc+"</td>"+
				"<td>"+currFormat.format(price)+"</td>"+
			  "</tr>");

	}
	out.println("</table></body></html>");		
} catch (SQLException ex) {
	out.println(ex);
} 
%>
</body>
</html>