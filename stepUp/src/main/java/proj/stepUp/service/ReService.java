package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;

public interface ReService {
	public List<ReVO> list(int freeIndex);
	public int insert(ReVO vo);
	public int update(ReVO vo);
	public int delete(int reIndex);
	
	public List<ReVO> qnalist(int qnaIndex);
	public int qnainsert(ReVO vo);
	public int qnaupdate(ReVO vo);
	public int qnadelete(int qnareIndex);
	
}
