<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="proj.stepUp.vo.QnaVO" %>
<%@page import="proj.stepUp.util.PagingUtil"%>
<%
	List<QnaVO> blist = (List<QnaVO>)request.getAttribute("blist");
	PagingUtil paging = (PagingUtil)request.getAttribute("paging");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA 답변대기 리스트</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/admin.do">슬라이더 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/restrict.do">회원 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/qna/qna_rspList.do">QnA 답변대기 리스트</a></span>
                    <span><a href="<%=request.getContextPath()%>/order/manager.do">주문내역 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/product/management.do">상품관리</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->
            <article id="mypage_contain"><!--관심목록 페이지 시작-->
                 <div id="mypage_title">
                    <h2>QnA 답변대기 리스트</h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 QnA 게시판 중 답변이 완료되지 않은 게시물들 입니다.
                    </p>
                </div>
                <div class="mplikecontain">
	                <table class="order_board" style="font-family:'SpoqaHanSansNeo-Regular';">
	                    <thead>
	                        <tr>
	                            <th class="postNume">번호</th>
	                            <th class="postTitle">제목</th>
	                            <th class="postwDate">작성일</th>
	                            <th class="postHit">답변</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    <c:forEach var="vo" items="${blist}" begin="${(paging.nowPage*10)-10}" end="${(paging.nowPage*10) -1}">
	                        <tr>
	                            <td><span>${vo.qnaIndex}</span></td>
	                            <td><a href="<%= request.getContextPath() %>/qna/qna_view.do?qnaIndex=${vo.qnaIndex}"><div>${vo.qnaTitle}</div></a></td>
	                            <td><span>
		                        <% 
		                                Date date = new Date();
		                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		                                String nowDate = sdf.format(date);
		                                QnaVO dbWDate = (QnaVO)pageContext.getAttribute("vo");
		                                String dbDate = dbWDate.getQnaWdate().substring(0,10);
		                                String dbTime = dbWDate.getQnaWdate().substring(11, 16);
		                                if(nowDate.equals(dbDate)){
		 	                               out.print(dbTime);
		                                }else{
		                                    out.print(dbDate);
		                                }
		                        %>
	                       		 </span></td>
	                            <td><span>${vo.qnaRsp}</span></td>
	                        </tr>
	                      </c:forEach>
	                    </tbody>
	                    <tfoot>
	                        <tr class="order_page" >
	                            <td colspan="5">
					<%  
					// 페이징 출력 영역
					if(paging.getStartPage()> 1){
					%>
					<a href="qna_rspList.do?nowPage=<%= paging.getStartPage()-1%>"> &lt;&lt; </a>
					<%		
					}
					for(int i = paging.getStartPage(); i<=paging.getEndPage(); i++){
					if(paging.getNowPage() != i){
					%>
					<a href="qna_rspList.do?nowPage=<%= i %>"> <%= i %> </a>	
					<%
					}else{
					%>
					<b><%= i %></b>
					<%	
					}
					}
					if(paging.getEndPage() < paging.getLastPage()){
					%>	
					<a href="qna_rspList.do?nowPage=<%= paging.getEndPage()+1%>"> &gt;&gt; </a>
					<%
					}
					%>
					</td>
	                        </tr>
	                    </tfoot>
	                </table>
            </article>
        </div>
	</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
