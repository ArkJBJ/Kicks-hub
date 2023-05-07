package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.SearchVO;

@Repository

public class FreeBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FreeBoardVO> list(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.freeBoardMapper.selectAll", svo);
	}
	
	public List<FreeBoardVO> listByUserIdx(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.freeBoardMapper.userFree", svo);
	}
	
	public List<FreeBoardVO> cntTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.freeBoardMapper.cntTotal", svo);
	}	
	
	public FreeBoardVO selectByIndex(int freeIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.freeBoardMapper.selectByIndex", freeIndex);
	}
	
	public int insert(FreeBoardVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.freeBoardMapper.insert", vo);
	}
	public int update(FreeBoardVO vo) {
		return sqlSession.update("proj.stepUp.mapper.freeBoardMapper.update", vo);
	}
	
	public int delete(int freeIndex) {
		return sqlSession.delete("proj.stepUp.mapper.freeBoardMapper.delete", freeIndex);
	}
	public int hitcount(int freeIndex) {
		return sqlSession.update("proj.stepUp.mapper.freeBoardMapper.hitcount", freeIndex);
	}
	
	public int userCntTotal(int userIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.freeBoardMapper.userCntTotal", userIndex);
	}
}
