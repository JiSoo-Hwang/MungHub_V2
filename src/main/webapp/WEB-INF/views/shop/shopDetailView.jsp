<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
	<div class="row gx-4 gx-lg-5 align-items-center">
	<div class="col-md-6">
		<img class="card-img-top mb-5 mb-md-0" src="/pjtMungHub/resources/shopFile/16-ageing-12-b1-ne.jpg">
	</div>
	<div class="col-md-6">
	<h1 class="display-5 fw-bolder">${p.productName} </h1>
	<div class="fs-5"><h3><del style="color:gray"><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price}" />원</del></h3>
	<h2><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price -(p.price/p.discount)}" />원 
	&nbsp; <strong style="color:rgb(250, 58, 14)">${p.discount }%</strong></h2>
	<div>
	
	</div>
	</div>
	</div>
	</div>
	</div>
</section>


<br> <br>
</body>
</html>