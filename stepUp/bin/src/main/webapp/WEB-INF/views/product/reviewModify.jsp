<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>reviewModify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
   <div>
      <form name="reviewFrm" action="<%=request.getContextPath()%>/review/modify.do" method="post">
	      <input type="hidden" name="reviewIndex" value="${reviewVO.reviewIndex}"/>
          <textarea id="review_writeCnt" name="reviewContent" placeholder="상품평을 남겨주세요">${reviewVO.reviewContent}</textarea>
          <div id="rating_ctn">
              <span>별점을 남겨주세요</span>
              <div class="star-rating">
                  <input type="radio" id="5-stars" name="reviewScore" value="5" <c:if test="${reviewVO.reviewScore eq 5}">checked</c:if>/>
                  <label for="5-stars" class="star">&#9733;</label>
                  <input type="radio" id="4-stars" name="reviewScore" value="4" <c:if test="${reviewVO.reviewScore eq 4}">checked</c:if>/>
                  <label for="4-stars" class="star">&#9733;</label>
                  <input type="radio" id="3-stars" name="reviewScore" value="3" <c:if test="${reviewVO.reviewScore eq 3}">checked</c:if>/>
                  <label for="3-stars" class="star">&#9733;</label>
                  <input type="radio" id="2-stars" name="reviewScore" value="2" <c:if test="${reviewVO.reviewScore eq 2}">checked</c:if>/>
                  <label for="2-stars" class="star">&#9733;</label>
                  <input type="radio" id="1-star" name="reviewScore" value="1" <c:if test="${reviewVO.reviewScore eq 1}">checked</c:if>/>
                  <label for="1-star" class="star">&#9733;</label>
              </div>
              <button>수정</button>
          </div>
      </form>
  </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</body>
</html>
