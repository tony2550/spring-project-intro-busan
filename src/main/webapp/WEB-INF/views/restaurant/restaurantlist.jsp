<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div class="nav-wrapper" style= "background-image:	url(/resources/images/busan.jpg); width: 100%; height: 500px;">
			<div class="row valign-wrapper" style="padding: 0;">
			<h2 class="valign-wrapper" style=" color: white;">식당 전체목록</h2>
			</div>
		</div>
		<!-- Container -->
		<div class="container">

			<%--<a href="/board/write?pageNum=${ pageMaker.cri.pageNum }" class="waves-effect waves-light btn right">
						<i class="material-icons left">create</i>새글쓰기
				</a> --%>
			<div class="row">
				<c:choose>
					<c:when test="${ not empty manager }">
						<a href="/restaurant/add?pageNum=${ pageMaker.cri.pageNum }"
							class="waves-effect waves-light btn right"> <i
							class="material-icons left">create</i>+ 식당
						</a>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</div>

			<!-- Basic Card -->
			<div class="row">

				<c:choose>
					<c:when test="${ pageMaker.total gt 0 }">
						<c:forEach var="restaurant" items="${ restaurantList }">
							<!-- 카드 1건 시작 -->
							<div class="col s12 m4">
								<div class="card small" >
									<div class="card-image" style="overflow: visible; height: 100%; width: 100%;">
									<c:set var = "restaurantImg" value = "${restaurant.img}"/>
									<c:if test = "${fn:contains(restaurantImg,'https://')}">
										<img src="${restaurant.img}" alt="카드 이미지"
											onclick="location.href='/restaurant/detail/${restaurant.rid}'"
											style="height: 100%; width: 100%; cursor:pointer;">
									</c:if>
									<c:if test = "${not fn:contains(restaurantImg,'https://')}">
										<img src="/resources/restimages/${restaurant.img}" alt="카드 이미지" 
										onclick="location.href='/restaurant/detail/${restaurant.rid}'" 
										style="height: 100%; width: 100%; cursor:pointer;">
									</c:if>	
											
											
											<span class="card-title" style="padding:0px; font-weight: 400;">${restaurant.name}</span>
										
									</div>
									<div class="card-content"
										onclick="location.href='/restaurant/detail/${restaurant.rid}'"
										style="cursor: pointer; display:grid; grid-template-columns: 1fr 1fr; height: 300px;">
										<span><i class="material-icons Tiny">edit_location</i>${restaurant.district}</span>
										<span><i class="material-icons Tiny">local_dining</i>${restaurant.mainMenu}</span>
										<span><i class="material-icons Tiny">favorite</i>${restaurant.loveCount}</span>
										<span><i class="material-icons Tiny">comment</i>리뷰수</span>
									</div>
								</div>
							</div>
							<!-- end of Basic Card -->
							<!-- 카드 1건 끝 -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="row">
							<span colspan="5">현재 게시판에 작성된 글이 없습니다.</span>
							<!-- colspan 열병합 속성 rowspan 행병합 -->

					</c:otherwise>
				</c:choose>
			</div>
			<!-- end of Basic Card -->
		</div>



		<br />
		<!-- pagination -->
		<ul class="pagination" align="center">
					<li class="${pageMaker.prev ? 'waves-effect' : 'disabled'}">
				 	<a id="prev"><i class="material-icons">chevron_left</i></a></li>
						<!-- 페이지버튼 반복문 -->
						<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
						<li class=" ${pageMaker.cri.pageNum == i ? 'active' : 'waves-effect'}">
						<a href="/restaurant/list?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<!-- 페이지버튼 반복문 끝 -->
					<li class="${pageMaker.next ? 'waves-effect' : 'disabled'}">
					<a id="next"><i class="material-icons">chevron_right</i></a></li>
		</ul>
		<!-- end of pagination -->

		<!-- Footer -->
		<%-- include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of Container -->

	</div>
	<!-- end of App -->
	<script>
		var prev = document.querySelector('a#prev');

		prev.addEventListener('click', function(event) {
			event.preventDefault();

			var isPrev = $
			{
				pageMaker.prev
			}
			; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
			if (!isPrev) {
				return;
			}
			location.href = '/hotspot/list?pageNum=${pageDTO.startPage - 1}';
		});
		// 다음 a태그 클릭 이벤트
		var next = document.querySelector('a#next');

		next.addEventListener('click', function(event) {
			event.preventDefault();
			var isNext = $
			{
				pageMaker.next
			}
			; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
			if (!isNext) {
				return;
			}
			location.href = '/hotspot/list?pageNum=${pageDTO.endPage + 1}';
		});
	var prev = document.querySelector('a#prev');

	prev.addEventListener('click', function(event) {
		event.preventDefault();
		
		var isPrev = ${pageMaker.prev}; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
		if (!isPrev) {
			return;
		}
		location.href = '/hotspot/list?pageNum=${pageMaker.startPage - 1}';
	});
	// 다음 a태그 클릭 이벤트
	var next = document.querySelector('a#next');

	next.addEventListener('click', function(event) {
		event.preventDefault();
		var isNext = ${pageMaker.next}; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
		if (!isNext) {
			return;
		}
		location.href = '/hotspot/list?pageNum=${pageMaker.endPage + 1}';
	});
	</script>
</body>

</html>
