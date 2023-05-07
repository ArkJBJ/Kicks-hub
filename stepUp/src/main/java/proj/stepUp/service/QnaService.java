package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

public interface QnaService {
	public List<QnaVO> list(SearchVO svo);
	public List<QnaVO> listByUserIdx(SearchVO svo);
	public List<QnaVO> cntTotal(SearchVO svo);
	public QnaVO selectByIndex(int qnaIndex);
	public int insert(QnaVO vo);
	public int update(QnaVO vo);
	public int delete(int qnaIndex);
	public int qnarsp(QnaVO vo);
	public List<UserVO> restrictList(UserVO vo);
	public int restrict(UserVO vo);
	public List<ReVO> adminrsp(int qnaIndex);
	public int myPageCnTotal(int userIndex);
	public List<QnaVO> rspList();
	public List<QnaVO> rspTotal(SearchVO svo);
	
}
