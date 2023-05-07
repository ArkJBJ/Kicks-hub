package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.dao.EventBoardDAO;
import proj.stepUp.vo.SearchVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventBoardDAO eventBoardDAO;
	
	@Override
	public List<EventBoardVO> list(SearchVO svo) {
		return eventBoardDAO.list(svo);
	}

	@Override
	public EventBoardVO selectByIndex(int eventIndex) {

		return eventBoardDAO.selectByIndex(eventIndex);
	}

	@Override
	public int insert(EventBoardVO vo) {
		
		
		
		return eventBoardDAO.insert(vo);
	}

	@Override
	public int update(EventBoardVO vo) {
		
		return eventBoardDAO.update(vo);
	}

	@Override
	public int delete(int eventIndex) {

		
		return eventBoardDAO.delete(eventIndex);
	}

	@Override
	public List<EventBoardVO> cntTotal(SearchVO svo) {
		
		return eventBoardDAO.cntTotal(svo);
	}

	@Override
	public int hitcount(int eventIndex) {

		return eventBoardDAO.hitcount(eventIndex);
	}


	
	
	
}
