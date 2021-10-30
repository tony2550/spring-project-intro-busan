<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>About</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- Fonts-->
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>

<style>
.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('/resources/images/review/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('/resources/images/review/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}

.uploadResult ul {
		display: flex;
       flex-flow: row;
       justify-content: center;
       align-items: center;
       padding: 0;
	}
	
.uploadResult ul li {
		list-style: none;
      	padding: 10px;
	}
	
.uploadResult ul li img {
		width : 300px;
		height : 200px;
	}
#imageResult {
	margin:0;
	font-family: 'Black Han Sans', sans-serif;
}

.starmsg {
	color : yellow;
}

.cmd input {
	width : 100px;
	color : white;
	font-weight: 40;
	font-family: 'Gamja Flower', cursive;
}
</style>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&display=swap')
	;
</style>
</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />


	</div>

	<!-- Content-->
	<div class="wil-content">

		<!-- Section -->
		<section class="awe-section">
			<div class="container">

				<!-- page-title -->
				<div class="page-title pb-40 row"
					Style="font-family: 'Black Han Sans', sans-serif;">
					<h2 class="page-title__title">${restaurant.name}</h2>
					<span><a href='${restaurant.url}' style="color: #263238;"><i class="small material-icons">perm_device_information</i> ${restaurant.url}</a></span>

					<c:choose>
						<c:when test="${ not empty manager }">
							<a href="/restaurant/modify/${restaurant.rid}"
								class="waves-effect waves-light btn right"> <i
								class="material-icons left">create</i> 수정하기
							</a>
							<button id="btnDelete" class="waves-effect waves-light btn right"
								Style="font-family: 'Black Han Sans', sans-serif;">
								<i class="material-icons left">create</i> 삭제하기
							</button>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</div>
				<!-- End / page-title -->
			</div>
		</section>
		<!-- End / Section -->


		<!-- Section -->
		<section class="awe-section bg-gray">
			<div class="container">
				<div class="row">
					<c:set var="restaurantImg" value="${restaurant.img}" />
					<c:if test="${fn:contains(restaurantImg,'https://')}">
						<div class="col s12 m6">
							<img src="${restaurant.img}" width="600px" height="450px"
								alt="${restaurant.name}">
						</div>
					</c:if>
					<c:if test="${not fn:contains(restaurantImg,'https://')}">
						<div class="col s12 m6">
							<img src="/resources/restimages/${restaurant.img}" width="600px"
								height="450px" alt="${restaurant.name}">
						</div>
					</c:if>

					<div class="col s12 m6" id="map"
						style="width: 600xp; height: 450px;"></div>
					<!-- 지도가 그려지는 영역 start of map-->
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=704267f627b153f92371c1f5a40b67b5&libraries=services"></script>
					<br />
					<p style="margin-top: -12px">
						<em class="link"> <a href="javascript:void(0);"
							onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
								혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
						</em>
					</p>
					<!-- end of map -->
				</div>
				<!--  end of row -->
			</div>
			<!-- end of container -->
		</section>
		<!-- end of first section -->

		<!-- second section -->
		<section class="awe-section bg-gray">
			<div class="container">
				<div id="imageResult" class="row grey lighten-1">
			<h5 class="center"> <i class="small material-icons">photo_library</i> 식당 이미지<i class="small material-icons">photo_library</i></h5>
			<div class="uploadResult">
			<ul></ul>
			</div>
			</div>
				<div class="mt-30" style="background-color: #EEEEEE;">
					<c:choose>
						<c:when test="${not empty user }">
							<button type="button" id="btnLove"
								style="background-color: transparent; border: 0px transparent solid;">
								<c:choose>
									<c:when test="${checkLove eq 1 }">
										<span style="font-size: 50px; color: red;">♥</span>
									</c:when>
									<c:otherwise>
										<span style="font-size: 50px;">♡</span>
									</c:otherwise>
								</c:choose>
							</button>
							<span style="font-size: 50px;">${loveCount }</span>
						</c:when>
						<c:otherwise>
							<button type="button" id="btnNotLoggedIn"
								style="background-color: transparent; border: 0px transparent solid;">
								<span style="font-size: 50px;">♡</span>
							</button>
							<span style="font-size: 50px;">${loveCount }</span>
						</c:otherwise>
					</c:choose>
					<div id="showDistance"></div>


					<p class="about__subtitle " style="color: red; font-size: 2rem">
						성별 추천 :
						<c:choose>
							<c:when test="${not empty gender }">
								<c:choose>
									<c:when test="${gender eq 'M' }">
											남성에게 추천
										</c:when>
									<c:otherwise>
											여성에게 추천
										</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
									아직 제공할 추천 데이터가 없음
								</c:otherwise>
						</c:choose>
					</p>

					<p class="about__subtitle " style="color: red; font-size: 2rem">
						연령별 추천 :
						<c:choose>
							<c:when test="${not empty age }">
									${age }0대에게 추천
								</c:when>
							<c:otherwise>
									아직 제공할 추천 데이터가 없음
								</c:otherwise>
						</c:choose>
					</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.address}</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.phoneNum}</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.url}</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.content}</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.time}</p>
					<p class="about__text"
						style="font-family : 'Gamja Flower', cursive; font-size: 40px;">${restaurant.mainMenu}</p>
				</div>
				
				<div style="font-family: 'Black Han Sans', sans-serif;">
				<form name="reviewform" class="reviewform" method="post" action="/save">
				<input type="hidden" name="restId" id="restId" value="${restaurant.rid}"/>
        		<input type="hidden" name="rate" id="rate" value="0"/>
        		<h4 class="title_star">별점과 리뷰를 남겨주세요.</h4>
				
				<div class="review_rating">
            	<div class="warning_msg">별점을 선택해 주세요.</div>
           		 <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
           		 </div>
        		</div>
        		
				<div class="row">
					<div class="col s10">
					<input type="hidden" name="username" id="username" value="${user.username}"/>
					<textarea  rows="5" cols="25" id="msg"></textarea>
					</div>
					<div class="col s2 cmd">
					<input class="center waves-effect waves-light btn" type="button" name="save" id="save" value="등록">
					</div>
				</div>
				<hr />
				<div id="replyResult"></div>
			</form>
			</div>
		</div>
		</section>

	</div>
	<!-- End / Content-->

	<!-- footer -->
	<%-- include footer.jsp --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- end of Footer -->
	<script>
	$(document).ready(function() {
		
		(function() {
		$.ajax({
			type : "get",
			url : "/upload/attachlist",
			data : {"rid" : ${restaurant.rid}}
		})
		.done(function(resp){
			/* alert(resp); */
			/* resp=JSON.parse(resp) */
			var str = "";
			$.each(resp, function(key, attach){ //clist
				
					var fileCallPath = attach.uploadpath + "/" + attach.uuid + "_" + attach.filename;
					str += "<li data-path='"+attach.uploadpath+"'";
					str += " data-uuid='"+attach.uuid+"' data-fileName='"+attach.filename+"'>";
					str += " <div>";
					str += "<img src='/resources/restimages/" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
			})
			$(".uploadResult ul").html(str);
		})
		.fail(function(e){
			alert("실패")
		})
	})();
	})
	</script>
	<script>

	$("#btnLove").on('click', function() {
		$.ajax({
			type : "GET",
			url : "/user/checkLove/${restaurant.rid}",
			success : function(resp) {
				if (resp == "success") {
					alert("좋아요 목록에 추가되었습니다.");
					location.href = '/restaurant/detail/${restaurant.rid}';
				} else if (resp == "cancleLove") {
					alert("좋아요를 취소하셨습니다.");
					location.href = '/restaurant/detail/${restaurant.rid}';
				}
			}// success
		}) //ajax
	}); //btnLove
	
	
	$("#btnNotLoggedIn").on('click', function() {
		alert('좋아요를 누르려면 로그인을 먼저 진행해주세요.');
	});
