<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>위치</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
   <main>
 	 <!-- 카카오 지도 api 연결 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90cd4288b59eb830e2ac6b35fb062a16"></script>
	    	<article id="about_contain">
		        <p id="main_logo"></p><br>
		 	    <div class="about_line"></div>	    
		        <section class="about_top">
		            <div class="about_title">
		                <h2>찾아오시는 길</h2>
		            </div>
		            <div class="bottomblank">
		            	주소 : 전라북도 전주시 덕진구 백제대로 572 5층 ( 전라북도 전주시 덕진구 금암동 667-52 )
		            </div>
		            <div id="map" style="width:100%; height:650px;"></div>
		        </section>
	    	</article>
	    	    <script>
		    	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    	    mapOption = { 
		    	        center: new kakao.maps.LatLng(35.8402745924536, 127.132495283655), // 지도의 중심좌표
		    	        level: 3 // 지도의 확대 레벨
		    	    };
  		    	    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		    	    // 마커를 표시할 위치입니다 
			    var position =  new kakao.maps.LatLng(35.8402745924536, 127.132495283655);
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			    position: position,
			    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			    });
			    // 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
			    // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			    // marker.setClickable(true);
			    // 마커를 지도에 표시합니다.
			    marker.setMap(map);
			    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			    var iwContent = '<div style="padding:5px;">StepUp</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			    // 인포윈도우를 생성합니다
			    var infowindow = new kakao.maps.InfoWindow({
			    content : iwContent,
			    removable : iwRemoveable
			    });
			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			    // 마커 위에 인포윈도우를 표시합니다
			    infowindow.open(map, marker);  
			    });
			    </script>
	    </main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
