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
					<a class="nav-link" href="home.do">Home</a> <a
						class="nav-link" href="viewTeas.do">Teas</a> <a class="nav-link"
						href="viewCategories.do">Categories</a><a class="nav-link"
						href="addTea.do">Add Tea</a><a class="nav-link active" href="#">${tea.name}</a>
				</nav>
			</div>
			<c:if test="${ supplier }">
				<h4>Supplier Added</h4>
				<p>Supplier ID: ${supplier.id }</p>
				<p>Supplier Name: ${supplier.name }</p>
			</c:if>
			<c:if test="${ category }">
				<h4>Category Added</h4>
				<p>Category ID: ${category.id }</p>
				<p>Category Name: ${category.name }</p>
			</c:if>
		</header>
		<main role="main" class="inner cover"> <c:if
			test="${! empty tea }">
			<c:if test="${ updated }">
				<h2>Updated</h2>
			</c:if>
			<c:if test="${ deleted }">
				<h2>Deleted</h2>
			</c:if>
			<h2>${tea.name}</h2>
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
				<form action="addReview.do" method="GET">
					<input type="hidden" value="${tea.id }" name="id" /> <input
						type="submit" value="Update Tea" class="btn btn-outline-warning" />
				</form>
				<form action="updateTea.do" method="GET">
					<input type="hidden" value="${tea.id }" name="id" /> <input
						type="submit" value="Update Tea" class="btn btn-outline-warning" />
				</form>
				<form action="deleteTea.do" method="GET">
					<input type="hidden" value="${tea.id }" name="id" /> <input
						type="submit" value="Delete" class="btn btn-outline-danger" />
				</form>
			</c:if>
		</c:if> <c:if test="${! empty categories }">
			<table>
				<tr>
					<th scope="col">Category ID</th>
					<th scope="col">Category Name</th>
					<th scope="col">Category Description</th>
					<th scope="col"></th>
				</tr>
				<c:forEach items="${categories}" var="c">
					<tr>
						<td>${c.id}</td>
						<td>${c.name}</td>
						<td>${c.description}</td>
						<td>
							<form action="findTeasByCategoryId.do" method="GET">
								<input type="hidden" value="${c.id }" name="id" /> <input
									type="submit" class="btn btn-outline-success" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	</main>
</body>
</html>
