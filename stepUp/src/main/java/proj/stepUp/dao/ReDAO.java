package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import proj.stepUp.vo.ReVO;

@Repository

public class ReDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReVO> list(int freeIndex){
		return sqlSession.selectList("proj.stepUp.mapper.reMapper.selectAll", freeIndex);
	}
	
	public int insert(ReVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.reMapper.insert", vo);
	}
	public int update(ReVO vo) {
		return sqlSession.update("proj.stepUp.mapper.reMapper.update", vo);
	}
	
	public int delete(int reIndex) {
		return sqlSession.delete("proj.stepUp.mapper.reMapper.delete", reIndex);
	}
	
	
	
	public List<ReVO> qnalist(int qnaIndex){
		return sqlSession.selectList("proj.stepUp.mapper.reMapper.qnaselectAll", qnaIndex);
	}
	
	public int qnainsert(ReVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.reMapper.qnainsert", vo);
	}
	public int qnaupdate(ReVO vo) {
		return sqlSession.update("proj.stepUp.mapper.reMapper.qnaupdate", vo);
	}
	
	public int qnadelete(int qnareIndex) {
		return sqlSession.delete("proj.stepUp.mapper.reMapper.qnadelete", qnareIndex);
	}
}
