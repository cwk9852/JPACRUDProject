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
<title>Cruddy Tea</title>

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
					<a class="nav-link active" href="home.do">Home</a> <a
						class="nav-link" href="viewTeas.do">Teas</a> <a class="nav-link"
						href="viewCategories.do">Categories</a><a class="nav-link"
						href="addTea.do">Add Tea</a>
				</nav>
			</div>
		</header>
		<main role="main" class="inner cover">
		<h3 class="cover-heading">
			<em>Tea Spotlight</em>
		</h3>
		<p class="lead">
			<img alt="${teas.get(0).img}" src="${teas.get(0).img}" height="250"
				width="250">
		</p>
		<p class="lead">${teas.get(0).name}</p>
		<p class="lead">${teas.get(0).description}</p>
		<p class="lead">
			<a href="findTea.do?id=${teas.get(0).id}"
				class="btn btn-outline btn-secondary">Learn More</a>
		</p>
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
