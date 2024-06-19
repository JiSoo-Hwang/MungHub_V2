<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUNGHUBSHOP</title>
<style>
.review-star>svg{
fill: #F2D106;
}
.dl-table-group{
width:100%;
display: table;
table-layout: fixed;
border-top : 1px solid #EDEDED;
margin-top : 20px;
padding-top : 8px;
}
.dl-row{
display: table-row;
}
.dl-table-group .dl-row > dt {
    display: table-cell;
    vertical-align: top;
    width: 100px;
    padding: 12px 0;
    color: #666;
}
.dl-table-group .dl-row > dd {
    display: table-cell;
    position: relative;
    vertical-align: top;
    padding: 12px 0;
    color: #333;
}


</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
	<div class="row gx-4 gx-lg-5 align-items-center">
	<div class="col-md-6">
		<img class="card-img-top mb-5 mb-md-0" src="${p.attachment }">
	</div>
	<div class="col-md-6">
	<h1 class="display-5 fw-bolder">${p.productName} </h1>
	<div class="fs-5 mb-3 mb-5"><h3><del style="color:gray"><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price}" />원</del></h3>
	<h2><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.price -(p.price/p.discount)}" />원 
	<strong style="color:rgb(250, 58, 14)">${p.discount }%</strong></h2>
	
	<!-- 별점 -->
	<span class="review-star">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-half" viewBox="0 0 16 16">
  <path d="M5.354 5.119 7.538.792A.52.52 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.54.54 0 0 1 16 6.32a.55.55 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.5.5 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.6.6 0 0 1 .085-.302.51.51 0 0 1 .37-.245zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.56.56 0 0 1 .162-.505l2.907-2.77-4.052-.576a.53.53 0 0 1-.393-.288L8.001 2.223 8 2.226z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
</svg></span>
<span>(<fmt:formatNumber type="number" maxFractionDigits="0" value="${p.reviewCount }" />)</span>
	<div>
	
	</div>
	</div>
	<div class="d-flex justify-content-end">
	<input class="form-control text-center me-3" id="inputQuantity" type="number" min="1" value="1" style="max-width: 3rem">
	&nbsp;&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-plus-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0M8.5 8a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V12a.5.5 0 0 0 1 0v-1.5H10a.5.5 0 0 0 0-1H8.5z"/>
</svg>&nbsp; 장바구니 추가
	</button>
	&nbsp;
	<button class="btn btn-outline-dark flex-shrink-0" type="button">
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
</svg>
	</button>
	</div>
	<div class="dl-table-group">
	<dl class="dl-row">
	<dt>판매량</dt>
	<dd><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.salesConunt}" /></strong></dd>
	</dl>
	<dl class="dl-row">
	<dt>배송안내</dt>
	<dd>
	<div class="div-way-box-v2">
	<h4>무료배송</h4>
	<p>30,000원이상 구매 시 무료 배송(기본배송료 2,500원)</p>
	<h4>추가비용 지역</h4>
	<p>제주도 추가 배송비 1,500원</p>
	</div>
	</dd>
	</dl>
	<dl class="dl-row">
	<dt>적립혜택</dt>
	<dd><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${(p.price -(p.price/p.discount))/100}" />P</strong> 적립</dd>
	</dl>
	</div>
	</div>
	</div>
	</div>
</section>
<hr>

<br> <br>
</body>
</html>