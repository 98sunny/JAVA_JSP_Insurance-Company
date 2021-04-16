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
            UPDATE project_part2.products SET pname = ?, pprice=?,company = ?, modelnumber=?
            WHERE pid='${param.pid}'
            <sql:param value="${param.pname}" />
            <sql:param value="${param.pprice}" />
            <sql:param value="${param.company}" />
            <sql:param value="${param.modelnumber}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font><br><br>      
        </c:if>
        <c:if test="${count<1}">
            <font size="5" color='red'> Congratulations ! Data updated
            successfully.</font><br><br>      
        </c:if>
        <center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
    </body>
</html>