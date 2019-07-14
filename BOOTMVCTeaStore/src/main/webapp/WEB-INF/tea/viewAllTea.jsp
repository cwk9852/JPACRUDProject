<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="generator" content="Jekyll v3.8.5">
<title>Cruddy Tea Inventory</title>

<link
	href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://getbootstrap.com/docs/4.3/examples/cover/cover.css">
</head>
<body class="text-center">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="masthead mb-auto">
			<div class="inner">
				<h3 class="masthead-brand">Cruddy Tea</h3>
				<nav class="nav nav-masthead justify-content-center">
					<a class="nav-link" href="home.do">Home</a> <a
						class="nav-link active" href="viewTeas.do">Teas</a>
					<!-- <a
						class="nav-link" href="viewCategories.do">Categories</a> -->
					<a
						class="nav-link" href="addTea.do">Add Tea</a>
				</nav>
			</div>
		</header>

		<main role="main" class="inner cover"> <c:choose>
			<c:when test="${! empty teas}">
				<table>
					<tr>
						<th scope="col">Tea ID</th>
						<th scope="col">Name</th>
						<th scope="col"></th>
						<th scope="col">Description</th>
						<th scope="col">Details</th>
					</tr>
					<c:forEach items="${teas}" var="p">
						<tr>
							<td>${p.id}</td>
							<td>${p.name}</td>
							<td><img src="${p.img}" alt="${p.name}" height="100"
								width="100"></td>
							<td>${p.description }<br></td>
							<td>
								<form action="findTea.do" method="GET">
									<input type="hidden" value="${p.id }" name="id" /> <input
										type="submit" value="Details" class="btn btn-outline-success" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<h2>tea List Not Found</h2>
			</c:otherwise>
		</c:choose> </main>
		<footer class="mastfoot mt-auto">
			<div class="inner">
				<p>
					Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>,
					by <a href="https://twitter.com/mdo">@mdo</a>.
				</p>
				<form class="nav-link" action="findTea.do" method="GET">
					<input type="text" name="id" placeholder="Find Tea by ID" /> <input
						type="submit" value="Find Tea" class="btn btn-outline-success" />
				</form>
			</div>
		</footer>
	</div>
</body>
</html>
