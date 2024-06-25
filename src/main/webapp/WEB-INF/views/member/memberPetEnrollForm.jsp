<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="enrollPet.me" method="post" enctype="multipart/form-data">
		<div class="pet-photo">
		</div>
		<div class="pet-info">
				<label for="breed">품종</label>
				<select>
					<option value="">비밀(해당하는 품종이 없거나 믹스견인 경우 선택해 주세요)</option>
					<c:forEach items="${breed}" varStatus="b">
						<option value="${b.breedId}">${b.breedName}</option>
					</c:forEach>
				</select><br>
				<input type="hidden" id="ownerNo" name="ownerNo">
				<label for="petName">이름 : </label>
				<input type="text" id="petName" name="petName"><br>
				<label for="">나이 : </label>
				<input type="range" id="petAge" name="petAge" min="0" step="1" max="18"><br>
				<label for="">성별 : </label>
				<input type="radio" name="petGender" value="M">
				<label for="M">왕자님</label>
				<input type="radio" name="petGender" value="F">
				<label for="F">공주님</label><br>
				<label for="weight">몸무게 : </label>
				<input type="number" id="weight" name="weight"> kg<br>
				<label for="photo">반려견 사진 자랑(1장만!)</label>
				<input type="file" required>
				
				<button type="submit">반려견 등록</button>
		</div>
	</form>
</body>
</html>