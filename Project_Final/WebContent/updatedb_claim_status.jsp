<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body>
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part2"
                           user="root"  password="root"/>
        <sql:update dataSource="${dbsource}" var="count">
           UPDATE project_part2.claim SET status = ? WHERE claimid = ?;
            <sql:param value="${param.status}" />
		<sql:param value="${param.id}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font><br><br>         
        </c:if>
        
        <c:if test="${count<1}">
            <font size="5" color='red'> Sorry! The data cannot be updated!!</font><br><br>
                 
        </c:if>
        <center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
    </body>
</html>