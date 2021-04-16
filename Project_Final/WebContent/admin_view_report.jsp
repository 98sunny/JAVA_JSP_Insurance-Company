<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
	<fieldset>
		<legend>Generated Report</legend>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="root" />

		<sql:query dataSource="${dbsource}" var="result">
           SELECT username, name, address, phone, email from project_part2.user where usertype="c";
        </sql:query>
		<center>
			<table border="1" width="40%" id="tablestyle">
				<tr>
					<th>User Name</th>
					<th>Name</th>
					<th>Address</th>
					<th>Phone</th>
					<th>Email</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td rowspan="3"><c:out value="${row.username}" /></td>
						<td rowspan="3"><c:out value="${row.name}" /></td>
						<td><c:out value="${row.address}" /></td>
						<td><c:out value="${row.phone}" /></td>
						<td><c:out value="${row.email}" /></td>
					</tr>
					<tr>
						<td colspan="3">Registered Products</td>
					</tr>
					<tr>
						<td colspan="3"><sql:query dataSource="${dbsource}"
								var="result1">
          					 SELECT rd.serialnumber, rd.pid, pp.pname, pp.pprice, pp.modelnumber, rd.purchasedate 
								FROM project_part2.registereddevices rd, project_part2.products pp 
								where rd.pid=pp.pid and username=?;
								<sql:param value="${row.username}" />
							</sql:query>
							<center>
								<table border="1" width="40%">
									<tr>
										<th>Serial Number</th>
										<th>Product ID</th>
										<th>Product Name</th>
										<th>Product Price</th>
										<th>Model Number</th>
										<th>Purchase Date</th>
										<th>Claim Details</th>
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
													</table>
													</td>
										</tr>
									</c:forEach>
								</table></td>
					</tr>
				</c:forEach>
			</table>
	</fieldset>
	</center>
	<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
</body>
</html>