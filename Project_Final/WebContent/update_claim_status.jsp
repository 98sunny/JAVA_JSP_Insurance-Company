<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<form action="updatedb_claim_status.jsp?id=${param.id}" method="post">
		<table>
			<tr>
				<td>Status :</td>
				<td><select name="status">
						<option value="Approved">Approved</option>
						<option value="Rejected">Rejected</option>
				</select>
				</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Update"/></td>
				</tr>
				<center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
	</form>
</body>
</html>