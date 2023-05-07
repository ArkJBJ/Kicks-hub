<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 후기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
 	<%@ include file="../include/header.jsp" %>
 	
    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/order/user.do">주문배송조회</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심있는 상품</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_sns.do">SNS연결설정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->
            
            <article id="mypage_contain"><!--상품후기 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	상품후기
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 구매하신 상품에 대한 유용한 정보를 다른 고객과 공유하는 곳으로 솔직 담백한 상품후기를 올려주세요.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	배송정보[출고완료]이후부터 작성하실 수 있습니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	취소/반품/교환의 경우 해당상품의 후기 및 적립된 마일리지는 자동삭제 됩니다.
                    </p>
                </div>

                <article><!--구매내역 및 후기작성-->
                    <table class="review_board" style="font-family: 'SpoqaHanSansNeo-Regular';">
                        <thead>
                            <tr>
                                <th class="revinfo" colspan="2">상품정보</th>
                                <th class="revwDate">상품 가격</th>
                                <th class="revprice">후기 작성일</th>
                                <th class="revwrite">후기 작성</th>
                            </tr>
                        </thead>
                        <tbody id="reviewArea">                           
                        </tbody>
                    </table>
                    <ul id="order_page" class="mt-3">
                    </ul>
                </article>

            </article>
        </div>
		  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				   <div>
					  <input type="hidden" name="reviewIndexs" id="reviewModifyIndex" value=""/>
			          <textarea id="review_writeCnt" class="reviewModifyCnt" name="reviewContent" placeholder="상품평을 남겨주세요"></textarea>
			          <div id="rating_ctn">
			              <span>별점을 남겨주세요</span>
			              <div class="star-rating">
			                  <input type="radio" id="5-starse" name="reviewScores" class="5-modifyStars" value="5"/>
			                  <label for="5-starse" class="star">&#9733;</label>
			                  <input type="radio" id="4-starse" name="reviewScores" class="4-modifyStars" value="4"/>
			                  <label for="4-starse" class="star">&#9733;</label>
			                  <input type="radio" id="3-starse" name="reviewScores" class="3-modifyStars" value="3"/>
			                  <label for="3-starse" class="star">&#9733;</label>
			                  <input type="radio" id="2-starse" name="reviewScores" class="2-modifyStars" value="2"/>
			                  <label for="2-starse" class="star">&#9733;</label>
			                  <input type="radio" id="1-starse" name="reviewScores" class="1-modifyStars" value="1"/>
			                  <label for="1-starse" class="star">&#9733;</label>
			              </div>
			          </div>
				  </div>		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="modify()">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 수정버튼 클릭시 모달창 영역 end -->                
	</main>
	
	<%@ include file="../include/footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script>
    function searchMyReview(nowPage){//상품 리스트ajax호출 함수
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/searchMyReview.do",
    		type:"get",
    		data:{
    			nowPage : nowPage
    			},
    		success:function(data){
    			let reviewHtml='';
    			for(let i=0; i < data.length; i++){
    				let reviewList = data[i];
    				let price = new Intl.NumberFormat('ko-kr').format(reviewList.prdPrice);
    				let reviewDate = moment(reviewList.reviewDate).format('YYYY-MM-DD');
    				let brandCode = reviewList.prdCode.substring(0, 2);
					let brand = brandCode == 'NK' ? 'NIKE':brandCode == 'AD' ? 'ADIAS':brandCode == 'VS' ? 'VANS':
						brandCode == 'CV' ? 'CONVERSE':brandCode == 'PM' ? 'PUMA':brandCode == 'FL' ? 'FILA':
						brandCode == 'CR' ? 'CROCS':brandCode == 'NB' ? 'NEW BLANCE':"";
    				reviewHtml += '<tr>';
    				reviewHtml += '<td class="cnt_info">';
    				reviewHtml += '<a href="<%=request.getContextPath()%>/product/view.do?prdIndex='+reviewList.prdIndex+'">';
    				reviewHtml += '<div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/'+reviewList.prdRname+')"></p></div>';
    				reviewHtml += '</a>';
    				reviewHtml += '</td>';
    				reviewHtml += '<td class="cnt_info">';	    					    				
    				reviewHtml += '<a href="<%=request.getContextPath()%>/product/view.do?prdIndex='+reviewList.prdIndex+'">';	    					    				
    				reviewHtml += '<P class="cnt_brand"><span>NIKE</span></P>';	    					    				
    				reviewHtml += '<P class="cnt_name"><span>'+reviewList.prdName+'</span></P>';	    					    				
    				reviewHtml += '<P class="cnt_size"><span>'+reviewList.prdCode+'</span></P>';	    					    				
    				reviewHtml += '</a>';	    					    				
    				reviewHtml += '</td>';	    					    				
    				reviewHtml += '<td><span>'+price+'원</span></td>';	    					    				
    				reviewHtml += '<td><span>'+reviewDate+'</span></td>';	    					    				
    				reviewHtml += '<td>';	    					    				
    				reviewHtml += '<input class="review_edit" type="button" value="수정" onclick="modaltest('+reviewList.reviewIndex+')">';	    					    				
    				reviewHtml += '<input class="review_del" type="button" value="삭제" onclick="reviewDel('+reviewList.reviewIndex+')">';	    					    				
    				reviewHtml += '</td>';	    					    				
    				reviewHtml += '</tr>';	    					    				
    			}
    			paging(nowPage)
    			$("#reviewArea").html(reviewHtml);
    		}
    	});
    }
    
    function paging(nowPage){//페이징 버튼 ajax 처리 함수
    	let pagingHtml = '';
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/myReviewPaging.do",
    		type:"get",
    		data:{
    			nowPage : nowPage
    			},
    		success: function(data) {
			let startPage = Number(data.startPage);
			let endPage = Number(data.endPage);
			let perPage = Number(data.perPage);
			let total = Number(data.total);
			let now = Number(data.nowPage);
			let lastPage = Number(data.lastPage);
	    	pagingHtml += '<li class="d-flex justify-content-center">';
	    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="searchPrdList('+(now - 1)+')" style= "display:'+(now != 1 ? 'block' : 'none')+'"></a>';
	    	pagingHtml += '<div id="pagingNumBtn">';
	    	for(let i = startPage; i <= endPage; i ++){
	    		if(now != i){
	    			pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="searchPrdList('+i+')">'+i+'</a>';
	    		}else{
	    			pagingHtml += '<span class="pe-1 text-primary" id="nowPage">'+i+'</span>';
	    		}
	    	}
	    	pagingHtml += '</div> ';
	    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="searchPrdList('+(now+ 1)+')" style= "display:'+(now != lastPage && lastPage != 0 ? 'block' : 'none')+'"></a>';
	    	pagingHtml += '</li>';
	    	$("#order_page").html(pagingHtml);
	    		}
    	});
    }
    
    $(document).ready(function(){
    	searchMyReview(1);
    });
    
    function modaltest(reviewIndex){
    	$('#staticBackdrop').modal('show');
    	$.ajax({
			url:"<%=request.getContextPath()%>/ajax/reviewModify.do",
			type:"get",
			data:{
				reviewIndex : reviewIndex
			},
			success:function(data){
				$(".reviewModifyCnt").val(data.reviewContent);
				$("#reviewModifyIndex").val(data.reviewIndex);
				if(data.reviewScore == 5){
					$(".5-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 4){
					$(".4-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 3){
					$(".3-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 2){
					$(".2-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 1){
					$(".1-modifyStars").prop("checked", true);
				}
			}
		})
    }
    
    function modify(){
    	let reviewIndex = $("#reviewModifyIndex").val();
    	let reviewContent = $(".reviewModifyCnt").val();
    	let reviewScore = $("input[name=reviewScores]:checked").val();
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/modify.do",
    		type:"post",
    		data:{
    			reviewIndex : reviewIndex,
    			reviewContent : reviewContent,
    			reviewScore : reviewScore
    		},
    		success:function(data){
    			if(data == 1){
    				$('#staticBackdrop').modal('hide');
    				alert("댓글이 수정되었습니다.");
    				let nowPage = $("#nowPage").html();
    				searchMyReview(nowPage);	
    			}
    		}
    	})
    }
    
 	function reviewDel(reviewIndex){
    	if(confirm("해당 리뷰를 삭제하시겠습니까?") == 0){
    		return false;
    	}
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/delete.do",
    		type:"post",
    		data:{
    			reviewIndex : reviewIndex
    		},
    		success:function(data){
    			if(data == 1){
    				let nowPage = $("#nowPage").html();
    				searchMyReview(nowPage);
    			}
    		}
    	})
    }    
    </script>
</body>
</html>