package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@Repository

public class QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<QnaVO> list(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.selectAll", svo);
	}
	
	public List<QnaVO> listByUserIdx(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.userQna", svo);
	}
	
	public List<QnaVO> cntTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.cntTotal", svo);
	}
	
	public QnaVO selectByIndex(int qnaIndex) {		
		return sqlSession.selectOne("proj.stepUp.mapper.qnaMapper.selectByIndex", qnaIndex);
	}
	
	public int insert(QnaVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.qnaMapper.insert", vo);
	}
	public int update(QnaVO vo) {
		return sqlSession.update("proj.stepUp.mapper.qnaMapper.update", vo);
	}
	
	public int delete(int qnaIndex) {
		return sqlSession.delete("proj.stepUp.mapper.qnaMapper.delete", qnaIndex);
	}
	public int qnarsp(QnaVO vo) {
		return sqlSession.update("proj.stepUp.mapper.qnaMapper.qnarsp", vo);
	}
	public List<UserVO> restrictList(UserVO vo) {
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.restrictList", vo);
	}
	public int restrict(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.qnaMapper.restrict", vo);
	}
	public List<ReVO> adminrsp(int qnaIndex) {
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.adminrsp", qnaIndex);
	}	
	public int myPageCnTotal(int userIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.qnaMapper.myPageCnTotal", userIndex);
	}
	public List<QnaVO> rspList(){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.rspList");
	}
	public List<QnaVO> rspTotal(SearchVO svo){
		return sqlSession.selectList("proj.stepUp.mapper.qnaMapper.rspTotal", svo);
	}
	
}
