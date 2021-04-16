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
       
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/project_part2"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from project_part2.products where pid=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <form action="updatedb_product.jsp" method="post" id="tablestyle">
            <table border="0" width="40%">
                <caption>Update Product</caption>
                <tr>
					<th>Product Name</th>
					<th>Price</th>
					<th>Company</th>
					<th>Model No</th>
					<th>Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.id}" name="pid"/>
                            <input type="text" value="${row.pname}" name="pname"/></td>
                        <td><input type="text" value="${row.pprice}" name="pprice"/></td>
                        <td><input type="text" value="${row.company}" name="company"/></td>
                        <td><input type="text" value="${row.modelnumber}" name="modelnumber"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
           <center><a href="admin_index.jsp" class="button">Go to Main Page</a></center>
        </form>
    </body>
</html>