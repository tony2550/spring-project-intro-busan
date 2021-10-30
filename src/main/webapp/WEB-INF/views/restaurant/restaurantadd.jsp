<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="container">
			<!-- Breadcrumbs -->
			<nav>
				<div class="nav-wrapper cyan">
					<div class="col s12">
						<a href="/" class="breadcrumb">홈</a> <a
							href="/board/list?pageNum=${ pageNum }" class="breadcrumb">레스토랑
							목록</a> <a href="/board/write" class="breadcrumb">레스토랑 추가하기</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">레스토랑 추가하기</h4>
				<hr style="margin-bottom: 50px;">

				<form class="col s12 l6 offset-l3" action="/restaurant/add"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="${ pageNum }">

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i> <input
								type="text" id="name" name="name"> <label for="name">식당이름</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i> <input
								type="text" id="district" class="validate" name="district">
							<label for="district">지역구</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="address" class="validate" name="address"> <label
								for="address">주소</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="phoneNum" class="validate" name="phoneNum"> <label
								for="phoneNum">연락처</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="time" class="validate" name="time"> <label
								for="time">운영시간</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="mainMenu" class="validate" name="mainMenu"> <label
								for="mainMenu">메인메뉴</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="url" class="validate" name="url"> <label for="url">홈페이지</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subject</i>
							<textarea id="textarea1" class="materialize-textarea"
								name="content"></textarea>
							<label for="textarea1">내용</label>
						</div>
					</div>
					
					
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="img" class="validate" name="img"> <label for="url">대표이미지 url주소</label>
						</div>
					</div>


					<div class="row">
                    	<button type="button" class="btn-small waves-effect waves-light" id="btnAddFile">파일 추가</button>
                    </div>
                    
                    <div class="row" id="fileContainer">
                    <div class="file-field input-field col s12">
							<div class="btn">
								<span>
									<i class="material-icons left">attach_file</i>대표이미지
								</span>
								<input type="file" name="listImage" multiple>
							</div>
							<div class="file-path-wrapper">
								<input type="text" class="file-path validate">
							</div>
							<span class="helper-text">이미지 주소 혹은 대표이미지 파일을 업로드 해주세요</span>
						</div>
                    
                    
                    
                        <div class="file-field input-field col s12">
                            <div class="btn">
                                <span><i class="material-icons left">attach_file</i>첨부 파일</span>
                                <input type="file" name="files" multiple>
                            </div>
                            <div class="file-path-wrapper">
                                <input type="text" class="file-path validate">
                            </div>
                            <span class="helper-text">첨부파일로 업로드 가능한 용량은 최대 50MB 입니다.</span>
                        </div>
                    </div>


					<div class="row center-align">
						<div class="col s12 l8 offset-l2">
							<div class="col s6">
								<button type="submit" class="btn-large waves-effect waves-light">
									<i class="material-icons left">file_upload</i> 새글 등록
								</button>
							</div>
							<div class="col s6">
								<a class="btn-large waves-effect waves-light"
									href="/board/list?pageNum=${ pageNum }"> <i
									class="material-icons left">list</i> 글목록
								</a>
							</div>
						</div>
					</div>

					<div class="row">
						<blockquote>
							[새글 등록] 버튼을 눌러서 새 글을 등록해 보세요.<br> 새글쓰기를 하지 않고 글목록으로 가시려면
							[글목록] 버튼을 누르세요.
						</blockquote>
					</div>
				</form>
			</div>
			<!-- end of Forms -->


		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%-- include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
        const sideNav = document.querySelector('.sidenav');
        M.Sidenav.init(sideNav, {});
    </script>
	<script>
    	var fileContainer = document.querySelector('#fileContainer');
    	
    	var btnAddFile = document.querySelector('#btnAddFile');
    	
    	var fileCount = 1; // 첨부파일 선택상자 개수
    	
    	btnAddFile.addEventListener('click', function () {
    		if (fileCount >= 4) {
    			alert('첨부파일은 최대 4개까지만 업로드 가능합니다.')
    			return;
    		}
    		fileCount++; // 추가된 첨부파일 선택상자 개수 반영
    		
    		var input = `
            <div class="file-field input-field col s12">
                <div class="btn">
                    <span><i class="material-icons left">attach_file</i>첨부 파일</span>
                    <input type="file" name="files" multiple>
                </div>
                <div class="file-path-wrapper">
                    <input type="text" class="file-path validate">
                </div>
                <span class="helper-text">첨부파일로 업로드 가능한 용량은 최대 50MB 입니다.</span>
            </div>
    		`;
    		
    		fileContainer.innerHTML += input;
    	});
    
    </script>
</body>

</html>






