<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUNGHUBSHOP</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h2>장바구니</h2>
	</div>
</div>
 <div class="container">
 	<table width="100%" style="margin:10px">
 		<tr>
 			<td align="right">
 			<button>카트비우기</button>
 			<button>주문하기</button>
 			</td>
 		</tr>
 	</table>

 <div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th></th>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<c:forEach items="${cList}" var="c">
					<tr>
				<td></td>
				<td><a href="detail.sp/${c.productNo }">${productName }</a></td>
				<td>${c.price }</td>
				<td>${c.amount }</td>
				<td>${c.price*c.amount }</td>
				<td></td>
				</tr>
				</c:forEach>
			
 </table>
 </div>
  </div>
</body>
</html>