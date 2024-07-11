<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
        
    <%@include file="../common/header.jsp" %>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <a class="btn btn-secondary" style="float:right;" href="list.bo">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="6">${b.boardTitle}</td>
                </tr>
                <tr>
                    <th>글번호</th>
                    <td>${b.boardNo }</td>
                    <th>작성자</th>
                    <td>${b.boardWriter}</td>
                    <th>조회수</th>
                    <td>${b.count }</td>
                    <th>추천수</th>
                    <td>${b.recommend }</td>
                    <th>작성일</th>
                    <td>${b.uploadDate }</td>
                </tr>
                
                <tr>
                    <td colspan="4">
                    <p style="height:150px;">${b.boardContent}</p>
                    </td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <c:if test="${loginUser.userId eq b.boardWriter }">
	                <a class="btn btn-primary" href="update.bo?boardNo=${b.boardNo}">수정하기</a>
    	            <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
                </c:if>
            </div>
            <br><br>
            
            
            
            <script>
            	$(function(){
            		replyList();
            		//댓글작성 
                	$("#replyArea button").click(function(){
                		$.ajax({
                			url : "insertReply.bo",
                			type : "post",
                			data : {
                				refBno : ${b.boardNo},
                				replyWriter : "${loginUser.userNo}",
                				replyContent : $("#content").val()
                			},
                			success : function(result){
                				//dml구문 실행 후 처리된 행 수
                				if(result>0){//성공
                					alert("댓글작성 성공!");
                					replyList(); //추가된 댓글정보까지 다시 조회
                					$("#content").val("");
                				}else{
                					alert("댓글작성 실패!");
                				}
                			},
                			error : function(){
                				console.log("통신오류");
                			}
                		});
                	});
            	});
            	
            	
            	
            	//댓글 목록 비동기로 조회해오기
            	
            	function replyList(){
            		$.ajax({
            			url : "replyList.bo",
            			data : {
            				boardNo : ${b.boardNo}
            			},
            			success : function(result){
            				
            				var str = "";
            				
            				for(var i in result){
            					str += "<tr>"
            						+"<th>"+result[i].replyWriter+"</th>"
            						+"<td>"+result[i].replyContent+"</td>"
            						+"<td>"+result[i].createDate+"</td>"
            						+"</tr>";
            				}
            				
            				//만들어준 댓글목록 문자열 넣어주기 
            				$("#replyArea tbody").html(str);
            				//댓글 개수 넣기
            				$("#rcount").text(result.length);
            				
            			},
            			error : function(){
            				console.log("통신오류");
            			}
            			
            		});
            	}
            </script>
            
            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:choose>
						<c:when test="${empty loginUser}">
		                    <tr>
		                        <th colspan="2">
		                            <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인 후 이용해주세요.</textarea>
		                        </th>
		                    </tr>
						</c:when>     
						<c:otherwise>
							 <tr>
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>
		                    </tr>
						</c:otherwise>           	
                	</c:choose>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount"></span>)</td>
                    </tr>
                </thead>
                <tbody>
                   
                </tbody>
            </table>
    
        </div>
        <br><br>
    </div>
    
    
</body>
</html>