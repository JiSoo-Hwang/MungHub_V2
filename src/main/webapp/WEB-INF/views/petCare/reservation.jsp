<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MungHub</title>

<style>
	#formBody{
      margin: 20% 20% 15% 15%;
    }
	.form-section {
      margin-bottom: 2rem;
    }
    .form-section h5 {
      margin-bottom: 1rem;
    }
    /* 시간선택 css */
    .str-btn {
        width: 100px;
        height: 50px;
        border: 2px solid #ccc;
        margin: 5px;
        transition: background-color 0.3s, color 0.3s;
    }
    .str-btn.selected {
        background-color: #28a745;
        color: white;
    }
	
	/* 소요시간 CSS  */
    .duration-btn-group , .petType-btn-group {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }
    .duration-btn , .petType-btn {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 2px solid #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        background-color: white;
        transition: background-color 0.3s, color 0.3s;
    }
    .duration-btn.selected , .petType-btn.selected {
        background-color: #007bff;
        color: white;
    }
    .duration-btn span , petType-btn span {
        display: block;
        font-size: 14px;
    }
    .duration-btn.best::after {
        content: 'BEST';
        display: block;
        font-size: 10px;
        color: #007bff;
        margin-top: 5px;
    }
    .petType-btn.best::after {
        content: 'BEST';
        display: block;
        font-size: 10px;
        color: #007bff;
        margin-top: 5px;
    }
    .btn-reserve {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    .btn-reserve:hover {
        background-color: #0056b3;
    }
    
    /* 시팅용품 */
    .items-row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: center;
	}
	
	.item {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin: 10px;
	    text-align: center;
	    flex-basis: calc(33.333% - 20px); /* 각 아이템이 부모 너비의 1/3씩 차지하도록 설정합니다 */
   		max-width: calc(33.333% - 20px); /* 최대 너비를 부모 너비의 1/3로 설정합니다 */
	}
	
	.item img {
	    margin-bottom: 8px;
	}
    
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	
	<!-- 펫시터 선택페이지에서 가져온 데이터 : 방문날짜, 방문(시작)시간, 돌봄시간, 종료시간, 펫시터정보
		 추가할 데이터 : 주소, 연락처, 주의사항, 펫이름, 펫크기, 펫사진, 총금액-->
	<div class="contatiner mt-5" id="formBody">
	<h3>단기돌봄 예약페이지</h3>
	<br><br>
	
	    <form action="enroll.re" method="post">
		    <input type="hidden" name ="visitDate" value="${at.visitDate }">
		    <input type="hidden" name ="startTime" value="${at.startTime }">
		    <input type="hidden" name ="duration" value="${at.duration }">
		    <input type="hidden" name ="endTime" value="${at.endTime }">
	
	      <!--방문장소-->
	      <div class="form-section">
	        <h5>어디로 방문할까요?</h5>
	        <div class="form-group">
	            <input type="text" class="form-control" name="address" id="address" placeholder="펫시터가 방문할 주소를 입력해주세요.">
	        </div>
	        <div class="form-group">
	            <input type="text" class="form-control" name="phone" id="phone" placeholder="연락받을 전화번호를 적어주세요.">
	        </div>
	      </div>
	
	      <!-- 날짜,시간확인 -->
	      <div class="form-section">
	          <h5>방문 날짜와 시간, 돌봄시간, 반려견 유형을 확인해주세요.</h5><br>
	          <p>(일정 변경은 이전 페이지에서 가능합니다.)</p>
	          
	          <div class="form-group">
	              <h5>방문날짜</h5>
	              <input type="date" class="form-control" value="${at.visitDate }" name="visitDate" id="visitDate" disabled>
	          </div>
	          
	          <div class="form-group">
	              <h5>방문시간</h5>
	                <div class="" id="startTime">
	                <br> 
		                <button type="button" class="str-btn" value="900">09:00</button>
		                <button type="button" class="str-btn" value="1000">10:00</button>
		                <button type="button" class="str-btn" value="1100">11:00</button>
		                <button type="button" class="str-btn" value="1200">12:00</button>
		                <button type="button" class="str-btn" value="1300">13:00</button>
		                <button type="button" class="str-btn" value="1400">14:00</button>
		                <button type="button" class="str-btn" value="1500">15:00</button>
		                <button type="button" class="str-btn" value="1600">16:00</button>
		                <button type="button" class="str-btn" value="1700">17:00</button>
	           		</div>
	           		
	           	 <h5>돌봄시간</h5>
		             <div class="duration-btn-group" id="duration"> 
		             <br>
		                <button type="button" class="duration-btn" value="100">60분</button>
		                <button type="button" class="duration-btn" value="200">120분</button>
		                <button type="button" class="duration-btn" value="300">180분</button>
		                <button type="button" class="duration-btn" value="400">240분</button>
		             </div>
		         <h5>반려견 유형</h5>
	               	 <div class="petType-btn-group" id="petType">
	                    <button type="button" class="petType-btn" value="1">소형</button>
	                    <button type="button" class="petType-btn" value="2">중형</button>
	                    <button type="button" class="petType-btn" value="3">대형</button>
	               	 </div>
	          </div>
	      </div>
	
	      <!--펫 정보 (이름,사진,요청사항) -->
	      <div class="form-section">
		        <h5>반려동물의 정보를 입력해주세요.</h5>
		        <div class="form-group">
		          	<label for="petName">이름<input type="text" class="form-control" name="petName" id="petName" placeholder="반려동물의 이름을 적어주세요." style="width:300px;"></label>
		          	<br>
		          	<label for="upfile">첨부파일<input type="file" class="form-control" name="upfile" id="upfile"></label>
		          	<br>
		          	<label for="requests">요청사항</label>
		          	<br>
		          	<textarea rows="4" cols="40" placeholder="돌봄 유의사항을 꼭!! 적어주세요." style="resize: none;" required></textarea>
		        </div>
	      </div>
	
	      <!-- 펫시팅 용품 준비안내 -->
	      <h5>펫시팅 용품을 준비해주세요.</h5>
	      <div class="items-row mt-4">
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/food.png" width="100" height="120" alt="사료">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/snack.png" width="100" height="120" alt="간식">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/toy.png" width="100" height="120" alt="장난감">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/line.png" width="100" height="120" alt="목줄">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/identification.png" width="100" height="120" alt="인식표">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/comb.png" width="100" height="120" alt="빗">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/tissues.png" width="100" height="120" alt="티슈">
	          </div>
	          <div class="item">
	            <img src="/pjtMungHub/resources/uploadFiles/sittingSupplies/pad.png" width="100" height="120" alt="배변패드">
	          </div>
	      </div>
	
	      <!--결제금액 및 서비스 확인-->
	      <div class="form-section">
	        <h5>고객님께서 받을 서비스와 총 결제 금액입니다.</h5>
	        <div class="form-group">
	            받아보시는 서비스는 <input type="text" class="form-control" name="totalPrice" id="totalPrice" value="${at.priceName }" style="width:300px;" readonly>이며,
	            상품 가격은 <input type="text" class="form-control" name="totalPrice" id="totalPrice" value="${at.totalPrice }" style="width:300px;" readonly> 원 입니다.
	        </div>
	      </div>
	      
	      <br>
	      <button type="submit">예약완료 결제하기로 이동</button>
	      
	    </form>
  	</div>	
  	
  	<script>
  		$(function(){
  			
  			//모든버튼 비활성화
  			$("#startTime .str-btn").prop("disabled",true);
  			$("#duration .duration-btn").prop("disabled",true);
  			$("#petType .petType-btn").prop("disabled",true);
  			
  			//? 쿼리스트링에서 필요한 데이터만 뽑아오기
  			function getQueryParam(param){
  				var urlParams = new URLSearchParams(window.location.search);
  				return urlParams.get(param);
  			}
  			var startTime = getQueryParam("startTime");
  			var duration = getQueryParam("duration");
  			var petTypeNo = getQueryParam("petTypeNo");
  			
  			console.log(petTypeNo);
  			
  			//넘어온 값이 맞다면 button을 변수 지정해서 특정 button만 활성화 시키기
  			if(startTime){
  				var startTimeButton = $('.str-btn[value="'+ startTime + '"]');
  				if(startTimeButton){
  					startTimeButton.prop('disabled',false).addClass('active');
  				}
  			}
  			if(duration){
  				var durationButton = $('.duration-btn[value="'+ duration +'"]');
  				if(durationButton){
  					durationButton.prop('disabled',false).addClass('active');
  				}
  			}
  			if(petTypeNo){
  				var petTypeBtn = $('.petType-btn[value="'+ petTypeNo +'"]');
  				if(petTypeBtn){
  					petTypeBtn.prop('disabled',false).addClass('active');
  				}
  			}
  		});
  	
  	</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

</body>
</html>



























