package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

public interface FreeService {
	public List<FreeBoardVO> list(SearchVO svo);
	public List<FreeBoardVO> listByUserIdx(SearchVO svo);
	public List<FreeBoardVO> cntTotal(SearchVO svo);
	public FreeBoardVO selectByIndex(int freeIndex);
	public int insert(FreeBoardVO vo);
	public int update(FreeBoardVO vo);
	public int delete(int freeIndex);
	public int hitcount(int freeIndex);
	public int userCntTotal(int userIndex);
}