</script>


	<!-- 이미지 모달(팝업창) 관련 자바스크립트 -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.modal');
			var instances = M.Modal.init(elems);
		});
</script>

	<script>
	/* 댓글 불러오기 */
	/* var init = function(){
		$.ajax({
			type:"get",
			url:"/review/commentList/"+$('#restId').val()
		})
		.done(function(resp){ */
			// Changes XML to JSON
			
			/* resp=JSON.parse(resp) */
			/* var str = "";
			$.each(resp,function(key,val){

				str +=
				`<table>
					<tr>
						<th>별점</th>
						<th>유저 아이디</th>
						<th>내용</th>
						<th>생성일자</th>
						
					</tr>

					<tr>
				`
										
				str += "<td>"+S*val.grade+"</td>"+" "	
				str += "<td>"+val.username+"</td>"+" "
				str += "<td>"+val.content+"</td>" + " "
				str += "<td>"+val.regdate+"</td>" + " "
				str += "<td><a href='javascript:fdel("+val.id+")'>삭제</a></td><br/> "
				str += "</table>"
			})
			console.log(str)
			$("#replyResult").html(str);
		})
		
		
		.fail(function(resp){
			alert("댓글 불러오기 실패");
		})
	}	 */	


//댓글 삭제
/* function fdel(id){
alert(id)
alert(resp)

$.ajax({
	type:"delete",
	url:"/review/delete/"+id
})	

.done(function(resp){
	alert(resp +"번 글 삭제 완료")
	init();
})

	
.fail(function(resp){
alert("댓글 삭제 실패")

})
}
init(); */

	
</script>




	<!-- 지도 그리기 자바스크립트 -->
	<script>
