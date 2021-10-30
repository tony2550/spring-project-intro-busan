<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 앱키 : 4fd6e300f3d3dba7b4f88c0d1df3b4ab -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>geolocation으로 마커 표시하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')"> 혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
		</em>
	</p>

	<div id="map" style="width: 500px; height: 350px;"></div>





	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4fd6e300f3d3dba7b4f88c0d1df3b4ab&libraries=services"></script>


	<!-- 지도 그리기 자바스크립트 -->
	<script>
document.cookie = "crossCookie=bar; SameSite=None; Secure";

<!-- 현재 내 위치 좌표구하기 및 표시를 위한 자바스크립트 --> 
////////////////////////////////////////////////////////////////////////////

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨 
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
    		url :"/checkCoords/",
    		contentType : "application/json;charset=utf-8"
    		
    	})//ajax
    	.done(function(resp){
    		alert("성공")
    		location.href="/restaurant/qnaBoard"
    		
    	})
    	.fail(function(resp){
    		alert("수정실패")

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

//거리 구하기 함수
function getdistanceBTW2loactions(location1,location2){
	
}

</script>


</body>
</html>
