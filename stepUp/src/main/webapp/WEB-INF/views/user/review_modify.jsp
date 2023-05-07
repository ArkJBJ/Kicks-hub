<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>review modify</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body width=800px>
    
    <div id="reviewpop_title">
        <h2>
            	상품후기 수정
        </h2>
        <p>
            <i class="xi-angle-right-min"></i>
            	구매하신 상품에 대한 유용한 정보를 다른 고객과 공유하는 곳으로 솔직 담백한 상품후기를 올려주세요.
        </p>
        <p>
            <i class="xi-angle-right-min"></i>
           	 취소/반품/교환의 경우 해당상품의 후기 및 적립된 마일리지는 자동삭제 됩니다.
        </p>
    </div>
        
    <article id="repopcontain"><!--작성하지 않은 리뷰-->
        <form id="myreview_write">
            <div class="review_writename">
                <a href="#" class="review_writename">
                    <P class="cnt_brand"><span>NIKE</span></P>
                    <P class="cnt_name"><span>레볼루션6 넥스트 네이처</span></P>
                    <P class="cnt_size"><span>사이즈 250</span></P>
                </a>
            </div>
            <a href="#" class="review_writeimg">
                <div><p class="cnt_img1" style="background-image:url(../../image/brand/Brand_cnt03.jpg)"></div></p>
            </a>
            <div class="review_writeproduct">
                <div class="review_writebox">
                    <textarea id="review_writeCnt"  placeholder="상품평을 남겨주세요"></textarea>
                    <div id="rating_ctn">
                        <span>별점을 남겨주세요</span>
                        <div class="star-rating">
                            <input type="radio" id="5-stars" name="rating" value="5" />
                            <label for="5-stars" class="star">&#9733;</label>
                            <input type="radio" id="4-stars" name="rating" value="4" />
                            <label for="4-stars" class="star">&#9733;</label>
                            <input type="radio" id="3-stars" name="rating" value="3" />
                            <label for="3-stars" class="star">&#9733;</label>
                            <input type="radio" id="2-stars" name="rating" value="2" />
                            <label for="2-stars" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="rating" value="1" />
                            <label for="1-star" class="star">&#9733;</label>
                        </div>
                        <button>등록</button>
                    </div>
                </div>
            </div>
        </form>
    </article>
    
</body>
</html>