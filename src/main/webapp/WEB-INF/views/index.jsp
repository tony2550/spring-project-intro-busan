<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
.event .row {
	margin-bottom: 50px;
}
</style>

</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="container">
			<!-- Image Slider -->
			<div class="slider">
				<ul class="slides" style="border: solid black 11px;">
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F992E48365D08D7BA36">
						<div class="caption right-align">
							<h2>감천문화마을</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">한국의
								마추픽추 감천문화마을</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=365">맛집 정보 보러가기</a>
							</h5>
						</div></li>
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99606C385D08D9830B">
						<div class="caption left-align">
							<h2>광안리</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">광안리의
								밤은 당신의 낮보다 아름답다</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=377">맛집 정보 보러가기</a>
							</h5>
						</div></li>
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99E63F3D5D08D80C1B">
						<div class="caption right-align">
							<h2>용두산공원</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">부산여행의
								이유 용두산공원</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=368">맛집 정보 보러가기</a>
							</h5>
						</div></li>
				</ul>
			</div>
			<!-- end of Image Slider -->

			<!-- AutoComplete -->
			<div id="select" class="cyan white-text center">
				<h3>최근 인기있는 지역 Top6</h3>
				<div class="row">
					<c:forEach var="district" items="${ districts }" varStatus="status">
					<div class="col s2">
       		   		<div class="icon-block">
           		 		<h2 class="center light-blue-text"><i class="material-icons">near_me</i></h2>
           				 <h5 class="center">${district}</h5>
							<h5 class="center">좋아요 수 : ${lovecounts[status.index]}</h5>
        					<h5 class="center"><a href="/district?district=${district}">맛집 정보 보러가기</a></h5>
         				 </div>
      		  			</div>
      		  			</c:forEach>
						</div>
				</div>
			</div>
			<!-- end of AutoComplete -->
		</div>
		
		</br></br></br>
		
		<div class="container event" style="display: flex; align-items: center; flex-direction: column;">
		<!-- end of Container -->


		<!-- Container -->
			<div class="row">
			<div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/review.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">연령별 추천 식당</h5>

           		 <h5 class="light">추천받으러가기</h5>
         		 </div>
      		  </div>
      		  
      		  <div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/10s.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">10s</h5>

           		 <a href="/age/1">맛집 정보 보러가기</a>
         		 </div>
      		  </div>
      		  
      		  <div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/20s.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">20s</h5>

           		 <a href="/age/2">맛집 정보 보러가기</a>
         		 </div>
      		  </div>
      		  
      		  <div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/30s.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">30s</h5>

           		 <a href="/age/3">맛집 정보 보러가기</a>
         		 </div>
      		  </div>
      		  
      		  <div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/40s.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">40s</h5>

           		 <a href="/age/4">맛집 정보 보러가기</a>
         		 </div>
      		  </div>
      		  
      		  <div class="col s2">
       		   <div class="icon-block">
           		 <img src="/resources/images/50s.png"
           		 	class="center" style="width:200px;"/>
           		 <h5 class="center">50s</h5>

           		 <a  href="/age/5">맛집 정보 보러가기</a>
         		 </div>
      		  </div>
      		  
					
				</div>
					
					
				
				<div class="row">
			<div class="col s12 m6">
       		   <div class="icon-block">
           		 <img src="/resources/images/coffee.jpg"
           		 	class="center" style="width:600px;"/>
           		 <h5 class="center">@아메리카노 @라떼</h5>

           		 <p class="light">@ 부산 앞바다가 보이는 카페 @ 부산에서만 맛볼수 있는 특별한 라떼 @ 여름엔 역시 찹찹한 아이스 아메리카노 @ 비토닉클래식</p>
         		 </div>
      		  </div>
        
     		   <div class="col s12 m6">
         		 <div class="icon-block">
           		 <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
           		 <h4 class="center">찹찹한 아 이스 아 메리카노 하나 주이소</h4>

          		  <h5 class="center">"요새는 금강산도 식후 커피라카던데~</h5>
          		  <h5 class="center">커피 한잔 들고 다니는 부산여행"</h5>
          		  <a href="/coffee" class="center">카페 추천 보러가기</a>
         		 </div>
           		 </div>
					
				</div>
				
				<div class="row">
			
        
     		   <div class="col s12 m6">
         		 <div class="icon-block">
           		 <h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>
           		 <h5 class="center">실시간 리뷰로 맛집을 찾아보세요</h5>

          		  <p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
         		 </div>
           		 </div>
           		 
           		 <div class="col s12 m6">
       		   <div class="icon-block">
           		 <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99E63F3D5D08D80C1B"
           		 	class="center" style="width:600px;"/>
           		 <h5 class="center">Speeds up development</h5>

           		 <p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
         		 </div>
      		  </div>
					
				</div>
					
	<!-- end of Container -->
</div>
	<!-- end of App -->
<!-- Footer -->
		<%-- include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />





	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		const slider = document.querySelector('.slider');
		M.Slider.init(slider, {
			indicators : false,
			height : 600,
			duration : 500,
			interval : 6000
		});

		const ac = document.querySelector('.autocomplete');
		M.Autocomplete.init(ac, {
			data : {
				'파리' : null,
				'베네치아' : null,
				'암스테르담' : null,
				'부다페스트' : null,
				'프랑크푸르트' : null,
				'비엔나' : null,
				'드라스덴' : null,
				'프라하' : null,
				'로마' : null
			}
		});

		var elems = document.querySelectorAll('.collapsible');
		var instances = M.Collapsible.init(elems, {});
	</script>



	<!-- 이미지 모달(팝업창) 관련 자바스크립트 -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.modal');
			var instances = M.Modal.init(elems);
		});
	</script>
</body>

</html>
