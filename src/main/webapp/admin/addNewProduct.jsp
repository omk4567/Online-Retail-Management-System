<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>


<%
int id=1;
try
{
	Connection con=ConnectionProvider.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{}
%>



<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Description</h3>
<input class="input-style" type="text" name="description" placeholder="Enter Description" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Price</h3>
<input class="input-style" type="number" name="price" placeholder="Enter Price" required>
<hr>
</div>

<div class="left-div">
<h3>Active</h3>
 <select class="input-style" name="active">
 <option value="Yes">Yes</option>
 <option value="No">No</option>
 </select>   
<hr>
</div>

<div class="right-div">
<h3>Image</h3>
<form action="" method="post" enctype="multipart/form-data">
   Select Image :
   <input class="input-style" type="file" name="image" placeholder="insert" required>
   <input  type="text" name="imageFileName" placeholder="Enter Name" required>
    <input  type="text" name="imageFileName2" placeholder="Enter Name" required>
   <input type="submit" value="Add Image">
   <hr>
</form>

</div>
</form>
</body>
<br><br><br>
</body>
</html>