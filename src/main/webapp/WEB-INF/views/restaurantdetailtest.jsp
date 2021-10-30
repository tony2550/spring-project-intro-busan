<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.rating .rate_radio + label {
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
.rating .rate_radio:checked + label {
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

.rating .rate_radio + label {
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
.rating .rate_radio:checked + label {
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

</style>


</head>

<body>
	
		<form 	>
		
		</form>
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
		<div align="right">
			<textarea rows="3" cols="50" id="msg"></textarea>
			<input type="button" value="댓글쓰기" class="btn btn-secondary  btn-sm" id="btnComment">
		</div>
		<hr />
		<div id="replyResult"></div>
	</div>






	

<!-- 별점 관련 자바스크립트 -->
<script>
//별점 마킹 모듈 프로토타입으로 생성

function Rating(){};
Rating.prototype.rate=0;

Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    console.log(typeof(newrate))
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
    /* 		댓글쓰기 */   

    $("#btnComment").click(function(){
    	alert("눌렀음")
    	/* if(${empty principal.user}){
    		alert("로그인하세요");
    		location.href="/login";
    		return;
    	} */
    	alert(newrate)
    	
    	
    	data={
    		"userId" : ${user.id},
    		"rId": ${restaurant.rid},
    		"content":$("#msg").val(),
    		"grade" : returnRating()
    	}
    	
    	function returnRating(){
    		 switch (String(newrate)){
    		    case "1" :
    		    	return "STAR1";
    		        break;
    		    case "2" :
    		    	return "STAR2";
    		        break;
    		    case "3" :
    		    	return "STAR3";
    		        break;
    		    case "4" :
    		    	return "STAR4";
    		        break;
    		    case "5" :
    		    	return "STAR5";
    		        break;
    		    default :
    		    	return " ";
    	}
    	
    	alert(returnRating());
    	
    	if($("#msg").val()==""){
    		alert("댓글을 적으세요");
    		return;
    	}
    		
    			
    		
    	}
    	$.ajax({
    		type:"POST",
    		url:"insert",
    		data : JSON.stringify(data),
    		contentType:"application/json;charset=utf-8"
    		
    	})

    	.done(function(){
    		alert("댓글 추가 성공");
    	})
    	
    	.fail(function(){
    		alert("댓글 추가 실패")
    	})
    })
}

let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        console.dir(elem);
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            
        }
    })
});




	/*  document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});   */
 
 Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
} 
</script>

<script type="text/javascript">

</script>
</body>

</html>