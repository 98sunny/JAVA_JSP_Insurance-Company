<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<link rel="stylesheet" href="style.css">

<title>Search User</title>
</head>
<body>
	<fieldset>
		<legend>Search User</legend>
		<form method="post">
			<tr>
				<td>UserName :</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="Submit" /></td>
			</tr>
		</form>
	</fieldset>
	<br>
	<br>
	<fieldset>
		<legend>User Accounts</legend>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project" user="root" password="root" />

		<c:set var="username" value="${param.username}" />
		<c:if test="${not empty username}">
			<sql:query dataSource="${dbsource}" var="result">
          		 SELECT username, name, address, phone, email from project_part2.user where usertype="c" and username='${param.username}';
       		 </sql:query>
		</c:if>
		<c:if test="${empty username}">
			<sql:query dataSource="${dbsource}" var="result">
            SELECT username, name, address, phone, email from project_part2.user where usertype="c";
        </sql:query>
		</c:if>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<tr>
					<th>User Name</th>
					<th>Name</th>
					<th>Address</th>					
					<th>Phone</th>
					<th>Email</th>
					<th>View Registered Products</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.name}" /></td>
						<td><c:out value="${row.address}" /></td>
						<td><c:out value="${row.phone}" /></td>
						<td><c:out value="${row.email}" /></td>
						<td><a href="admin_registered_product.jsp?id=<c:out value="${row.username}"/>">View</a></td>
					</tr>
				</c:forEach>
			</table>
	</fieldset>
	<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
	</center>
</body>
</html>