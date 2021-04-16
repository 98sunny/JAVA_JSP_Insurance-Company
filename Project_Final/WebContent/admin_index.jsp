<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>ABC Company</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

h1,h2,h3{
margin: auto;
text-align:center;
  width: 50%;
 padding: 10px;}
</style>
</head>
<body>


<div class="w3-container">
<h1>ABC Company</h1>
<h2>Admins Section</h2>
<h3>Choose from below</h3>
<a href="admin_user_search.jsp"><p><button class="w3-button w3-block w3-teal">Search Users</button></p></a>
 <a href="admin_product_list.jsp"><p><button class="w3-button w3-block w3-red">Modify Product Lists</button></p></a>
<a href="admin_view_claim.jsp"><p><button class="w3-button w3-block w3-indigo">View Pending Claims</button></p></a>
<a href="admin_view_report.jsp"><p><button class="w3-button w3-block w3-yellow">View Report</button></p></a>



</div>

</body>
</html>