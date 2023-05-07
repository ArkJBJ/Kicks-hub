<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <!-- ㅆㅁㄴㅌ 연결-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources//plugin/summernote/summernote-lite.js"></script>
    <script src="<%=request.getContextPath()%>/resources//plugin/summernote/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources//plugin/summernote/summernote-lite.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main>
        <article id="board_write">
            <div id="board_ttl">공지사항 글쓰기</div>
            <form method="post" action="notice_write.do">
                <input class="input_title" name="noticeTitle" type="text" placeholder="제목을 입력해주세요">
                <textarea id="summernote"  name="noticeCnt"></textarea>
                <div id="board_button">
                    <input type="submit" value="저 장" onclick="return confirm('저장하시겠습니까?')">
                    <input type="button" value="돌아가기" onclick="location.href='notice.do'">
                </div>
            </form>
        </article> 
        <script>
            $(document).ready(function() {
            //여기 아래 부분
            $('#summernote').summernote({
                  height: 450,                 // 에디터 높이
                  minHeight: null,             // 최소 높이
                  maxHeight: null,             // 최대 높이
                  focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
                  lang: "ko-KR",			   // 한글 설정
            });
        });
        </script>
    </main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
