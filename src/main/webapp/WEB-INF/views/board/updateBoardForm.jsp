<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>수정하기</h2>

			<form id="updateForm" method="post" action="update.bo">
				<input type="hidden" name="boardNo" value="">
				<table align="center">
					<tr>
						<th><label for="title">글제목</label></th>
						<td><input type="text" id="title" class="form-control"
							value="${b.boardTitle}" name="boardTitle" required></td>
					</tr>
					<tr>
						<th><label for="category">카테고리</label></th>
						<td><select id=category name="category">
								<option id="category">라운지</option>
								<option id="category">질문</option>
								<option id="category">정보</option>
						</select></td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td><textarea id="content" class="form-control" rows="10" style="resize: none;" name="boardContent" required>${b.boardContent }</textarea></td>
					</tr>
				</table>
				<br>
				
				<div>
					<button type="submit" class="btn btn-primary">등록하기</button>
					<button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
				</div>
			</form>
		</div>


	</div>
</body>
</html>