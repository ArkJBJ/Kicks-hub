package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.FreeBoardDAO;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

@Service
public class FreeServiceImpl implements FreeService {

	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	
	@Override
	public List<FreeBoardVO> list(SearchVO svo) {
		
		return freeBoardDAO.list(svo);
	}


	@Override
	public FreeBoardVO selectByIndex(int freeIndex) {

		return freeBoardDAO.selectByIndex(freeIndex);
	}

	@Override
	public int insert(FreeBoardVO vo) {
		
		
		
		return freeBoardDAO.insert(vo);
	}

	@Override
	public int update(FreeBoardVO vo) {
		
		return freeBoardDAO.update(vo);
	}

	@Override
	public int delete(int freeIndex) {

		
		return freeBoardDAO.delete(freeIndex);
	}

	@Override
	public List<FreeBoardVO> cntTotal(SearchVO svo) {
		
		return freeBoardDAO.cntTotal(svo);
	}
	

	@Override
	public int hitcount(int freeIndex) {
		return freeBoardDAO.hitcount(freeIndex);
	}


	@Override
	public int userCntTotal(int userIndex) {
		return freeBoardDAO.userCntTotal(userIndex);
	}


	@Override
	public List<FreeBoardVO> listByUserIdx(SearchVO svo) {
		return freeBoardDAO.listByUserIdx(svo);
	}

}
