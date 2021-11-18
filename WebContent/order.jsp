<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>CJLR Grocery Order Processing</title>
</head>
<body>

<% 
// Get customer id
String custId = request.getParameter("customerId");
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

//Check if customerId is Integer
boolean custIdIsInt = true;
try{
	Integer.parseInt(custId); 
}catch(Exception e) {
	custIdIsInt = false;
	out.println("Invalid customer ID. Go back");
}

//Check if there are products in the shopping cart
boolean isCartEmpty = true;
int x = productList.size();
try{
	double y = 1/x; //Divide by 0 if empty
}catch(Exception e){
	isCartEmpty = false;
	out.println("Your cart is empty");
}

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

//Check JDBC Driver
try
{	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}catch (java.lang.ClassNotFoundException e) 
{
out.println("ClassNotFoundException: " +e);
}

try(Connection con = DriverManager.getConnection(url, uid, pw);)
{
	//Match the input customerId to the one in the DDL
	String sql = "Select * FROM Customer WHERE customerId = ?";
	PreparedStatement prepstat = con.prepareStatement(sql);
	prepstat.setString(1, custId);
	ResultSet rst = prepstat.executeQuery();

	if(rst.next() & productList != null) {
		//Insert values into OrderSummary
		Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
		String sqlInsertOrder = ("INSERT INTO ordersummary (totalAmount, customerId) VALUES (?,?)");
		PreparedStatement prepstat2 = con.prepareStatement(sqlInsertOrder, Statement.RETURN_GENERATED_KEYS);
		prepstat2. setDouble(1,0.0); //Initialize as 0
		prepstat2.setString(2,custId);
		prepstat2.executeUpdate();

		ResultSet keys = prepstat2.getGeneratedKeys();
		keys.next();
		int orderId = keys.getInt(1);
		double total = 0.0;
		out.println("<h2>Your Order Summary</h2>");
		out.print("<table><thead><tr>"+
			"<th>Product Id</th>"+
			"<th>Product Name</th>"+
			"<th>Quantity</th>"+
			"<th>Price</th>"+
			"<th>Total</th>"+
		"</tr></thead><tbody>");
		

	while (iterator.hasNext())
	{ 
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		String productId = (String)product.get(0);
		String productName = (String)product.get(1);
		String price = (String)product.get(2);
		double pr = Double.parseDouble(price);
		int prodId = Integer.parseInt(productId);
		int prodQuant = ((Integer)product.get(3)).intValue();
		double Total = (pr*prodQuant);
		
		total = total + Total;
		
		out.print("<tr>"+
						"<td>"+productId+"</td>"+
						"<td>"+productName+"</td>"+
						"<td>"+prodQuant+"</td>"+
						"<td>"+pr+"</td>"+
						"<td>"+total+"</td>"+
						"</tr>");	
		
		// Insert products into orderProduct
		String insertOrderProductSQL = "INSERT Orderproduct (orderId, productId, quantity, price) VALUES(?, ?, ?, ?)";
		PreparedStatement pstInsert = con.prepareStatement(insertOrderProductSQL);
		pstInsert.setInt(1, orderId);
		pstInsert.setInt(2, prodId);
		pstInsert.setInt(3, prodQuant);
		pstInsert.setDouble(4, pr);
		pstInsert.executeUpdate();
		
	}

	//Update orderSummary to new amount
	String sqlUpdateAmount = "UPDATE ordersummary SET totalAmount = ? WHERE orderId = ?";
	PreparedStatement pstmtUpdateAmount = con.prepareStatement(sqlUpdateAmount);
	pstmtUpdateAmount.setDouble(1, total);
	pstmtUpdateAmount.setInt(2, orderId);
	pstmtUpdateAmount.executeUpdate();

	}

if(productList!=null)
{
	productList.clear(); //Clear Product List
}
session.invalidate(); 

con.close(); //Close connection
}catch (SQLException ex) {
	out.println(ex);
} 

%>
</BODY>
</HTML>

