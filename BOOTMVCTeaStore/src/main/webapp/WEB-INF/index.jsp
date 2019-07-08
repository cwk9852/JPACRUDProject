<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOOTMVCSITE</title>
</head>
<body>
	<form action="getProduct.do" method="GET">
		Film ID: <input type="text" name="pid" /> <input type="submit"
			value="Get Product" />
		<hr>
		<c:forEach var="p" items="${products}">
			<li><a href="getProduct.do?fid=${p.id }">${p.name }</a></li>
		</c:forEach>
	</form>
</body>
</html>