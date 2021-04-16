<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<fieldset>
		<legend>Insert Product</legend>
		<form action="insert_claim.jsp" method="post">
			<table border="0" cellspacing="2" cellpadding="5">
				<thead>
					<tr>
						<th colspan="2">Insert Product</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label>Product Name</label></td>
						<td><input type="text" name="pname" value="${param.pname}" disabled/></td>
					</tr>
					<tr>
						<td><label>Serial Number</label></td>
						<td><input type="text" name="serialnum" value="${param.serialnumber}" disabled/>
						<input type="hidden" name="serialnumber" value="${param.serialnumber}"/>
						</td>
					</tr>
					<tr>
						<td><label>Claim Date</label></td>
						<td><input type="date" name="claimDate" /></td>
					</tr>
					<tr>
						<td><label>Description</label></td>
						<td><input type="text" name="description" /></td>
					<tr>
					<tr>
						<td><input type="submit" value="Save" /></td>
						<td><input type="reset" value="reset" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</fieldset>
</body>
</html>