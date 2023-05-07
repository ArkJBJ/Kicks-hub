<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${vo.noticeTitle}</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main><!--메인 시작-->
        <article id="board_viewcontain">
            <ul id="board_view">
                <li id="board_viewTtl"><div>${vo.noticeTitle}</div></li>
                <li id="board_winfo">
                    <div> 관리자 </div><p>${vo.noticeWdate}</p>
                </li>
                <li id="board_wctn">
                    ${vo.noticeCnt}	
                </li>
            </ul>
            <div>
   	           <input type="button" class="board_btn" value="돌아가기"	 onclick="location.href='notice.do'">
   	           <c:if test="${login ne null and login.userGrade eq 'A'}">
			<input type="button" class="board_btn" value="수 정" onclick="if(confirm('수정하시겠습니까?')) {location.href='notice_modify.do?noticeIndex=${vo.noticeIndex}'}">
			<input type="button" class="board_btn" value="삭 제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {document.delfrm.submit();}">
		        <form  name="delfrm" action="notice_delete.do" method="post">
		        	<input type="hidden" name="noticeIndex" value="${vo.noticeIndex}">
		        </form>
	           </c:if>
            </div>
        </article>
	</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
