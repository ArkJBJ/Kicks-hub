package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.MarkDAO;
import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.SearchVO;

@Service
public class MarkServiceImpl implements MarkService{
	
	@Autowired
	private MarkDAO markDAO;
	
	@Override
	public int insertMark(MarkVO vo) {//찜 목록 추가
		return markDAO.insertMark(vo);
	}

	@Override
	public int deleteMark(MarkVO vo) {//찜목록 삭제
		return markDAO.deleteMark(vo);
	}

	@Override
	public MarkVO selectMarkByAll(MarkVO vo) {//찜목록 조회
		return markDAO.selectMarkByAll(vo);
	}
	
	@Override
	public List<MarkVO> marklist(MarkVO markVO) {
		return markDAO.marklist(markVO);
	}
	
	@Override
	public int cntTotal(int userIndex) {
		return markDAO.cntTotal(userIndex);
	}
	


}
