<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<link rel="stylesheet" href="style.css">

<title>INSERT Operation</title>
</head>
<body>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part2" user="root"
		password="root" />


	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO products(pname,pprice,company,modelnumber) VALUES (?,?,?,?);
            <sql:param value="${param.pname}" />
		<sql:param value="${param.price}" />
		<sql:param value="${param.company}" />
		<sql:param value="${param.modelNo}" />
	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'> Congratulations ! Data inserted
			successfully.</font><br><br>
	</c:if>
	<c:if test="${result<1}">
		<font size="5" color='red'> Sorry! The Data cannot be inserted!!</font><br><br>
	</c:if>

<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
</body>
</html>