<!-- 현재 내 위치 좌표구하기 및 표시를 위한 자바스크립트 --> 
////////////////////////////////////////////////////////////////////////////
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo"; 
document.cookie = "crossCookie=bar; SameSite=None; Secure";

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    var myPosition=navigator.geolocation.getCurrentPosition(function(position) {
        
        mylat = position.coords.latitude; // 위도
        mylon = position.coords.longitude; // 경도
       var presentPosition = [mylat,mylon]; 
           
            console.log("현재 나의 경위도 x 좌표:"+mylat+" y좌표:"+mylon)
        	 console.log("현재 presentPosition X:"+presentPosition[0]+" Y:"+presentPosition[1])
        var locPosition = new kakao.maps.LatLng(mylat, mylon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
       
            
      //주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다 
       geocoder.addressSearch('${restaurant.address}', function(result, status) {

            // 정상적으로 검색이 완료됐으면 
             if (status === kakao.maps.services.Status.OK) {
            	
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var desPosition = [parseFloat(result[0].y),parseFloat(result[0].x)];
        			
        		console.log("식당 경위도 좌표 경도 y:"+result[0].y+"위도 x:"+result[0].x);
        		
        		
        		
        		// 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurant.name}<br>${restaurant.phoneNum}</div>'
                });
                infowindow.open(map, marker);
                
              
             
                
        var dataParam={
    		
    		"desY" : desPosition[0],
    		"desX" : desPosition[1],
    		"myY" : presentPosition[0],
    		"myX" : presentPosition[1],
    	

    	}
    	$.ajax({
    		type :"Post",
    		data : JSON.stringify(dataParam),
    		url :"/restaurant/checkCoords/",
    		contentType : "application/json;charset=utf-8"
    		
    	})//ajax
    	.done(function(resp){
 			  
    		alert("좌표 전송 성공")    		
			console.log(resp);
    		resp = JSON.parse(resp)
    		console.log(resp);
    		
    		
    		var str = "<p style='font-size:30px; color:blue'> 현재 내 위치에서부터의 거리 : "+ resp.distance +"km</p>" + " ";
    		
			console.log(str)
			$("#showDistance").html(str); 
		})
		
			    		
    	.fail(function(resp){
    		alert("좌표 전송 실패")

    	})
            } 
        });    
            
            
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);   
    
      
}    


<!-- 주소로 경위도 좌표 구하기 및 표시를 위한 자바스크립트 -->
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


//지도에 교통정보를 표시하도록 지도타입을 추가합니다
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
</script>


	<script>

	$("#btnLove").on('click', function() {
		$.ajax({
			type : "GET",
			url : "/user/checkLove/${restaurant.rid}",
			success : function(resp) {
				if (resp == "success") {
					alert("좋아요 목록에 추가되었습니다.");
					location.href = '/restaurant/detail/${restaurant.rid}';
				} else if (resp == "cancleLove") {
					alert("좋아요를 취소하셨습니다.");
					location.href = '/restaurant/detail/${restaurant.rid}';
				}
			}// success
		}) //ajax
	}); //btnLove
	
	
	$("#btnNotLoggedIn").on('click', function() {
		alert('좋아요를 누르려면 로그인을 먼저 진행해주세요.');
	});
</script>


	<script>
	const sideNav = document.querySelector('.sidenav');
	M.Sidenav.init(sideNav, {});
</script>

	<!-- 별점 관련 자바스크립트 -->
	<script>
/* 	$(document).ready(function(){
	    $('select').formSelect();
	});
	
	
	
	function selectStar(e) {
		var d = '';
		var select1 = 1;
		var select2 = 2;
		var select3 = 3;
		var select4 = 4;
		var select5 = 5;
		
		if (e.value == "1") var d = select1;
		else if (e.value == "2") var d = select2;
		else if (e.value == "3") var d = select3;
		else if (e.value == "4") var d = select4;
		else if (e.value == "5") var d = select5;
		
		target.options.length = 0;
	}
	
   $("#btnComment").click(function(){
	   
  	
  		if($("#msg").val()==""){
  			alert("댓글을 적으세요");
  			return;
  		}
	   
	   if($(d == '') {
		   alert('별점을 체크해주세요');
		   return;
	   }
	   if(${empty user}){
 			alert("로그인하세요");
 			
 		} else {
 			data={
 			   		"username" : $("#username").val(),<link href="/resourses/css/star.css" rel='stylesheet'/>
 			   		"restId": $("#restId").val(),
 			   		"content":$("#msg").val(),
 			   		"grade" : d
 			   	}
 			  
 			  
 			   	$.ajax({
 			   		type:"POST",
 			   		url:"/review/insert",
 			   		data : JSON.stringify(data),
 			   		contentType:"application/json;charset=utf-8"
 			   		
 			   	})

 			   	.done(function(){
 			   		alert("댓글 추가 성공");
 			   	})
 			   	
 			   	.fail(function(){
 			   		alert("댓글 추가 실패")
 			   	})
 		}
   	
   	
  
} */

</script>

	<script>
		
		$("#btnDelete").click(function(){
			
			 $.ajax({
				type:"DELETE",
				url:"/restaurant/delete/${restaurant.rid}"
			 })
			 .done(function(resp){
				if(resp=="success"){
				alert("식당정보 삭제 성공");
				location.href="/restaurant/list";
				}
			 })
			 .fail(function(){
				alert("식당정보 삭제 실패");
			 })
			})
		
	</script>

</body>
</html>