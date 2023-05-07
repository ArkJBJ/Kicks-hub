package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.SearchVO;

public interface EventService {
	public List<EventBoardVO> list(SearchVO svo);
	public List<EventBoardVO> cntTotal(SearchVO svo);
	public EventBoardVO selectByIndex(int eventIndex);
	public int insert(EventBoardVO vo);
	public int update(EventBoardVO vo);
	public int delete(int eventIndex);
	public int hitcount(int eventIndex);
	
}
