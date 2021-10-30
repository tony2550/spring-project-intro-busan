<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
</head>

<body>
	<!-- App -->
	<div id="app">
		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div class="nav-wrapper" style= "background-image:	url(/resources/images/busan.jpg); width: 100%; height: 500px;">
			<div class="row valign-wrapper" style="padding: 0;">
			<h2 class="valign-wrapper" style=" color: white;">카페 추천 서비스</h2>
			</div>
		</div>

		
	</div>
	</br>
	</br>

	<!-- end of Container -->
	<div class="container">
		
		<div class="row">

			<c:forEach var="restaurant" items="${ restList }">
				<!-- 레스토랑 카드 1건 시작 -->
				<div class="col s12 m4">
					<div class="card medium ">
						<div class="card-image" style="overflow: visible">
							<a href="/restaurant/detail/${restaurant.rid}"> <img
								src="${restaurant.img}" style="height: 200px;" />
							</a> <span class="card-title" style="padding: 0px; font-weight: 800;">${restaurant.name}</span>
							<a class="btn-floating halfway-fab waves-effect waves-light red">
								<i data-target="modal1" class="material-icons modal-trigger">add</i>
							</a>
						</div>
						<div class="card-content" style="display: block; height: 200px;">
							<i class="material-icons Tiny">edit_location</i>
							${restaurant.district}<br /> <i class="material-icons Tiny">local_dining</i>
							${restaurant.mainMenu}<br /> <i class="material-icons Tiny">favorite</i>
							${restaurant.loveCount}<br /> <i class="material-icons Tiny">comment</i>
							리뷰수
						</div>
					</div>
				</div>

				<!-- Modal Modal component -->
				<div id="modal1" class="modal">
					<div class="modal-content">
						<h4>Modal Header</h4>
						<p>A bunch of text</p>
					</div>
					<div class="modal-footer">
						<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
					</div>
				</div>
				<!-- Modal component end-->
			</c:forEach>
		</div>
	</div>
	<!-- 레스토랑 카드 1건 끝 -->

	<!-- end of Basic Card -->

	<%--<a
          href="/board/write?pageNum=${ pageMaker.cri.pageNum }"
          class="waves-effect waves-light btn right"
        >
          <i class="material-icons left">create</i>새글쓰기
        </a>
        --%>
	<!-- Container -->



	<br />
	<!-- pagination -->
	<ul class="pagination" align="center">
		<li class="${pageMaker.prev ? 'waves-effect' : 'disabled'}"><a
			id="prev"><i class="material-icons">chevron_left</i></a></li>
		<!-- 페이지버튼 반복문 -->
		<c:forEach var="i" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}" step="1">
			<li
				class=" ${pageMaker.criDetail.pageNum == i ? 'active' : 'waves-effect'}">
				<a href="/hotspot/detail?id=${hotspot.id}&pageNum=${i}">${i}</a>
			</li>
		</c:forEach>
		<!-- 페이지버튼 반복문 끝 -->
		<li class="${pageMaker.next ? 'waves-effect' : 'disabled'}"><a
			id="next"><i class="material-icons">chevron_right</i></a></li>

	</ul>
	<!-- end of pagination -->

	<!-- Footer -->
	<%-- include footer.jsp --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- end of Footer -->
	</div>
	<!-- end of App -->

	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		const slider = document.querySelector('.slider');
		M.Slider.init(slider, {
			indicators : false,
			height : 485,
			duration : 500,
			interval : 6000,
		});

		const ac = document.querySelector('.autocomplete');
		M.Autocomplete.init(ac, {
			data : {
				파리 : null,
				베네치아 : null,
				암스테르담 : null,
				부다페스트 : null,
				프랑크푸르트 : null,
				비엔나 : null,
				드라스덴 : null,
				프라하 : null,
				로마 : null,
			},
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

		var prev = document.querySelector('a#prev');
		prev
				.addEventListener(
						'click',
						function(event) {
							event.preventDefault();

							var isPrev = $
							{
								pageMaker.prev
							}
							; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
							if (!isPrev) {
								return;
							}
							location.href = '/hotspot/detail?id=${hotspot.id}&pageNum=${pageDTO.startPage - 1}';
						});
		// 다음 a태그 클릭 이벤트
		var next = document.querySelector('a#next');
		next
				.addEventListener(
						'click',
						function(event) {
							event.preventDefault();
							var isNext = $
							{
								pageMaker.next
							}
							; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
							if (!isNext) {
								return;
							}
							location.href = '/hotspot/detail?id=${hotspot.id}&pageNum=${pageDTO.endPage + 1}';
						});
	</script>
</body>
</html>
