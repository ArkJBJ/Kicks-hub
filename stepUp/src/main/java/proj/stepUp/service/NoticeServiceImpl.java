package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.NoticeBoardDAO;
import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public List<NoticeBoardVO> list(SearchVO svo) {
		
		return noticeBoardDAO.list(svo);
	}

	@Override
	public List<NoticeBoardVO> cntTotal(SearchVO svo) {
		
		return noticeBoardDAO.cntTotal(svo);
	}

	@Override
	public NoticeBoardVO selectByIndex(int noticeIndex) {
		
		return noticeBoardDAO.selectByIndex(noticeIndex);
	}

	@Override
	public int insert(NoticeBoardVO vo) {
		
		return noticeBoardDAO.insert(vo);
	}

	@Override
	public int update(NoticeBoardVO vo) {
		
		return noticeBoardDAO.update(vo);
	}

	@Override
	public int delete(int noticeIndex) {
		
		return noticeBoardDAO.delete(noticeIndex);
	}
	
	
}
