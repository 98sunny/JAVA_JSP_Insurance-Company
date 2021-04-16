<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="style.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login to our app</title>
</head>
<body>
	<div class="w3-container">
		<h1>ABC Company</h1>
		<h2>Customer Service Department</h2>
		<h1>Please login</h1>

		<form action="loginAuthenticate.jsp">
			<c:set var="status" value="${param.status}" />
			<c:if test="${not empty status}">
				<font size="5" color='green'>Your account was created
					successfully! Please Login</font>
				<br>
				<br>
			</c:if>
			<c:set var="error" value="${param.error}" />
			<c:if test="${not empty error}">
				<font size="5" color='red'>Invalid Username or Password</font>
				<br>
				<br>
			</c:if>
			<label for="username">Username:</label> <input type="text"
				name="username" /><br /> <label for="password">Password:</label> <input
				type="password" name="password" /><br ><br>
							<input type="submit" value="Login" />
			
			<br>
			<br>
			<br>

				<center><a href="index.jsp" class="button">Home</a></center>
		</form>
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font>
</body>
</html>