package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;

@Repository

public class NoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<NoticeBoardVO> list(SearchVO svo){

		return sqlSession.selectList("proj.stepUp.mapper.noticeBoardMapper.selectAll", svo);
	}
	
	public List<NoticeBoardVO> cntTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.noticeBoardMapper.cntTotal", svo);
	}
	
	public NoticeBoardVO selectByIndex(int noticeIndex) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.noticeBoardMapper.selectByIndex", noticeIndex);
	}
	
	public int insert(NoticeBoardVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.noticeBoardMapper.insert", vo);
	}
	
	public int update(NoticeBoardVO vo) {
		return sqlSession.update("proj.stepUp.mapper.noticeBoardMapper.update", vo);
	}
	
	public int delete(int noticeIndex) {
		return sqlSession.delete("proj.stepUp.mapper.noticeBoardMapper.delete", noticeIndex);
	}
	
}
