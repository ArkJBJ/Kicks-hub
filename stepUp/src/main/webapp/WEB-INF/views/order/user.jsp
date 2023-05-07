<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>
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
                    <p>안녕하세요, ${login.userNick} 님!</p>
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

            <article id="mypageod_contain"><!--주문배송조회 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	주문배송조회
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        [주문번호] 및 [주문상품]을 클릭하시면 주문상세 내역 및 상품별 배송상황을 조회하실 수 있으며, 취소/교환/반품 신청도 가능합니다.
                    </p>
                </div>

                <table class="order_board" style="font-family: 'SpoqaHanSansNeo-Regular';">
                    <thead>
                        <tr>
                            <th class="orderNum">주문번호</th>
                            <th class="orderwDate">주문일자</th>
                            <th class="orderproduct">주문상품</th>
                            <th class="totalPrice">총 구매금액</th>
                            <th class="orderstate">주문상태</th>
                        </tr>
                    </thead>
                    <tbody id="orderList">                        
                    </tbody>
                </table>
				<div id="order_paging" class="mt-3"></div>
                <div class="orderhelp"><!--도움말?-->
                    <div>HELP</div>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        주문건별 배송상태에 대한 설명입니다. 각 단계에 따라 주문하신 분께 확인메일 및 SMS를 발송해드립니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        주문이 정상완료 되지 않으면 내역조회가 되지 않습니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        배송조회는 상품이 출고된 날의 익일 오전부터 가능합니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        배송 시작일로부터 2일 경과후에도 택배추적이 되지 않을 경우, 고객센터로 연락 부탁드립니다.
                    </p>
                    <p><img src="<%=request.getContextPath()%>/resources/image/orderhelp.png"></p>
                </div>
            </article><!--주문배송조회 페이지 끝-->
        </div>
	</main>

	<%@ include file="../include/footer.jsp" %>
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
	<script type="text/javascript">
		function orderList(nowPage){
			let userIndex = "<c:out value='${login.userIndex}'/>";
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/userOrderList.do",
				type:"get",
				data:{
					nowPage : nowPage,
					userIndex : userIndex
				},
				success:function(data){
					let orderHtml='';
	    			for(let i=0; i < data.length; i++){
	    				let orderList = data[i];
	    				let totalPrice = new Intl.NumberFormat('ko-kr').format(orderList.orderTotalPrice);
	    				let orderDate = moment(orderList.orderDate).format('YYYY-MM-DD');
	    				let orderIndex = orderList.orderIndex;
	    				let orderStatus = orderList.orderStatus;
	    				orderHtml += '<tr>';
	    				orderHtml += '<td><span>'+orderList.orderNum+'</span></td>';
	    				orderHtml += '<td><span>'+orderDate+'</span></td>';
	    				orderHtml += '<td><a href="userOrderInfo.do?orderIndex='+orderIndex+'"><div>'+orderList.orderName+'</div></a></td>';
	    				orderHtml += '<td><span>'+totalPrice+'원</span></td>';
	    				if(orderStatus == "Y"){
	    					orderHtml += '<td>발송완료</td>';
	    				}else{
	    					orderHtml += '<td>발송대기</td>';
	    				}
	    				
	    				orderHtml += '</tr>';	    					    				    					    				
	    			}
	    			paging(nowPage);
	    			$("#orderList").html(orderHtml);
				}
			})
		}
	    function paging(nowPage){//페이징 버튼 ajax 처리 함수
	    	let pagingHtml = '';
	    	let userIndex = "<c:out value='${login.userIndex}'/>";
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/userOrderListPaging.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
					nowPage : nowPage,
					userIndex : userIndex
	    			},
	    		success: function(data) {
				let startPage = Number(data.startPage);
				let endPage = Number(data.endPage);
				let perPage = Number(data.perPage);
				let total = Number(data.total);
				let now = Number(data.nowPage);
				let lastPage = Number(data.lastPage);
		    	pagingHtml += '<li class="d-flex justify-content-center">';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="orderList('+(now - 1)+')" style= "display:'+(now != 1 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '<div id="pagingNumBtn">';
		    	for(let i = startPage; i <= endPage; i ++){
		    		if(now != i){
		    			pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="orderList('+i+')">'+i+'</a>';
		    		}else{
		    			pagingHtml += '<span class="pe-1 text-primary" id="now">'+i+'</span>';
		    		}
		    	}
		    	pagingHtml += '</div> ';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="orderList('+(now+ 1)+')" style= "display:'+(now != lastPage && lastPage != 0 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '</li>';
		    	$("#order_paging").html(pagingHtml);
		    		}
	    	});
	    }
	    
	 	//페이지 로드시 호출
	    $(document).ready(function(){
	    	orderList(1);
	    });
	</script>
</body>
</html>
