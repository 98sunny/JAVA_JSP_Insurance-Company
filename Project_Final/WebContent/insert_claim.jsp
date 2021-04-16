<%@ page
	import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
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
	<sql:query dataSource="${dbsource}" var="result1">
       SELECT * FROM project_part2.claim where serialnumber=?;
								<sql:param value="${param.serialnumber}" />
	</sql:query>
	<c:if test="${result1.rowCount<3}">

		<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO claim(claimDate,serialnumber,description,status) VALUES (?,?,?,?);
            <sql:param value="${param.claimDate}" />
			<sql:param value="${param.serialnumber}" />
			<sql:param value="${param.description}" />
			<sql:param value="Pending" />
		</sql:update>
		<c:if test="${result>=1}">
			<font size="5" color='green'> Congratulations ! Claim applied
				successfully.</font>
			<br>
			<br>
		</c:if>
		<c:if test="${result<1}">
			<font size="5" color='red'> Sorry! Claim was not applied
				successfully!!</font>
			<br>
			<br>
		</c:if>
	</c:if>
	<c:if test="${result1.rowCount==3}">
		<font size="5" color='red'> Sorry! You can only apply upto 3 claims!!</font>
	</c:if>


	<center>
		<a href="customer_index.jsp" class="button">Go to Main Page</a>
	</center>
</body>
</html>