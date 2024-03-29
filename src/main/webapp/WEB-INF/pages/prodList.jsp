<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!-- 	navigation Bar -->
<%@ include file="navbar.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="icon" type="image/x-icon"
	href="<c:url value="/resources/images/favicon1.png"/>" />
<link rel="stylesheet"
	href="<c:url value="../resources/bootstrap/css/bootstrap.min.css"/>">
<script src="<c:url value="../resources/js/jquery.js"/>"></script>
<script src="<c:url value="../resources/bootstrap/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="../resources/css/ProductList.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="../resources/js/productController.js"/>"></script>
</head>
<body ng-app="myapp">
	<div class="container" id="productTable"
		style="width: 1145px; margin-bottom: 180px;">
		<h2>List of available jewelleries</h2>
		<p>The List of Products in our Database</p>
		<table class="table table-hover" id="productList">
			<thead>
				<tr>
					<th>Screen-Shot</th>
					<th>Product Id</th>
					<th>Category</th>
					<th>Product Name</th>
					<th>Products Price</th>
					<th>Stock Unit</th>
					<th>Description</th>
					<th>Manufacturer</th>
					<th>View <security:authorize access="hasAnyRole('ROLE_USER')">/ Add to Cart
					</security:authorize> <security:authorize
							 access="hasAnyRole('ROLE_ADMIN')">/Edit/Delete
					</security:authorize>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prodList}" var="prod">
					<tr>
						<td style="width: 171px"><img
							src="<c:url value="/resources/images/products/${prod.prodId}.jpg"/>"
							style="width: 100px; height: 90px;" ${prod.prodName}"  /></td>
						<td>${prod.prodId}</td>
						<td>${prod.prodCategory}</td>
						<td>${prod.prodName}</td>
						<td>${prod.productPrice}</td>
						<td>${prod.unitStock}</td>
						<td style="width: 180px">${prod.prodDescription}</td>
						<td>${prod.prodManufacturer}</td>
						<td ng-controller="myController"><a
							href="getProductById/${prod.prodId}" class="btn btn-info"
							role="button"> <span class="glyphicon glyphicon-info-sign"></span></a>

							<!-- 						view only for user --> <security:authorize
								 access="hasAnyRole('ROLE_USER')">
								<a href="#" ng-click="addToCart(${prod.prodId})"
									class="btn btn-primary" style="margin-left: 5px"> <span
									class="glyphicon glyphicon-shopping-cart"></span></a>
							</security:authorize><security:authorize
								access="hasAnyRole('ROLE_ADMIN')">
								<a href="admin/product/editProduct/${prod.prodId}"
									class="btn btn-success" style="margin-left: 5px"> <span
									class="glyphicon glyphicon-edit"></span></a>
								<a href="admin/delete/${prod.prodId}" class="btn btn-danger"
									style="margin-left: 5px"> <span
									class="glyphicon glyphicon-trash"></span></a>
							</security:authorize></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>