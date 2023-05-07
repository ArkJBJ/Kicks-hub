package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ReDAO;
import proj.stepUp.vo.ReVO;

@Service
public class ReServiceImpl implements ReService{
	
	@Autowired
	private ReDAO reDAO;

	@Override
	public List<ReVO> list(int freeIndex) {		
		return reDAO.list(freeIndex);
	}

	@Override
	public int insert(ReVO vo) {		
		return reDAO.insert(vo);
	}

	@Override
	public int update(ReVO vo) {
		return reDAO.update(vo);
	}

	@Override
	public int delete(int reIndex) {
		return reDAO.delete(reIndex);
	}
		
	@Override
	public List<ReVO> qnalist(int qnaIndex) {
		return reDAO.qnalist(qnaIndex);
	}

	@Override
	public int qnainsert(ReVO vo) {
		return reDAO.qnainsert(vo);
	}

	@Override
	public int qnaupdate(ReVO vo) {
		return reDAO.qnaupdate(vo);
	}

	@Override
	public int qnadelete(int qnareIndex) {
		return reDAO.qnadelete(qnareIndex);	
	}

}
