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
		<legend>Pending Claim Details</legend>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="root" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT pc.*, rd.username, pp.pname, pp.pprice, pp.modelnumber FROM project_part2.claim pc, project_part2.registereddevices rd, project_part2.products pp
				where pc.serialnumber=rd.serialnumber and rd.pid=pp.pid and pc.status='Pending';
        </sql:query>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<caption>Pending Claim List</caption>
				<tr>
					<th>Claim Id</th>
					<th>Claim Date</th>
					<th>Serial Number</th>
					<th>Description</th>
					<th>Username</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Model Number</th>
					<th>Update Status</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.claimid}" /></td>
						<td><c:out value="${row.claimDate}" /></td>
						<td><c:out value="${row.serialnumber}" /></td>
						<td><c:out value="${row.description}" /></td>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.pname}" /></td>
						<td><c:out value="${row.pprice}" /></td>
						<td><c:out value="${row.modelnumber}" /></td>
						<td><a href="update_claim_status.jsp?id=<c:out value="${row.claimid}"/>">Update</a></td>

					</tr>
				</c:forEach>
			</table>
	</fieldset>
	<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
</body>
</html>