<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="proj.stepUp.vo.UserVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
	<style type="text/css">

	</style>
</head>

<body style="background-color: #fafafa;">
	<main class="joinoklogo">
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="<%=request.getContextPath()%>/">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
		<article id="joinok">	
			<i class="xi-check"></i>		
			<p class="mt-3">회원탈퇴가 완료되었습니다.</p>
			<p>이용해주셔서 감사합니다.
             	<br/>
                                     보다 나은 서비스로 다시 찾아 뵙겠습니다.
            <p>
			<button type="button" id="joid_btn" onclick="location.href='<%=request.getContextPath() %>/'">홈으로 가기</button>			
		</article><!--end:#joinok-->
	</main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
</body>
</html>
