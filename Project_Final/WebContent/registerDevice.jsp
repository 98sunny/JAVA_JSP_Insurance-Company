<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" href="style.css">
	<style>
h1, h2, h3 {
	margin: auto;
	text-align: center;
	width: 50%;
	padding: 10px;
}
</style>


	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part2" user="root"
		password="root"></sql:setDataSource>
	<div class="container">
		<h1>ABC Company</h1>
		<h2>Customer Service Department</h2>
		<h3>Register your Product</h3>
		<c:set var="status" value="${param.status}" />
		<c:if test="${not empty status}">
			<h3><font color='red'> Sorry! Unable to register!!</font></h3><br><br>
		</c:if>
		<form method="post">
		
			<label for="serialnumber">Serial Number:</label> <input type="text"
				id="serialnumber" name="serialnumber"
				placeholder="Your Serial number.."> <label for="productid">Product
				Name:</label>

					<sql:query dataSource="${dbCon}" var="result">
    			        SELECT * from products	;
   			      </sql:query>

				<select name="pid">
					<c:forEach var="row" items="${result.rows}">
						<option value="${row.pid}"><c:out value="${row.pname}"/></option>
					</c:forEach>
				</select>
				<br>
				<label for="purchasedate">Purchase Date:</label>
				<input type="date" id="purchasedate" name="purchasedate"
					placeholder="Purchase Date..">
				<br>
				<br>
				<input type="submit" value="Submit">
		</form>
		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="1234"></sql:setDataSource>
		<c:if test="${pageContext.request.method=='POST'}">
			<c:catch var="exception">
				<sql:update dataSource="${dbCon}" var="registerDevice">
			INSERT INTO registereddevices (serialnumber,username,pid,purchasedate) VALUES (?, ?, ?,?)
				<sql:param value="${param.serialnumber}" />
					<sql:param value="${loginUser}" />
					<sql:param value="${param.pid}" />
					<sql:param value="${param.purchasedate}" />

				</sql:update>

				<c:if test="${registerDevice>=1}">
				  <%
					response.sendRedirect("customer_index.jsp?status=1");
				  %>
			</c:if>
			</c:catch>


			<c:if test="${registerDevice<1}">
				  <%
					response.sendRedirect("registerDevice.jsp?status=1");
				  %>
			</c:if>

			<c:if test="${exception!=null}">
				<%
					response.sendRedirect("registerDevice.jsp?status=1");
				  %>
			</c:if>


			<br>
		</c:if>
</body>

</body>
</html>