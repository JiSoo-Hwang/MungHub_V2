<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container mt-3">
		<table class="table">
			<thead>
				<tr>
					<th>상담 예약 날짜</th>
					<th>상담 견주명(지금은 회원번호)</th>
					<th>강아지 이름(지금은 반려견 번호)</th>
					<th>강아지 견종(지금은 반려견 번호)</th>
					<th>승인 여부</th>
				</tr>
			</thead>
			<tbody>
				<!-- 승인 된 예약은 초록색 행으로 출력 -->
				<c:forEach items="${regList}" var="r">
					<c:choose>
						<c:when test="${r.approval == 'Y' }">
							<tr class="table-success">
								<td>${r.visitDate }</td>
								<td class="kindName">${r.userNo }</td>
								<td>${r.petNo}</td>
								<td>${r.petNo}</td>
								<td style="color: blue;">승인</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 대기중인 예약은 회색 행으로 출력 -->
							<tr class="table-secondary">
								<td>${r.visitDate }</td>
								<td class="kindName">${r.userNo }</td>
								<td>${r.petNo}</td>
								<td>${r.petNo}</td>
								<td>대기중
									<button class="btn btn-secondary">상담거절</button>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>



















