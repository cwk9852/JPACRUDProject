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
<title>Cruddy Tea: ${tea.name}</title>

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

					<a class="nav-link" href="home.do">Home</a> <a class="nav-link"
						href="viewAllTea.do">View Teas</a>
					<c:if test="${! empty categories }"></c:if>
					<a class="nav-link " href="viewCategories.do">Categories</a> <a
						class="nav-link" href="#">${tea.name}</a>
				</nav>
			</div>
		</header>
		<main role="main" class="inner cover"> <c:if
			test="${ updated }">
			<h2>Updated</h2>
		</c:if> <c:if test="${ deleted }">
			<h2>Deleted</h2>
		</c:if> <c:if test="${! empty supplier }">
			<h4>Supplier Added</h4>
			<p>Supplier ID: ${supplier.id }</p>
			<p>Supplier Name: ${supplier.name }</p>
		</c:if> <c:if test="${! empty category }">
			<h4>Category Added</h4>
			<p>Category ID: ${category.id }</p>
			<p>Category Name: ${category.name }</p>
		</c:if> <c:if test="${! empty categories }">
			<table>
				<tr>
					<th scope="col">Category ID</th>
					<th scope="col">Category Name</th>
					<th scope="col"></th>
					<th scope="col">Category Description</th>
					<th scope="col"></th>
				</tr>
				<c:forEach items="${categories}" var="c">
					<tr>
						<td>${c.id}</td>
						<td>${c.name}</td>
						<td><img src="" alt="${p.name}" height="100" width="100"></td>
						<td>${c.description }<br></td>
						<td>
							<form action="findTeasByCategory.do" method="GET">
								<input type="hidden" value="${p.id }" name="id" /> <input
									type="submit" value="View Teas" class="btn btn-outline-success" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if> <c:if test="${! empty tea }">
			<h2>${tea.name}</h2>
			<div>
				<p>Price: $${tea.price}</p>
				<img alt="" src="${tea.img}" height="250" width="250">
				<h4>Description:</h4>
				<p>${tea.description}</p>
				<p>Quantity In Stock: ${tea.qty} kg</p>
				<h4>Categories:</h4>
				<c:forEach items="${tea.categories}" var='c'>
				${c.name}
			</c:forEach>
				<br>
				<h4>Reviews:</h4>
				<c:forEach items="${tea.reviews}" var='r'>
				Review Title: ${r.title}
				Review: ${r.review}
				Rating: ${r.rating}
				<br>
				</c:forEach>
				<h4>Suppliers:</h4>
				<c:forEach items="${tea.suppliers}" var='s'>
				${s.name}
				<br>
				</c:forEach>
				<br>
				<c:if test="${! deleted}">
					<form action="updateTea.do" method="GET">
						<input type="hidden" value="${tea.id }" name="id" /> <input
							type="submit" value="Update Tea" class="btn btn-outline-success" />
					</form>
					<form action="deleteTea.do" method="GET">
						<input type="hidden" value="${tea.id }" name="id" /> <input
							type="submit" value="Delete" class="btn btn-outline-danger" />
					</form>
				</c:if>
		</c:if>
	</div>
	</main>

	<footer class="mastfoot mt-auto">
		<div class="inner">
			<form class="nav-link" action="findTea.do" method="GET">
				<input type="text" name="id" placeholder="Find by Tea ID" /> <input
					type="submit" value="Find Tea" class="btn btn-outline-success" />
			</form>
			<p>
				Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>,
				by <a href="https://twitter.com/mdo">@mdo</a>.
			</p>
		</div>
	</footer>
	</div>
</body>
</html>
