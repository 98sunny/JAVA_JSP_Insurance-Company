<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">

<meta charset="ISO-8859-1">
<title>Product list</title>
</head>
<body>
	<fieldset>
		<legend>Insert Product</legend>
		<form action="insert_product.jsp" method="post">
			<table border="0" cellspacing="2" cellpadding="5">
				<thead>
					<tr>
						<th colspan="2">Insert Product</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label>Product Name</label></td>
						<td><input type="text" name="pname" /></td>
					</tr>
					<tr>
						<td><label>Price</label></td>
						<td><input type="text" name="price" /></td>
					</tr>
					<tr>
						<td><label>Company</label></td>
						<td><input type="text" name="company" /></td>
					</tr>
					<tr>
						<td><label>Model No</label></td>
						<td><input type="text" name="modelNo" /></td>
					<tr>
					<tr>
						<td><input type="submit" value="Save" /></td>
						<td><input type="reset" value="reset" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</fieldset>
	<fieldset>
		<legend>Product Details</legend>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root" password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from project_part2.products;
        </sql:query>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<caption>Product List</caption>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Company</th>
					<th>Model No</th>
					<th colspan="2">Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.pid}" /></td>
						<td><c:out value="${row.pname}" /></td>
						<td><c:out value="${row.pprice}" /></td>
						<td><c:out value="${row.company}" /></td>
						<td><c:out value="${row.modelnumber}" /></td>
						<td><a
							href="update_product.jsp?id=<c:out value="${row.pid}"/>">Update</a></td>

					</tr>
				</c:forEach>
			</table>
	</fieldset>
	<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
</body>
</html>