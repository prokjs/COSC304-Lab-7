<!DOCTYPE html>
<html>
<head>
        <title>Ray's Grocery Main Page</title>
</head>
<body>
<h1 align="center">Welcome to Ray's Grocery</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>

<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>

<%
// TODO: Display user name that is logged in (or nothing if not logged in)	
%>
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
try (Connection con=DriverManager.getConnection(url, uid, pw); Statement stmt = con.createStatement();)
{
  String userName = (String) session.getAttribute("authenticatedUser");
  userName = "\'"+userName+"\'";
  
  String sql = "SELECT firstName FROM customer WHERE userid="+userName;
  PreparedStatement ps = con.prepareStatement(sql);
  ResultSet rst = ps.executeQuery();
  
  if(rst.next())  {
    out.print(rst.getString(1));
  }
  
} 
catch (SQLException ex){ 	
  out.println(ex); 
}

%>
</body>
</head>


