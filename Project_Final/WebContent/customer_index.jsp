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
	
	<font size="5" color='teal'> Welcome, <c:out
			value="${loginUser}" /></font>
			<a href="index.jsp?status=1" class="button" id="logoutButton">Logout</a>
	<br>
	<br>
	
	<fieldset>
		<legend>Your Registered Products and Claim</legend><br>
		<c:set var="status" value="${param.status}" />
		<c:if test="${not empty status}">
			<h3><font color='green'> Registration of product was successful!!</font></h3><br><br>
		</c:if>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="root" />

		<sql:query dataSource="${dbsource}" var="result1">
          					 SELECT rd.serialnumber, rd.pid, pp.pname, pp.pprice, pp.modelnumber, rd.purchasedate 
								FROM project_part2.registereddevices rd, project_part2.products pp 
								where rd.pid=pp.pid and username=?;
								<sql:param value="${loginUser}" />
		</sql:query>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<tr>
					<th>Serial Number</th>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Product Price</th>
					<th>Model Number</th>
					<th>Purchase Date</th>
					<th>Claim Details</th>
					<th>Add New Claim</th>
				</tr>
				<c:forEach var="row1" items="${result1.rows}">
					<tr>
						<td><c:out value="${row1.serialnumber}" /></td>
						<td><c:out value="${row1.pid}" /></td>
						<td><c:out value="${row1.pname}" /></td>
						<td><c:out value="${row1.pprice}" /></td>
						<td><c:out value="${row1.modelnumber}" /></td>
						<td><c:out value="${row1.purchasedate}" /></td>
						<td><sql:query dataSource="${dbsource}" var="result2">
           											 SELECT * FROM project_part2.claim where serialnumber=?;
           											 <sql:param value="${row1.serialnumber}" />
							</sql:query>
							<center>
								<table border="1" width="40%">
									<tr>
										<th>Claim Id</th>
										<th>Claim Date</th>
										<th>Description</th>
										<th>Status</th>
									</tr>
									<c:forEach var="row2" items="${result2.rows}">
										<tr>
											<td><c:out value="${row2.claimid}" /></td>
											<td><c:out value="${row2.claimDate}" /></td>
											<td><c:out value="${row2.description}" /></td>
											<td><c:out value="${row2.status}" /></td>
										</tr>
									</c:forEach>
								</table></td>
								<td><a href="addClaim.jsp?serialnumber=<c:out value="${row1.serialnumber}"/>&amp;pname=<c:out value="${row1.pname}"/>" id="tableButton" class="button">Claim</a></td>
					</tr>
				</c:forEach>
			</table>
			<br><a href="registerDevice.jsp" class="button">Register New Device</a>
	</fieldset>
</body>
</html>