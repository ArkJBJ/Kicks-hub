<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="proj.stepUp.vo.QnaVO"%>
<%@page import="proj.stepUp.util.PagingUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="proj.stepUp.vo.SearchVO"%>
<% 
	List<QnaVO> blist = (List<QnaVO>)request.getAttribute("blist");
	PagingUtil paging = (PagingUtil)request.getAttribute("paging");
	SearchVO svo = (SearchVO)request.getAttribute("svo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA게시판</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main><!--메인 시작-->
        <article id="board_contain">
            <div class="board_title">QnA게시판</div>
            <table class="nomal_board">
                <thead>
                    <tr>
                        <th class="boardNum">번호</th>
                        <th class="boardTtl">제목</th>
                        <th class="wDate">작성일</th>
                        <th class="wID">작성자</th>
                        <th class="boardHit">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                 <c:forEach var="vo" items="${blist}" begin="${(paging.nowPage*15)-15}" end="${(paging.nowPage*15) -1}">
                    <tr>
                        <td><span>${vo.qnaIndex}</span></td>
                        <td><a href="qna_view.do?qnaIndex=${vo.qnaIndex}"><div>${vo.qnaTitle}</div></a></td>
                        <td><span>
                        <% 
                                Date date = new Date();
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                String nowDate = sdf.format(date);
                                QnaVO dbWDate = (QnaVO)pageContext.getAttribute("vo");
                                String dbDate = dbWDate.getQnaWdate().substring(0,10);
                                String dbTime = dbWDate.getQnaWdate().substring(11, 16);
                                if (nowDate.equals(dbDate)) {
                                    out.print(dbTime);
                                } else {
                                    out.print(dbDate);
                                }
                        %>
                        </span></td>
                        <td><span>${vo.userNick}</span></td>
                        <td><span>${vo.qnaRsp}</span></td>
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
							<a href="qna.do?nowPage=<%= paging.getStartPage()-1%>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <i class="xi-angle-left"></i> </a>
						<%		
							}
							for(int i = paging.getStartPage(); i<=paging.getEndPage(); i++){
								if(paging.getNowPage() != i){
						%>
							<a href="qna.do?nowPage=<%= i %>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <%= i %> </a>	
						<%
							}else{
						%>
							<b><%= i %></b>
						<%	
							}
							}
							if(paging.getEndPage() < paging.getLastPage()){
						%>	
							<a href="qna.do?nowPage=<%= paging.getEndPage()+1%>&searchType=${svo.searchType}&searchValue=${svo.searchValue}"> <i class="xi-angle-right"></i> </a>
						<%
							}
						%>
    		    </td>
                    </tr>
                    <tr>
                        <td class="board_search" colspan="5">
                           <form name="frm" action="<%=request.getContextPath()%>/qna/qna.do" class="search_select" method="get">
                                <div>
                                    <select name="searchType" class="search_css">
                                        <option value="title" selected>제목</option>
                                        <option value="content">내용</option>
                                        <option value="writer">작성자</option>
                                    </select>
                                    <input type="text" name=searchValue class="keyword" required="" placeholder="검색어를 입력하세요.">
                                    <button class="srch-bt" >검 색</button>
				        <c:if test="${not empty login }">
                                    	<input type="button" class="board_Write" value="글쓰기" onclick="location.href='qna_write.do'">
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
