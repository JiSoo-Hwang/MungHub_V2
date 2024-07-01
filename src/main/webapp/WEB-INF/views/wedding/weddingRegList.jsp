<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        .content {
            margin: 70px;
        }
        .card {
            margin: 20px;
        }
        img {
			width: 300px;
		}
</style>
<title>${loginUser.name}님의 댕댕이 웨딩플랜 신청 내역입니다</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container mt-3">
		<table class="table">
			<thead>
				<tr>
					<th class="text-center">우리 강아지 이름</th>
					<th class="text-center">상대방 강아지 이름</th>
					<th class="text-center">승인 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty weddingList}">
						<tr>
							<td></td>
							<td class="text-center">신청 내역이 없습니다!<br>
							지금 등록되어있는 강아지들을 보러 가볼까요 (ᐡ-ܫ•ᐡ)?
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="wedList.wd" class="btn btn-success">등록되어있는 강아지들 구경하러 가기</a></td>
							<td></td>
						</tr>
					</c:when>
				</c:choose>
				<!-- 승인 된 예약은 초록색 행으로 출력 -->
				<c:forEach items="${weddingList}" var="w">
					<c:choose>
						<c:when test="${w.approval == 'A' }">
							<tr class="table-success">
								<td class="text-center">${w.petName }</td>
								<td class="text-center">${w.partnerName }</td>
								<td class="text-center" style="color: blue;">승인&ensp; 
								<a class="btn btn-primary" href="detail.wd?weddingNo=${w.weddingNo}">상세보기</a>
								&ensp;<button class="btn btn-secondary cancelApplied">만남취소</button>
								</td>
							</tr>
						</c:when>
						<c:when test="${w.approval == 'W' }">
							<!-- 대기중인 예약은 회색 행으로 출력 -->
							<tr class="table-warning">
								<td class="text-center">${w.petName }</td>
								<td class="text-center">${w.partnerName }</td>
								<td class="text-center">대기중&ensp; 
									<a class="btn btn-primary" href="detail.wd?weddingNo=${w.weddingNo}">상세보기</a>
								&ensp;<a href="updateReg.do?reservNo=${w.weddingNo}" class="btn btn-primary">신청수정</a>&ensp;
								&ensp;<button class="btn btn-secondary cancelBtn">만남취소</button>
									<input type="hidden" value="${w.weddingNo}">
								</td>
							</tr>
						</c:when>
						<c:when test="${w.approval =='R' }">
						<tr class="table-secondary"> 
						<td class="text-center">${w.petName }</td>
						<td class="text-center">${w.partnerName }</td>
						<td class="text-center">만남거절&ensp;
						<a class="btn btn-secondary" href="detail.wd?weddingNo=${w.weddingNo}">상세보기</a>
						 </td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr class="table-secondary"> 
						<td class="text-center">${w.petName }</td>
						<td class="text-center">${w.partnerName }</td>
						<td class="text-center">관리자 승인 대기중&ensp;
						<a class="btn btn-secondary" href="detail.wd?weddingNo=${w.weddingNo}">상세보기</a>
						 </td>
						</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <script>
    $(function() {
		$(".cancelBtn").click(function() {
			if (confirm("정말 만남을 취소하시겠습니까?")) {
				var weddingNo = $(this).siblings(':eq(2)').val();
				console.log(weddingNo);
				/* location.href="deleteReg.do?reservNo="+reservNo; */
			} else {
				return false;
			}
		});
		$(".cancelApplied")click(function () {
			if(confirm("이미 승인된 만남을 취소하시면 웨딩플래너 서비스가 14일간 제한됩니다. 그래도 취소하실건가요8ㅅ8?")){
				var weddingNo = $(this).siblings(':eq(2)').val();
				console.log(weddingNo);
			}
		});
	});
    
    </script>
</body>
</html>