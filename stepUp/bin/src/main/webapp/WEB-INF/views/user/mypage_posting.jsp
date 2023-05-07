<%@page import="proj.stepUp.util.PagingUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="proj.stepUp.vo.FreeBoardVO" %>
<%@ page import="java.util.*" %>
<% 
	List<FreeBoardVO> blist = (List<FreeBoardVO>)request.getAttribute("blist");
	PagingUtil paging = (PagingUtil)request.getAttribute("paging");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 작성한 글</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    
    <script src="<%=request.getContextPath()%>/resources/JS/jquery-3.6.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[class=chk]").prop("checked", true);
				else $("input[class=chk]").prop("checked", false);
			});
			
			$("input[class=chk]").click(function() {
				var total = $("input[class=chk]").length;
				var checked = $("input[class=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
	</script>
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
            
            <article id="mypageod_contain"><!--내가 작성한 글 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	내가 작성한 글
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	회원님께서 작성하신 자유게시판의 글을 모아보실 수 있습니다.
                    </p>
                </div>
  				<form  name="delfrm" action="myposting_delete.do" method="post">
                <table class="order_board" style="font-family: 'SpoqaHanSansNeo-Regular';">
                    <thead>
                        <tr id="allcheck">
                            <td colspan="5">
                                <input class="poallch" type="checkbox" id="cbx_chkAll" name="poallcheck">전체선택
                                <input class="post_del"  type="button" value="삭제" onclick="if(confirm('정말로 삭제하시겠습니까?')) {document.delfrm.submit();}">
                            </td>
                        </tr>
                        <tr>
                            <th class="postCheck"></th>
                            <th class="postNume">번호</th>
                            <th class="postTitle">제목</th>
                            <th class="postwDate">작성일</th>
                            <th class="postHit">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="vo" items="${blist}">
                        <tr>
                            <td><input type="checkbox" name="freeIndex" value="${vo.freeIndex}" class="chk"></td>
                            <td><span>${vo.freeIndex}</span></td>
                            <td><a href="<%= request.getContextPath() %>/free/free_view.do?freeIndex=${vo.freeIndex}"><div>${vo.freeTitle}</div></a></td>
                            <td><span>
	                        <% 
	                                Date date = new Date();
	                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	                                String nowDate = sdf.format(date);
	
	                                FreeBoardVO dbWDate = (FreeBoardVO)pageContext.getAttribute("vo");
	                                String dbDate = dbWDate.getFreeWdate().substring(0,10);
	                                String dbTime = dbWDate.getFreeWdate().substring(11, 16);
	
	                                if (nowDate.equals(dbDate)) {
	                                    out.print(dbTime);
	
	
	                                } else {
	                                    out.print(dbDate);
	                                }
	                        %>
                       		 </span></td>
                            <td><span>${vo.freeHit}</span></td>
                        </tr>
                      </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr class="board_page" >
                            <td colspan="5">
								<%  
									// 페이징 출력 영역
									if(paging.getStartPage()> 1){
								%>
									<a href="mypage_posting.do?nowPage=<%= paging.getStartPage()-1%>"> &lt;&lt; </a>
								<%		
									}
						
									for(int i = paging.getStartPage(); i<=paging.getEndPage(); i++){
									
										if(paging.getNowPage() != i){
								%>
									<a href="mypage_posting.do?nowPage=<%= i %>"> <%= i %> </a>	
								<%
										}else{
								%>
									<b><%= i %></b>
									
								<%	
										}
									}
									
									if(paging.getEndPage() < paging.getLastPage()){
								%>	
									<a href="mypage_posting.do?nowPage=<%= paging.getEndPage()+1%>"> &gt;&gt; </a>
								<%
									}
								%>
							</td>
                        </tr>
                    </tfoot>
                </table>
            </form>
            </article><!--내가 작성한 글 페이지 끝-->
        </div>
	</main>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>