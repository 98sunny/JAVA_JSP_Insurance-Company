<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
	
	<div class="headings">
		<h1>ABC Company</h1>
		<h2>Customer Service Department</h2>
		<h3>Signup your Account</h3>
	</div>
	<div class="container">
		<form method="POST">
		<c:set var="status" value="${param.status}" />
		<c:if test="${not empty status}">
			<font size="5" color='red'> Sorry! Account cannot be created!!</font><br><br>
		</c:if>
			<label for="name">Name :</label> <input type="text" id="name"
				name="name" placeholder="Your name.."> <label for="username">Username
				:</label> <input type="text" id="username" name="username"
				placeholder="Your username.."> <label for="password">Password
				:</label> <input type="password" id="password" name="password"
				placeholder="Your password.."> <label for="phone">Phone
				:</label> <input type="number" id="phone" name="phone"
				placeholder="Your Phone number.."> <label for="email">Email
				:</label> <input type="text" id="email" name="email"
				placeholder="Your email.."> <label for="address">Address
				:</label> <input type="text" id="address" name="address"
				placeholder="Your Address.."> <br>
			<br> <input type="submit" value="Submit">

		</form>

		<a href="index.jsp" class="button">Go Back</a>
		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part2" user="root"
			password="root"></sql:setDataSource>
		<c:if test="${pageContext.request.method=='POST'}">
			<c:catch var="exception">

				<sql:update dataSource="${dbCon}" var="signup">
			INSERT INTO user(username,password,phone,email,name,address,usertype) VALUES (?, ?, ?, ?, ?, ?,'c')
				<sql:param value="${param.username}" />
					<sql:param value="${param.password}" />
					<sql:param value="${param.phone}" />
					<sql:param value="${param.email}" />
					<sql:param value="${param.name}" />
					<sql:param value="${param.address}" />
				</sql:update>

				<c:if test="${signup>=1}">
				  <%
					response.sendRedirect("login.jsp?status=1");
				  %>
			</c:if>
			</c:catch>

			<c:if test="${exception!=null}">
			  <%
				response.sendRedirect("createAccount.jsp?status=0");
			  %>
			</c:if>

			<c:if test="${signup<1}">
			  <%
					response.sendRedirect("createAccount.jsp?status=0");
			  %>
			</c:if>
		</c:if>

		<sql:query dataSource="${dbCon}" var="userInfo">
            SELECT * from user;
        </sql:query>
	</div>
</body>
</html>