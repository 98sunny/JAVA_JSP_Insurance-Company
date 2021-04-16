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
		<legend>Search by Product Number</legend>
		<form method="post">
			<tr>
				<td>Product Number :</td>
				<td><input type="text" name="pno" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="Submit" /></td>
			</tr>
		</form>
	</fieldset>
	<br>
	<br>
	<fieldset>
		<legend>Registered Product List</legend>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="root" />

		<c:set var="pno" value="${param.pno}" />
		<c:if test="${not empty pno}">
			<sql:query dataSource="${dbsource}" var="result">
           SELECT rd.serialnumber, rd.username, rd.pid, pp.pname, pp.modelnumber, rd.purchasedate 
			FROM project_part2.registereddevices rd, project_part2.products pp 
				where rd.pid=pp.pid and username=? and rd.pid=?;
           <sql:param value="${param.id}" />
				<sql:param value="${param.pno}" />
			</sql:query>
		</c:if>
		<c:if test="${empty pno}">
			<sql:query dataSource="${dbsource}" var="result">
            SELECT rd.serialnumber, rd.username, rd.pid, pp.pname, pp.modelnumber, rd.purchasedate 
			FROM project_part2.registereddevices rd, project_part2.products pp 
				where rd.pid=pp.pid and username=?;
				<sql:param value="${param.id}" />
        </sql:query>
		</c:if>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<caption>Users</caption>
				<tr>
					<th>Serial Number</th>
					<th>Username</th>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Model Number</th>
					<th>Purchase Date</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.serialnumber}" /></td>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.pid}" /></td>
						<td><c:out value="${row.pname}" /></td>
						<td><c:out value="${row.modelnumber}" /></td>
						<td><c:out value="${row.purchasedate}" /></td>
					</tr>
				</c:forEach>
			</table>
	</fieldset>
	<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
	</center>
</body>
</html>