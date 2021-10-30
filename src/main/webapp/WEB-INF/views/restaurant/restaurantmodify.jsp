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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<style>
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
	
</style>
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
							href="/restaurant/list?pageNum=${ pageNum }" class="breadcrumb">레스토랑
							목록</a> <a href="/board/write" class="breadcrumb">레스토랑 정보 수정하기</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">레스토랑 정보 수정하기</h4>
				<hr style="margin-bottom: 50px;">

				<form class="col s12 l6 offset-l3" action="/restaurant/modify"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="${ pageNum }"> <input
						type="hidden" id="rid" name="rid" value="${restaurant.rid}">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i> <input
								type="text" id="name" name="name" value='${restaurant.name}'>
							<label for="name">식당이름</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i> <input
								type="text" id="district" class="validate" name="district"
								value='${restaurant.district}' readonly> <label for="district">지역구</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="address" class="validate" name="address"
								value='${restaurant.address}'> <label for="address">주소</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="phoneNum" class="validate" name="phoneNum"
								value='${restaurant.phoneNum}'> <label for="phoneNum">연락처</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="time" class="validate" name="time"
								value='${restaurant.time}'> <label for="time">운영시간</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="mainMenu" class="validate" name="mainMenu"
								value='${restaurant.mainMenu}'> <label for="mainMenu">메인메뉴</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subtitles</i> <input type="text"
								id="url" class="validate" name="url" value='${restaurant.url}'>
							<label for="url">메인메뉴</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">subject</i>
							<textarea id="textarea1" class="materialize-textarea"
								name="content">${restaurant.content}</textarea>
							<label for="textarea1">내용</label>
						</div>
					</div>


					<div class="row" id="imageContainer">
						<div class="input-field col s12">
							<c:set var="restaurantImg" value="${restaurant.img}" />
							<c:if test="${fn:contains(restaurantImg,'https://')}">
								<h4>대표 이미지</h4>
								<img src="${restaurant.img}" alt="카드 이미지"
									style="height: 200px; width: 300px;">
								<input type="hidden" name="img" value="${restaurant.img}">

							</c:if>
							<c:if test="${not fn:contains(restaurantImg,'https://')}">
								<h4>대표 이미지</h4>
								<img src="/resources/restimages/${restaurant.img}" alt="카드 이미지"
									style="height: 200px; width: 150px;">
								<input type="hidden" name="img" value="${restaurant.img}">
							</c:if>
							<button type="button" class="btn-small waves-effect waves-light"
								id="imgUrlDelete1">이미지 삭제</button>
						</div>
					</div>

					<div id="imageResult" class="row">
							<div class="input-field col s12">
								<h4>업로드 이미지</h4>
							</div>
							<div class="input-field col s12">
							<div class="uploadResult">
								<ul></ul>
							</div>
							</div>
							<div class = "form-group uploadDiv">
								<input type="file" name="uploadFile" multiple="multiple">
								
							</div>
					</div>
					
					

					<div class="row center-align">
						<div class="col s12 l8 offset-l2">
							<div class="col s6">
								<button id="btnModify" data-oper='modify' type="submit" class="btn-large waves-effect waves-light">
									<i class="material-icons left">file_upload</i> 정보 수정
								</button>
							</div>
							<div class="col s6">
								<a class="btn-large waves-effect waves-light"
									href="/restaurant/list"> <i class="material-icons left">list</i>
									글목록
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
    	
    	
    	var imageContainer = document.querySelector('#imageContainer');
    	var imgUrlDelete1 = document.querySelector('#imgUrlDelete1');
    	
    	imgUrlDelete1.addEventListener('click', function() {
    		
    		var input = `
    		<div class="input-field col s12">
				<i class="material-icons prefix">subject</i>
				<input type="text"
					id="img" class="validate" name="img"><label for="img">메인이미지 url</label>
			</div>
    		
    		<div class="file-field input-field col s12">
				<div class="btn">
				<span><i class="material-icons left">attach_file</i>첨부 파일</span>
					<input type="file" name="listImage" multiple>
				</div>
				<div class="file-path-wrapper">
					<input type="text" class="file-path validate">
				</div>
				<span class="helper-text">이미지 주소 혹은 대표이미지 파일을 업로드 해주세요</span>
			</div>
			`;
    		imageContainer.innerHTML = input;
    	});
    	
    </script>
    
    <!-- 파일 업로드 로직 -->
	<script>

	$(document).ready(function() {
		
		(function() {
		$.ajax({
			type : "get",
			url : "/upload/attachlist",
			data : {"rid" : ${restaurant.rid}}
		})
		.done(function(resp){
			alert(resp);
			/* resp=JSON.parse(resp) */
			var str = "";
			$.each(resp, function(key, attach){ //clist
				
					var fileCallPath = attach.uploadpath + "/" + attach.uuid + "_" + attach.filename;
					str += "<li data-path='"+attach.uploadpath+"'";
					str += " data-uuid='"+attach.uuid+"' data-fileName='"+attach.filename+"'>";
					str += " <div>";
					str += "<img src='/resources/restimages/" + fileCallPath + "'>";
					str += "</div>";
					str += "<span>" + attach.filename + "</span>";
					str += "<button type='button' data-file='"+fileCallPath+"' class='btn right5'>X</button>"
					str += "</li>";
			})
			$(".uploadResult ul").html(str);
		})
		.fail(function(e){
			alert("실패")
		})
	})();
	})
    
    $(".uploadResult").on("click", "button", function(e){
    	   console.log("delete file");
    	   if (confirm("이미지를 삭제하시겠습니까?")) {
    	      var targetLi = $(this).closest("li");
    	      targetLi.remove();
    	   }
    });
    
    $("input[type='file']").change(function(e){
		var formData = new FormData(); // Json 데이터로 보낼 객체 생성
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
				
		for (var i = 0; i < files.length; i++) {
			formData.append("uploadFile", files[i]);
		}	// 파일 개수만큼 업로드 파일로 저장한다.
    
		$.ajax({
		    url: '/upload/imagelist',
		    processData: false,
		    contentType: false,
		    data: formData,
		    type: 'POST',
		    dataType: 'json',  
		    success: function(result){
		        console.log(result); 
		        imageUploadResult(result);
		        // 이미지 추가후에 이미지 화면에 반영하는 함 
		    }
		});
    });
    
    function imageUploadResult(uploadResultArr) {
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}
		str = "";
		$.each(uploadResultArr, function(key, image){
			
			var fileCallPath = image.uploadpath + "/" + image.uuid + "_" + image.filename;
			str += "<li data-path='"+image.uploadpath+"'";
			str += " data-uuid='"+image.uuid+"' data-fileName='"+image.filename+"'>";
			str += " <div>";
			str += "<img src='/resources/restimages/" + fileCallPath + "'>";
			str += "</div>";
			str += "<span>" + image.filename + "</span>";
			str += "<button type='button' data-file=/'"+fileCallPath+"/' class='btn right5'>X</button>"
			str += "</li>";
		})
		$(".uploadResult ul").append(str);	
		
	}
    </script>
    <script>
    var form = $("form");
    
    $("button").on("click", function(e) {
    	
    	 e.preventDefault();
    	 var operation = $(this).data("oper")
    	 if (operation === 'modify') {
    	 var str = "";
         
         $(".uploadResult ul li").each(function(i,attach) {
            var attachVO = $(attach);
            
            str += "<input type='hidden' name='attachList["+i+"].filename' value='"+attachVO.data("filename")+"'>";
            str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+attachVO.data("uuid")+"'>";
            str += "<input type='hidden' name='attachList["+i+"].uploadpath' value='"+attachVO.data("path")+"'>";
         });
         form.append(str).submit();
      }

      form.submit();  //폼 전송
   });
    
    
    </script>
</body>

</html>





