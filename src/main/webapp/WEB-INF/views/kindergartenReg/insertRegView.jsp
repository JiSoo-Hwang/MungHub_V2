<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${kindergarten.kindName}등록상담신청 페이지 입니다</title>
<style>
.content {
	background-color: white;
	width: 80%;
	margin: auto;
	width: 80%;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	margin: auto;
	padding: 5% 10%;
	background-color: lightgray;
}

#regForm td {
	width: 100px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
		<div class="innerOuter">
			<form action="">
				<table id="regForm" border="1">
					<thead>
						<tr>
							<th>이름</th>
							<td><input type="text" name="petName"
								value="${pet.petName }" readonly></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>견종</th>
							<td><input type="text" name="breed" value="${pet.breed }"
								readonly></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input type="text" name="petAge" value="${pet.petAge }"
								readonly></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><c:choose>
									<c:when test="${pet.petGender eq 'F' }">
							공주님
							</c:when>
									<c:otherwise>
							왕자님
							</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th>몸무게</th>
							<td>${pet.weight }</td>
						</tr>
						<tr>
							<th>필수접종여부</th>
							<td>
								<ul>
									<li><input type="radio" id="vac1"> <label
										for="vac1">접종1</label></li>
									<li><input type="radio" id="vac1"> <label
										for="vac1">접종2</label></li>
									<li><input type="radio" id="vac1"> <label
										for="vac1">접종3</label></li>
									<li><input type="radio" id="vac1"> <label
										for="vac1">접종4</label></li>
									<li><input type="radio" id="vac1"> <label
										for="vac1">접종5</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>방문희망일</th>
							<td><input type="date" name=""></td>
						</tr>
						<tr>
							<th>소개</th>
							<td><textarea rows="4" cols="30"></textarea></td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td> <textarea rows="4" cols="30"></textarea> </td>
						</tr>
					</tbody>

				</table>

			</form>
		</div>
	</div>
</body>
</html>