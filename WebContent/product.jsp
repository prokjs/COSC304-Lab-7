<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Ray's Grocery - Product Information</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<%
// Get product name to search for
// TODO: Retrieve and display info for the product
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

try(Connection con = DriverManager.getConnection(url, uid, pw);) {

    String productId = request.getParameter("id");


    String sql = "SELECT * FROM product WHERE productId = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,productId);
    ResultSet rst = pstmt.executeQuery();

    while(rst.next()){
        String prodId= rst.getString(1);
        String productName= rst.getString(2);
        Double productPrice = rst.getDouble(3);
        String productImageURL= rst.getString(4);
        String productImageBinary=rst.getString(5);
        String pnameEncoded = java.net.URLEncoder.encode(productName,"UTF-8").replace("+","%20");
        String cartLink = "addcart.jsp?id="+prodId+"&name="+pnameEncoded+"&price="+productPrice;
        String binaryImage =  "displayImage.jsp?id="+prodId;
        
        out.print("<table>"+
            "<th><h2>"+productName+"</h2></th>"+
            "<tr><td style='text-align:center;' class='pstyle;' colspan = 2><img style='height:250px; width: auto;' src=\""+productImageURL+"\"></td>"+
                "<td style='text-align:center;' class='pstyle;' colspan = 2><img style='height:250px; width: auto;' src=\""+binaryImage+"\"></td></tr>"+
        "<tr>"+
                "<th>Id</th>"+
                "<th>Price</th>"+
            "</tr>");
        
            out.print("<tbody><tr><td align='center'>"+prodId+"</td><td>"+productPrice+"</td></tr>");
        
        
        out.print("</tbody></table>");
        out.print("<h2><a href="+cartLink+">Add to Cart</a></h2>");
        out.print("<h2><a href=listprod.jsp>Continue Shopping</a></h2>");
            }
        con.close();
        
        }
        catch (SQLException ex) { 	
            out.println(ex); 
        }


// TODO: If there is a productImageURL, display using IMG tag
		
// TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.
		
// TODO: Add links to Add to Cart and Continue Shopping
%>
}

</body>
</html>

