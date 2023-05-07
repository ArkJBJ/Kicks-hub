package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

public interface MarkService {
	public int insertMark(MarkVO vo);
	public int deleteMark(MarkVO vo);
	public MarkVO selectMarkByAll(MarkVO vo);
	public List<MarkVO> marklist(MarkVO markVO);
	public int cntTotal(int userIndex);
}
