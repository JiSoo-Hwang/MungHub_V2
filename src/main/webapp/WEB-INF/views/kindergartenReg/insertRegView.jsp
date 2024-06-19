<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#regForm td{
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
							<td> <input type="text" name="petName"> </td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>견종</th>
							<td> <select>
							<option></option>
							</select> </td>
						</tr>
						<tr>
							<th>나이</th>
							<td></td>
						</tr>
						<tr>
							<th>성별</th>
							<td></td>
						</tr>
						<tr>
							<th>몸무게</th>
							<td></td>
						</tr>
						<tr>
							<th>필수접종여부</th>
							<td></td>
						</tr>
						<tr>
							<th>방문희망일</th>
							<td></td>
						</tr>
						<tr>
							<th>소개</th>
							<td></td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td></td>
						</tr>
					</tbody>

				</table>

			</form>
		</div>
	</div>
</body>
</html>