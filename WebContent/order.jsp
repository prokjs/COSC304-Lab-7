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
<title>YOUR NAME Grocery Order Processing</title>
</head>
<body>

<% 
// Get customer id
String custId = request.getParameter("customerId");
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

// Determine if valid customer id was entered
// Determine if there are products in the shopping cart
// If either are not true, display an error message


boolean custIdIsInt = true;

try{
	Integer.parseInt(custId); 
}catch(Exception e) {
	custIdIsInt = false;
	out.println("Invalid customer ID. Go back");
}

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

String prodId = request.getParameter("productId");
String quantity = request.getParameter("quantity");
String price = request.getParameter("price");

try(Connection con = DriverManager.getConnection(url, uid, pw);)
{
// Save order information to database
	
	String sql = "Select productId, quantity, price FROM Product";

	// Use retrieval of auto-generated keys.
	PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);			
	ResultSet keys = pstmt.getGeneratedKeys();
	keys.next();
	int orderId = keys.getInt(1);
	


// Insert each item into OrderProduct table using OrderId from previous INSERT
	String sql2 = "INSERT INTO OrderProduct VALUES (?, ?, ?, ?)";

	PreparedStatement pstmt2 = null;
	ResultSet rst2 = null;

	pstmt2 = con.prepareStatement(sql2);
	rst2 = pstmt2.executeQuery();
	pstmt2.setString(1, String.valueOf(orderId));
	pstmt2.setString(2, prodId);
	pstmt2.setString(3, quantity);
	pstmt2.setString(4, price);

	
// Update total amount for order record
}catch (SQLException ex) {
	out.println(ex);
} 
// Here is the code to traverse through a HashMap
// Each entry in the HashMap is an ArrayList with item 0-id, 1-name, 2-quantity, 3-price

/*
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext())
	{ 
		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		String productId = (String) product.get(0);
        String price = (String) product.get(2);
		double pr = Double.parseDouble(price);
		int qty = ( (Integer)product.get(3)).intValue();
            ...
	}
*/

// Print out order summary

// Clear cart if order placed successfully
%>
</BODY>
</HTML>

