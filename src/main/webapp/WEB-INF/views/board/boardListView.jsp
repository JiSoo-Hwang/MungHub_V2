<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<br><br>
	<div class="board">
        <div class="radio-area">
            <div class="select-radio">
    	        <form action="">
        	        <tr>
            	        <td><input type="radio" id="recency" value="recency"><label for="recency">최신순</label></td>
                	    <td><input type="radio" id="watch" value="watch"><label for="watch">인기순</label></td>
                    	<td><input type="radio" id="recommend" value="recommend"><label for="recommend">댓글순</label></td>
                	</tr>
	            </form>
            </div>
        </div>
		<table border="1" class="borad-area">

			<thead>
			
                <tr>
                    <td colspan="6">
                        <button class="category-area">전체</button>
                    </td>
                    <td>
                        <button class="insert"> 글쓰기</button>
                    </td>
                </tr>
				<tr>
					<th>글 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td> 
					<td>질문</td> 
					<td>강아지 사료 추천좀 해주세요!</td> 
					<td>느그아버지</td> 
					<td>3</td> 
					<td>4</td> 
					<td>2024/06/19</td> 
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		
	
	
	</script>
	


</body>
</html>