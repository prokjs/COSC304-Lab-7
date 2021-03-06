<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>YOUR NAME Grocery Shipment Processing</title>
</head>
<body>
        
<%@ include file="header.jsp" %>

<%

String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}


if(request.getParameter("orderId")!=null){
try (Connection con = DriverManager.getConnection(url, uid, pw);)
{	
	
con.setAutoCommit(false);

String id = request.getParameter("orderId");
	//out.print(id);
		
	String sql = "SELECT orderId, productId, quantity FROM orderproduct WHERE orderId=?";
	PreparedStatement stmt = con.prepareStatement(sql);	
	stmt.setString(1, id);
	ResultSet rst = stmt.executeQuery();
	

	String sql2 = "SELECT productId, warehouseId, quantity FROM productinventory WHERE productId=?";
	PreparedStatement ps = con.prepareStatement(sql2);

	while(rst.next()){
			
		String ordId = rst.getString(1);
		String prodId = rst.getString(2);
		String qt1 = rst.getString(3);

		String prod = rst.getString(1);
		String warId = rst.getString(2);
		String qt = rst.getString(3);

		ps.setString(1, prod);
		ResultSet rst2 = ps.executeQuery();


		while(rst2.next()){
			
		try (Statement stmt1 = con.createStatement();){

		String bought = rst.getString(3);
		int bought2 = Integer.parseInt(bought);
		int storage = rst2.getInt(3);
		
		int newInventory = storage-=bought2;

			if(newInventory >= 0){
				out.print("Ordered product: "+ prodId + " Qty: " + qt1);
				out.println(" Previous inventory: " + rst.getString(3) + " New inventory: " + newInventory + "<br>");
				
				stmt1.executeUpdate("UPDATE productinventory SET quantity="+newInventory+" WHERE productId="+prod+"");
				
				con.commit();

				String sql3 = ("INSERT into shipment (shipmentDate, shipmentDesc, warehouseId) VALUES (?, ?, ?)");
				PreparedStatement statement = con.prepareStatement(sql3);
				Calendar cal = Calendar.getInstance();
				java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
				statement.setTimestamp(1, timestamp);
				statement.setString(2, "description");
				statement.setInt(3, 1);
				statement.executeUpdate();

			}else{
				out.print("Shipment not done. Insufficient inventory for product id: " + rst.getString(2)+"<br>");
				con.rollback();
		} 
	}catch (SQLException ex){out.println(ex);}
		
	}
}	
	//Return auto commit to true
	con.setAutoCommit(true);
	
	//Close connection
	con.close();
}
	catch (SQLException ex){ out.println(ex); }
}
	else{ out.print("Invalid Order ID"); }

%>
                       				

<h2><a href="shop.html">Back to Main Page</a></h2>

</body>
</html>
	// TODO: Get order id

          
	// TODO: Check if valid order id
	
	// TODO: Start a transaction (turn-off auto-commit)
	
	// TODO: Retrieve all items in order with given id
	// TODO: Create a new shipment record.
	// TODO: For each item verify sufficient quantity available in warehouse 1.
	// TODO: If any item does not have sufficient inventory, cancel transaction and rollback. Otherwise, update inventory for each item.
	
	// TODO: Auto-commit should be turned back on
%>                       				

