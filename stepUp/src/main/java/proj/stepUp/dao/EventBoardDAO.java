package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.SearchVO;

@Repository

public class EventBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<EventBoardVO> list(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.eventBoardMapper.selectAll", svo);
	}
	public List<EventBoardVO> cntTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.eventBoardMapper.cntTotal", svo);
	}
	
	public EventBoardVO selectByIndex(int eventIndex) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.eventBoardMapper.selectByIndex", eventIndex);
	}
	
	public int insert(EventBoardVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.eventBoardMapper.insert", vo);
	}
	public int update(EventBoardVO vo) {
		return sqlSession.update("proj.stepUp.mapper.eventBoardMapper.update", vo);
	}
	
	public int delete(int eventIndex) {
		return sqlSession.delete("proj.stepUp.mapper.eventBoardMapper.delete", eventIndex);
	}
	public int hitcount(int eventIndex) {
		return sqlSession.update("proj.stepUp.mapper.eventBoardMapper.hitcount", eventIndex);
	}
	
}
