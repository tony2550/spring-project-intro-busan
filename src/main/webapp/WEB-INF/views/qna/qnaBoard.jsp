<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="container">
			<!-- Breadcrumbs -->
			<nav>
				<div class="nav-wrapper cyan">
					<div class="col s12">
						<a href="index.html" class="breadcrumb">홈</a>
						<a href="boardList.html" class="breadcrumb">게시판 글목록</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<div class="row">
				<h4 class="center-align">QnA 글목록</h4>
				<hr style="margin-bottom: 50px;">
			</div>

			<c:if test="${ not empty user}">
				<div class="row">
					<a href="/qna/write?pageNum=${ pageMaker.cri.pageNum }" class="waves-effect waves-light btn right">
						<i class="material-icons left">create</i>문의하기
					</a>
				</div>
			</c:if>

			<div class="row">
				<!-- Table -->
				<table class="highlight responsive-table ">
					<thead class="blue white-text">
						<tr>
							<th class="center-align">번호</th>
							<th class="center-align">제목</th>
							<th class="center-align">내용</th>
							<th class="center-align">글쓴이</th>
							<th class="center-align">작성일</th>
							<th class="center-align">조회수</th>
						</tr>
					</thead>

					<tbody>
						<%-- <c:choose>
                    		<c:when test="${ pageMaker.total gt 0 }"> --%>

						<%-- pageScope → requestScope → sessionScope → applicationScope --%>
						<c:forEach var="qna" items="${qnaList}">
							<tr onclick="location.href='/qna/content?id=${ qna.id }&pageNum=${ pageMaker.cri.pageNum }'" style="cursor: pointer;">
								<td class="center-align">${qna.id}</td>
								<td class="center-align">${qna.title}</td>
								<td class="center-align">${qna.content}</td>
								<td class="center-align">${qna.userId}</td>
								<td class="center-align">
									<fmt:formatDate value="${ qna.regDate }" pattern="yyyy.MM.dd" />
								</td>
								<td class="center-align">${ qna.readcount }</td>
							</tr>
						</c:forEach>
						<%-- 		
                    		</c:when>
                    		<c:otherwise> --%>
						<!-- 	<tr>
                    				<td colspan="5">게시판 글이 없습니다.</td>
                    			</tr> -->
						<%-- </c:otherwise>
                    	</c:choose> --%>
					</tbody>
				</table>
				<!-- end of Table -->
			</div>


			<div class="row center">
				<!-- Pagination -->
				<ul class="pagination">
					<li class="${ pageMaker.prev ? 'waves-effect' : 'disabled' }"><a id="prev">
							<i class="material-icons">chevron_left</i>
						</a></li>

					<c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
						<li class="${ pageMaker.cri.pageNum == i ? 'active' : 'waves-effect' }"><a href="/board/list?pageNum=${ i }">${ i }</a></li>
					</c:forEach>

					<li class="${ pageMaker.next ? 'waves-effect' : 'disabled' }"><a id="next">
							<i class="material-icons">chevron_right</i>
						</a></li>
				</ul>
				<!-- end of Pagination -->
			</div>


			<div class="row">
				<form action="">
					<!-- AutoComplete -->
					<div class="col s12 l6 offset-l3">
						<div class="input-field">
							<i class="material-icons prefix">find_in_page</i>
							<input type="text" id="autocomplete-input" class="autocomplete">
							<label for="autocomplete-input">검색</label>
						</div>
					</div>
					<!-- end of AutoComplete -->
				</form>
			</div>



		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%-- include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->



	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
        const sideNav = document.querySelector('.sidenav');
        M.Sidenav.init(sideNav, {});

        const ac = document.querySelector('.autocomplete');
        M.Autocomplete.init(ac, {
            data: {
                '파리': null,
                '베네치아': null,
                '암스테르담': null,
                '부다페스트': null,
                '프랑크푸르트': null,
                '비엔나': null,
                '드라스덴': null,
                '프라하': null,
                '로마': null
            }
        });
    </script>
	<script>
    	// [이전] a태그 클릭이벤트
    	var prev = document.querySelector('a#prev');
    	
    	prev.addEventListener('click', function (event) {
    		event.preventDefault();
    		
    		var isPrev = ${ pageMaker.prev };
    		if (!isPrev) {
    			return;
    		}
    		location.href = '/qna/qnaBoard?pageNum=${ pageMaker.startPage - 1 }';
    	});
    	
    	// [다음] a태그 클릭이벤트
		var next = document.querySelector('a#next');
    	
		next.addEventListener('click', function (event) {
			event.preventDefault();
			
    		var isNext = ${ pageMaker.next };
    		if (!isNext) {
    			return;
    		}
    		location.href = '/qna/qnaBoard?pageNum=${ pageMaker.endPage + 1 }';
    	});
    
    </script>
</body>

</html>







