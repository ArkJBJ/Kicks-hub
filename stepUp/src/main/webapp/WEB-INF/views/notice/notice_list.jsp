<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="proj.stepUp.util.PagingUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="proj.stepUp.vo.NoticeBoardVO"%>
<%@page import="proj.stepUp.vo.SearchVO"%>
<% 
	List<NoticeBoardVO> blist = (List<NoticeBoardVO>)request.getAttribute("blist");
	PagingUtil paging = (PagingUtil)request.getAttribute("paging");
	SearchVO svo = (SearchVO)request.getAttribute("svo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 게시판</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main><!--메인 시작-->
        <article id="board_contain">
            <div class="board_title">공지사항 게시판</div>
            <table class="nomal_board">
                <thead>
                    <tr>
                        <th class="boardNum">번호</th>
                        <th class="boardTtl">제목</th>
                        <th class="wDate">작성일</th>
                        <th class="wID">작성자</th>
                    </tr>
                </thead>
              <tbody>
                 <c:forEach var="vo" items="${blist}" begin="${(paging.nowPage*15)-15}" end="${(paging.nowPage*15) -1}">
                    <tr>
                        <td><span>${vo.noticeIndex}</span></td>
                        <td><a href="notice_view.do?noticeIndex=${vo.noticeIndex}"><div>${vo.noticeTitle}</div></a></td>
                        <td><span>
                        <% 
                                Date date = new Date();
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String nowDate = sdf.format(date);
                                NoticeBoardVO dbWDate = (NoticeBoardVO)pageContext.getAttribute("vo");
                                String dbDate = dbWDate.getNoticeWdate().substring(0,10);
                                String dbTime = dbWDate.getNoticeWdate().substring(11, 16);
                                if (nowDate.equals(dbDate)) {
                                    out.print(dbTime);
                                }else{
                                    out.print(dbDate);
                                }
                        %>
                        </span></td>
                        <td><span>관리자</span></td>
                    </tr>
                 </c:forEach>
                </tbody>
                <tfoot>
                     <tr class="board_page">
                       <td colspan="5">
				<%  
				// 페이징 출력 영역
				if(paging.getStartPage()> 1){
				%>
				<a href="notice.do?nowPage=<%= paging.getStartPage()-1%>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <i class="xi-angle-left"></i> </a>
				<%		
				}
				for(int i = paging.getStartPage(); i<=paging.getEndPage(); i++){
				if(paging.getNowPage() != i){
				%>
				<a href="notice.do?nowPage=<%= i %>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <%= i %> </a>	
				<%
				}else{
				%>
				<b><%= i %></b>
				<%	
				}
				}
				if(paging.getEndPage() < paging.getLastPage()){
				%>	
				<a href="notice.do?nowPage=<%= paging.getEndPage()+1%>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <i class="xi-angle-right"></i> </a>
				<%
				}
				%>
			</td>
                    </tr>
                    <tr>
                        <td class="board_search" colspan="5">
                           <form name="frm" action="<%=request.getContextPath()%>/notice/notice.do" class="search_select" method="get">
                                <div>
                                    <select name="searchType" class="search_css">
                                        <option value="title" selected>제목</option>
                                        <option value="content">내용</option>
                                    </select>
                                    <input type="text" name=searchValue class="keyword" required="" placeholder="검색어를 입력하세요.">
                                    <button class="srch-bt" >검 색</button>
					<c:if test="${not empty login }">
					<c:if test="${login.userGrade == 'A'}">
					<input type="button" class="board_Write" value="글쓰기" onclick="location.href='notice_write.do'">
					</c:if>
					</c:if>
                                </div>
                            </form>  
                        </td> 
                    </tr>
                </tfoot>
            </table>
        </article>
	</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
