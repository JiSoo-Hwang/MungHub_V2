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
            <h2>게시글 상세보기</h2>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="list.bo">목록으로</a>
            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${b.boardTitle}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${b.boardWriter }</td>
                    <th>카테고리</th>
                    <td>${b.categoryName }</td>
                    <th>조회수</th>
                    <td>${b.count }</td>
                    <th>추천수</th>
                    <td>${b.recommend }</td>
                    <th>작성일</th>
                    <td>${b.uploadDate }</td>
                </tr>
                
                <%--
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:choose>
                    		<c:when test="${empty b.originName }">
                    			첨부파일이 없습니다.
                    		</c:when>
                    		<c:otherwise>
		                        <a href="${b.changeName}" download="${b.originName }">${b.originName }</a>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </td>
                </tr>
                --%>
                <tr>
                    <th>내용</th>
                    <td colspan="3">${b.boardContent}</td>
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
	                <a class="btn btn-primary" href="update.bo?boardNo=${b.boardNo }">수정하기</a>
    	            <button type="button" class="btn btn-danger" id="deleteBtn">삭제하기</button>
                </c:if>
            </div>
            <br><br>
            
            
            
            <!-- 만약 form태그로 작성한다면 아래와같은 모습이 될것 
            	 하지만 form태그를 여러번 사용하는것은 가독성이 좋지 않고 중복코드가 발생하게 된다.
            	 해당 작업을 함수로 처리하기
             -->
<!--             <form action="delete.bo" method="post"> -->
<%--             	<input type="hidden" value="${b.boardNo }" name="boardNo"> --%>
<!--             	<input type="submit"> -->
<!--             </form> -->
            <!-- 
            <script>
            	//삭제하기 버튼을 눌렀을때 삭제 처리를 post 방식으로 진행하기
            	//mapping 주소만으로 쿼리스트링을 전달해버리면 삭제가 되어버리는 문제 발생 
            	//때문에 중요 작업들은 post방식으로 처리하여 url 노출을 피한다.
            	$(function(){
            		
            		$("#deleteBtn").click(function(){
            			//form태그 생성하고 각 속성 채워준 뒤 
            			//원하는 데이터가 있다면 해당 데이터도 태그로 생성한뒤 채워주고 
            			//마지막으로 완성된 form태그 구문에 submit 작업을 하면 된다.
            			
            			//form,input 태그 생성
            			var formObj = $("<form>");
            			var inputObj = $("<input>"); 
            			var filePath = $("<input>");
            			//생성된 form 태그와 input태그에 필요한 속성과 값을 채워 준뒤 form안에 input 넣기 
            			formObj.prop("action","delete.bo").prop("method","post");
            			
            			//input 태그에 type과 name과 value 설정하기 (전달할 데이터)
            			inputObj.prop("type","hidden").prop("name","boardNo").prop("value","${b.boardNo}");
            			//서버에서 업로드되어있는 파일도 삭제해야 하기 때문에 파일 경로 전달해주기 
            			filePath.prop("type","hidden").prop("name","filePath").prop("value","${b.changeName}");
            			
            			//form안에 input 넣기
            			var obj = formObj.append(inputObj).append(filePath);
            			
            			//생성된 최종 form 태그를 이 문서에 포함시키기 
            			$("body").append(obj);
            			
            			//완성된 form태그를 이용하여 submit() 메소드 수행 
            			obj.submit();
            		});
            		
            		
            	});
            </script>
             -->
            <!--
            	댓글 기능 구현하기 ajax이용하여 
            	replyList 메소드명 사용하기 	
            
            -->
            <script>
            	/*$(function(){
            		replyList();
            		
            		//댓글작성 
                	$("#replyArea button").click(function(){
                		
                		$.ajax({
                			url : "insertReply.bo",
                			type : "post",
                			data : {
                				refBno : ${b.boardNo},
                				replyWriter : "${loginUser.userId}",
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
            	*/
            	/*
            	
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
            	}*/
            </script>
            
            <!-- 
            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:choose>
						<c:when test="${empty loginUser }">
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
             -->
    
        </div>
        <br><br>
    </div>
    
    
</body>
</html>