<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MUNGHUBSHOP</title>
<style>
.order-info{
font-size: 20px;
font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="jumbotron">
		<div class="container" >
			<h2>장바구니</h2>
		</div>
	</div>
	<div class="container">
		<form action="/pjtMungHub/order.sp" method="post">
		<input type="hidden" name="userNo" value="${loginUser.userNo }"> 
	<div align="center">
		<p class="order-info">주문자 정보</p>
		<div class="order-info-content">
			<span><i class="bi bi-person-circle"></i> ${loginUser.name }</span>
			<span> | </span>
			<span><i class="bi bi-telephone"></i> ${loginUser.phone }</span>
		</div>
		<div align="right"><button class="btn btn-outline-secondary" type="button"><i class="bi bi-truck"></i> 배송지 정보수정</button></div>
		<div align="center">
			<label for="address">주소</label><input type="text" id="address" name="address" readonly> <br>
			<label for="address-detail">상세주소</label><input type="text" id="address-detail" name="address-detail" readonly><br>
			<label for="postNo">우편번호</label><input type="text" id="postNo" name="postNo" readonly>
		</div>
	</div>
			<table width="100%" style="margin: 10px">
				<tr>
					<td align="right">
						<button class="btn btn-outline-dark flex-shrink-0"
							type="button" onclick="removeItems();">
							<i class="bi bi-trash2-fill"></i> 카트비우기
						</button>
						<button id="order" class="btn btn-outline-dark flex-shrink-0"
							type="submit">
							<i class="bi bi-credit-card-fill"></i> 주문하기
						</button>
					</td>
				</tr>
			</table>
			<script>
 		$(function(){
 			
 			shoppingList();
 		});
 			
 			function removeItems(){
 				var arr = [];
 					$('input[name=chooseOrNot]:checked').each(function(index){
 					arr.push($(this).val());
 				});
 				$.ajax({
 					url: "/pjtMungHub/removeCartItem.sp",
 					type: "post",
 				    traditional: true, /* 배열 넘기는 ajax 옵션 */
 					data : { 
 						items : arr,
 						userNo : ${loginUser.userNo}
 					},
 					success : function(result){
 						shoppingList();
 					},
 					error : function(){
 						console.log("통신오류");
 					}
 					
 					
 				});
 			}
 			
 				

 		function deleteItem(num){
 			var arr = [num];
 		$.ajax({
				url: "/pjtMungHub/removeCartItem.sp",
				type: "post",
			    traditional: true, /* 배열 넘기는 ajax 옵션 */
				data : { 
					items : arr,
					userNo : ${loginUser.userNo}
				},
				success : function(result){
					shoppingList();
				},
				error : function(){
					console.log("통신오류");
				}
		});
 		}
 		
 		function updateAmount(pNo,uNo,aNo){
 			
 			
 
 			$.ajax({
 				url : "updateCartAmount.sp",
 				type : "post",
 				data : {productNo : pNo,
 						userNo : uNo,
 						amount : aNo },
 				success : function(result){
 					shoppingList();
 				},
 				error : function(){
 					console.log("통신오류");
 				}
 				
 			});
 		}
 		
 		function shoppingList(){
 			
 			$.ajax({
 				url : "cartList.sp",
 				data : {
 					userNo : ${loginUser.userNo}
 				},
 				success : function(result){
 					var str = "";
 					var finalPrice= 0;
 					for(var i in result){
 						
 						var productNo = result[i].productNo;
 						var productName = result[i].productName;
 						var img = result[i].img;
 						var amount = result[i].amount;
 						var totalPrice = (result[i].price-(result[i].price/result[i].discount))*result[i].amount;
 						var price = (result[i].price-(result[i].price/result[i].discount));
 						finalPrice+=totalPrice;
 						str +="<tr>"
							+"<td><input class='form-check-input' type='checkbox'"
							+"name='chooseOrNot' checked value='"+productNo+"'></td>"
							
							+"<td><a href='/pjtMungHub/detail.sp/"+productNo+"'>"+productName
							+"<img src='"+img+"'></a></td>"
							
							+"<td>"+price.toLocaleString('ko-KR')+" 원</td>"
							+"<td><div class='btn-group' role='group' aria-label='amount'>"
							+"<button class='btn btn-dark' type='button' onclick='updateAmount("+productNo+","+${loginUser.userNo}+","+-1+");' ><i class='bi bi-dash-square'></i></button>"
							+"<button class='btn btn-outline-dark' type='button' disabled>"+amount.toLocaleString('ko-KR')+"</button>" 
							+"<button class='btn btn-dark' type='button' onclick='updateAmount("+productNo+","+${loginUser.userNo}+","+1+");' ><i class='bi bi-plus-square'></i></button>"
							+"</div>"
							+"</td>"
							+"<td>"+totalPrice.toLocaleString('ko-KR')+" 원</td>"
							+"<td><button class='btn btn-outline-dark flex-shrink-0' type='button'"
							+"onclick='deleteItem("+productNo+");'>"
							+"<i class='bi bi-trash3-fill'></i></button></td>"
							+"</tr>"
 					}
 					str+="<tr><td colspan=6 align='right'>총합 : "+finalPrice.toLocaleString('ko-KR')+"</td></tr>"
 					$("#shoppingList tbody").html(str);
 				},
 				error : function(){
 					console.log("통신오류");
 				}
 			});
 		}
 	</script>

			<div style="padding-top: 50px">
				<table id="shoppingList" class="table table-hover">
					<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">상품</th>
						<th scope="col">가격</th>
						<th scope="col">수량</th>
						<th scope="col">소계</th>
						<th scope="col">비고</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				
			</div>
		</form>
	</div>
</body>
</html>