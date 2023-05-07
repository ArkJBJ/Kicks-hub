package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;

public interface NoticeService {
	
	public List<NoticeBoardVO> list(SearchVO svo);
	public List<NoticeBoardVO> cntTotal(SearchVO svo);
	public NoticeBoardVO selectByIndex(int eventIndex);
	public int insert(NoticeBoardVO vo);
	public int update(NoticeBoardVO vo);
	public int delete(int noticeIndex);
	
}
