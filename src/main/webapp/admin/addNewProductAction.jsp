<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>



<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
String imageFileName=request.getParameter("imageFileName");
String imageFileName2=request.getParameter("imageFileName2");
String description=request.getParameter("description");



try
{
	Connection con=ConnectionProvider.getConnection();
	
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setString(4,price);
	ps.setString(5,active);
	ps.setString(6,imageFileName);
	ps.setString(7,description);
	ps.setString(8,imageFileName2);
	
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>