<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${loginUser.name } 원장님의 상담 신청 내역입니다</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container mt-3">
		<table class="table">
			<thead>
				<tr>
					<th>상담 견주명</th>
					<th>강아지 이름</th>
					<th>강아지 견종</th>
					<th>상담 예약 날짜</th>
					<th>승인 여부</th>
				</tr>
			</thead>
			<tbody>
				<!-- 승인 된 예약은 초록색 행으로 출력 -->
				<c:forEach items="${regList}" var="r">
					<c:choose>
						<c:when test="${r.approval == 'Y' }">
							<tr class="table-success">
								<td class="kindName">${r.userName }</td>
								<td>${r.petName}</td>
								<td>${r.breed}</td>
								<td>${r.visitDate }</td>
								<td style="color: blue;">승인</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 대기중인 예약은 회색 행으로 출력 -->
							<tr class="table-secondary">
								<td class="userName">${r.userName }</td>
								<td>${r.petName}</td>
								<td>${r.breed}</td>
								<td>${r.visitDate }</td>
								<td>대기중
									<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">상세보기</button>
								</td>
							</tr>
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">

    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">${r.userName }님의 ${r.petName} 등록 상담요청입니다</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창닫기</button>
        <button type="submit" class="btn btn-danger">상담거절하기</button>
      </div>

    </div>
  </div>
</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
	$(".reject").click(function () {
		
		var ownerNo = $(this).parent().siblings(':eq(1)').text();

	});
	</script>
</body>
</html>



















