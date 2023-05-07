<%@page import="proj.stepUp.util.PagingUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="proj.stepUp.vo.MarkVO" %>
<%@ page import="proj.stepUp.vo.ProductVO" %>
<%@ page import="proj.stepUp.vo.UserVO" %>
<%@ page import="proj.stepUp.vo.SearchVO" %>
<%@ page import="java.util.*" %>
<% 
	List<MarkVO> blist = (List<MarkVO>)request.getAttribute("blist");
	PagingUtil paging = (PagingUtil)request.getAttribute("paging");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심목록</title>
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

            <article id="mypage_contain"><!--관심목록 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                      	  관심목록
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 관심있는 상품을 모아볼 수 있습니다.
                    </p>
                </div>

                <div class="mplikecontain">
                    <div class="like-items">
                        <div class="main-brandBest-items-area">
                            
			                <ul id="cnt_list">
				               	<c:forEach var="markPrd" items="${blist}">
   								<c:set var="BrandCode" value="${fn:substring(markPrd.prdCode,0,2)}"/>
   								
   								<!-- input type="hidden" name="prdIndex" value="${login.userId}" -->
   								
				                    <li class="cnt_info">

			                            <div class="likeheart">
									       <div class="xi-heart" id="mark" onclick="change(${markPrd.prdIndex})"></div>
			                            </div>
			                             
				                        <a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${markPrd.prdIndex}">
				                        <div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${markPrd.prdRname})"></div></p>
				                            <P class="cnt_brand">
				                            	<span>
							                         <c:choose>
							                         	<c:when test='${BrandCode eq "NK"}'>NIKE</c:when>
							                         	<c:when test='${BrandCode eq "AD"}'>ADIDAS</c:when>
							                         	<c:when test='${BrandCode eq "VS"}'>VANS</c:when>
							                         	<c:when test='${BrandCode eq "CV"}'>CONVERSE</c:when>
							                         	<c:when test='${BrandCode eq "PM"}'>PUMA</c:when>
							                         	<c:when test='${BrandCode eq "FL"}'>FILA</c:when>
							                         	<c:when test='${BrandCode eq "CR"}'>CROCS</c:when>
							                         	<c:when test='${BrandCode eq "NB"}'>NEWBALANCE</c:when>
							                         </c:choose>	                                    
				                            	</span>
				                            </P>
				                            <P class="cnt_name"><span>${markPrd.prdName}</span></P>
				                            <P class="cnt_prc"><span><fmt:formatNumber value="${markPrd.prdPrice}" pattern="#,###"/>원</span></P>
				                        </a>
				                    </li>
				                </c:forEach>
			                </ul>
                        </div>
                    </div>
                </div>

                <div id="mplikepage" class="board_page">
						<%  
							// 페이징 출력 영역
							if(paging.getStartPage()> 1){
						%>
							<a href="mypage_like.do?nowPage=<%= paging.getStartPage()-1%>"> &lt;&lt; </a>
						<%		
							}
				
							for(int i = paging.getStartPage(); i<=paging.getEndPage(); i++){
							
								if(paging.getNowPage() != i){
						%>
							<a href="mypage_like.do?nowPage=<%= i %>"> <%= i %> </a>	
						<%
								}else{
						%>
							<b><%= i %></b>
							
						<%	
								}
							}
							
							if(paging.getEndPage() < paging.getLastPage()){
						%>	
							<a href="mypage_like.do?nowPage=<%= paging.getEndPage()+1%>"> &gt;&gt; </a>
						<%
							}
						%>
                </div>

            </article><!--관심목록 페이지 끝-->
        </div>
	</main>
	<%@ include file="../include/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>

	//찜버튼 변경 스크립트
    function change(prdindex){
    	let userIndex = "<c:out value='${login.userIndex}'/>";
    	let prdIndex = prdindex;
    	if(confirm("해당 상품을 관심 목록에서 삭제 하시겠습니까?") != 1){
    		return false;
    	}
   		$.ajax({
   			url:"<%=request.getContextPath()%>/ajax/removeMark.do",
   			type:"post",
   			data:{userIndex : userIndex, prdIndex : prdIndex},
   			success : function(){
   				alert("관심목록에서 해당 상품이 삭제되었습니다.");
   				window.location.reload();
   			}
   		});
    }

	
	</script>

</body>
</html>
