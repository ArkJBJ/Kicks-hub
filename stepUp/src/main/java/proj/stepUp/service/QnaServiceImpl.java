package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.QnaDAO;
import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	
	
	@Override
	public List<QnaVO> list(SearchVO svo) {
		
		return qnaDAO.list(svo);
	}


	@Override
	public QnaVO selectByIndex(int qnaIndex) {

		return qnaDAO.selectByIndex(qnaIndex);
	}

	@Override
	public int insert(QnaVO vo) {
		
		
		
		return qnaDAO.insert(vo);
	}

	@Override
	public int update(QnaVO vo) {
		
		return qnaDAO.update(vo);
	}

	@Override
	public int delete(int qnaIndex) {

		
		return qnaDAO.delete(qnaIndex);
	}

	@Override
	public List<QnaVO> cntTotal(SearchVO svo) {
		
		return qnaDAO.cntTotal(svo);
	}

	@Override
	public int qnarsp(QnaVO vo) {
		
		return qnaDAO.qnarsp(vo);
	}


	@Override
	public List<UserVO> restrictList(UserVO vo) {
		return qnaDAO.restrictList(vo);
	}


	@Override
	public int restrict(UserVO vo) {
		return qnaDAO.restrict(vo);
	}

	@Override
	public List<ReVO> adminrsp(int qnaIndex) {
		return qnaDAO.adminrsp(qnaIndex);
	}


	@Override
	public int myPageCnTotal(int userIndex) {
		return qnaDAO.myPageCnTotal(userIndex);
	}


	@Override
	public List<QnaVO> listByUserIdx(SearchVO svo) {
		return qnaDAO.listByUserIdx(svo);
	}


	@Override
	public List<QnaVO> rspList() {
		
		return qnaDAO.rspList();
	}
	
	public List<QnaVO> rspTotal(SearchVO svo){
		return qnaDAO.rspTotal(svo);
	}

}
