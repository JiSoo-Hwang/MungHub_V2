<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #boardList {text-align:center;}
        #boardList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}
        
    </style>
	</head>
	<body>
    
    <%@include file="../common/header.jsp" %>

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <hr>
            <nav>
            <ul>
	            <li id="category-area">전체</li>
	            <li id="category-area"></li>
            </ul>
            </nav>
            <hr>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
           <!--  
           <c:if test="${not empty loginUser}">
            </c:if>
           
           --> 
	            <a class="btn btn-secondary" style="float:right;" href="insert.bo">글쓰기</a>
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                   
                   
                   <c:choose>
                   		<c:when test="${empty list}">
                   			<tr>
                   				<td colspan='6'>조회된 게시글이 없습니다.</td>
                   			</tr>
                   		</c:when>
                   		<c:otherwise>
                   			<c:forEach items="${list}" var="b">
	                   			<tr>
			                        <td>${b.boardNo }</td>
			                        <td>${b.boardTitle }</td>
			                        <td>${b.boardWriter }</td>
			                        <td>${b.count }</td>
			                        <td>${b.uploadDate }</td>
			                        
	                  			 </tr>
                   			</c:forEach>
                   		
                   		</c:otherwise>
                   </c:choose>
                
                </tbody>
            </table>
            <br>
            
            <script>
            	//글을 클릭했을때 해당 글을 상세보기 할 수 있는 함수 작성 
            	$(function(){
            		
            		$("#boardList tbody>tr").click(function(){
            			
            			//글번호 추출
            			var bno =  $(this).children().first().text();
            			
            			location.href="detail.bo?boardNo="+bno;
            			
            		});
            	});
            </script>

            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                    	<c:when test="${pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage-1}">이전</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                   	<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
	                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
	                    
                     <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage+1}">다음</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <br clear="both"><br>

            <form id="searchForm" action="" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>

    </div>


	</body>
	</html>