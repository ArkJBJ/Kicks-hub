package proj.stepUp.util;

public class PagingUtil {
	
	private int nowPage; // 현재페이지
	
	private int startPage; // 시작하는 페이지 번호
	
	private int endPage; //종료페이지
	
	private int total; // 전체 게시글 수
	
	private int perPage; // 한 화면당 보여질 게시글 수
	
	private int lastPage; // 전체 게시글을 바탕으로 최종페이지
	
	private int start; // 한 화면당 게시글 시작 번호
	
	private int end; // 한 화면당 게시글 종료 번호
	
	private int cntPage = 10; //화면에 보여질 페이징 갯수
	
	public PagingUtil(){}
	
	
	

	
	public PagingUtil(int total, int nowPage, int perPage) {
		
		setNowPage(nowPage);
		setTotal(total);
		setPerPage(perPage);
		
		// 최종페이지 계산 메소드 호출
		calcLastPage(total, perPage);
		
		// 한페이지당 게시글 시작 번호 및 종료 번호 계산 메소드
		calcStartEnd(nowPage,perPage);
		
		calcStartEndPage(nowPage, cntPage);
	}
	
	public void calcStartEndPage(int nowPage, int cntPage) {
		// nowPage : 13, cntPage : 10
		// 1.3 -> 2 * 10 -> 20
		// 현재 페이지를 기준으로 10의 자리를 구한 후 소수점 올림 처리 후 한페이지당 보여질 페이지 갯수를 곱하여 종료 페이지를 구한다.
		
		int endPage = ((int)Math.ceil((double)nowPage / cntPage))*cntPage;
		
		if(endPage>lastPage) {
			endPage = lastPage;
		}
		
		setEndPage(endPage);
		// 시작페이지 번호 = 종료 페이지 번호 - 보여질 페이지 갯수  + 1
		int startPage = endPage - cntPage + 1;
		
		if(startPage <= 0) { startPage = 1;
		}
		
		setStartPage(startPage);
	}
	
	public void calcStartEnd(int nowPage, int perPage) {
		// 한 페이지 게시글 끝 번호 = 현재 페이지 * 한페이지당 게시글 갯수
		int end = nowPage*perPage;
		
		// 한 페이지 게시글 시작번호 => 한페이지 게시글 끝 번호 - 한페이지당 게시글 갯수 (mySQL 경우)
		int start = end - perPage;
		
		
		setEnd(end);
		setStart(start);
		
	}

	public void calcLastPage(int total, int perPage) {
		
		//전체 게시글을 한 페이지당 노출 게시글 갯수로 나눈 뒤 올림 처리
		int lastPage = (int)Math.ceil((double)total/perPage);
		
		setLastPage(lastPage);
		

	}
	
	
	
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
}
