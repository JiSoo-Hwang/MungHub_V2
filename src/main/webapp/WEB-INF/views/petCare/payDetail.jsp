<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .order-completion {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .order-header {
            font-size: 20px;
            font-weight: bold;
            color: green;
            margin-bottom: 20px;
        }
        .order-info, .order-details, .payment-info {
            margin-bottom: 20px;
        }
        .order-info p, .order-details p, .payment-info p {
            margin: 0;
        }
        .order-summary {
            font-size: 18px;
            font-weight: bold;
        }
        .btn-order-details {
            background-color: #E0F7FA;
            color: #007BFF;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-order-details:hover {
            background-color: #B2EBF2;
        }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<h2>결제내역 페이지</h2>
	
	  <div class="container order-completion">
        <div class="order-header text-center">주문 완료 되었습니다</div>
        <div class="order-info">
            <p><strong>주문번호:</strong> ${p.paymentId }</p>
            <p>견주님 성함<strong>${p.userName }</strong></p>
            <p>펫시터가 연락드릴 번호<strong>${p.phone }</strong></p>
            <p>방문주소<strong>${p.address }</strong></p>
            <p>방문 예정일:<strong>로그인 후 넣을예정</strong></p>
        </div>
        <div class="order-summary">
            <p><strong>주문금액:</strong> ${p.amount }</p>
            <p><strong>쿠폰할인:</strong> 0원</p>
        </div>
        <div class="payment-info">
            <p><strong>결제상세:</strong></p>
            <p>결제방법<strong>${p.paymentMethod }</strong></p>
            <p>결제일<strong>${p.paymentDate }</strong></p>
        </div>
        <div class="text-center">
            <button class="btn-order-details" onclick="location.href='/pjtMungHub/'">메인으로 돌아가기</button>
        </div>
    </div>

</body>
</html>