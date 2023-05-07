<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>We Are</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main>
		<article id="about_contain">
			<p id="main_logo"></p><br>
			<div class="about_line"></div>
			<section class="about_top">
	            <div class="about_title">
	                <h2>ABOUT COMPANY</h2>
	            </div>
	            <div>
	                <p>저희 Step Up은 여러분께 최고의 신발들을 제공하며</p>
	                <p>항상 발걸음을 더욱 편안하게 만들어드리는 것을 목표로 하고있습니다.</p>
	                <p>고객님께서 편안하게 원하는 선택을 할 수 있도록</p>
	                <p>다양한 제품들을 보여드리는</p>
	                <p>온라인 쇼핑몰을 운영하고 있습니다.</p>
	                <p>함께 걸어갈 수 있는 Step Up과 함께라면</p>
	                <p>즐거운 쇼핑과 만족스러운 제품을 경험하실 수 있습니다.</p>
	            </div>
	            <div class="about_title">
	                <h2 class="at2">Contact Us</h2>
	            </div>
	            <div class="bottomblank">
	            	<p>(주)스텝업 / 대표자: 이상훈, 곽진훈, 조범준, 배유진 </p>
	            	<p>주소 : 전라북도 전주시 덕진구 백제대로 572 5층 ( 전라북도 전주시 덕진구 금암동 667-52 ) </p>
	            	<p>전화번호 : 0507-1410-2381
	            </div>
	            <p id="weare_img"></p>
            </section> 
		</article>
    </main>
<%@include file="../include/footer.jsp"%>
</body>
</html>