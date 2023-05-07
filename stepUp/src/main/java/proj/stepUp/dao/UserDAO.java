package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int checkId(String userId) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.checkId", userId);
	}
	
	public int checkNick(String userNick) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.checkNick", userNick);
	}
	
	public int insertUser(UserVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.userMapper.insertUser", vo);
	}
	
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.login", vo);
	}
	
	public UserVO mypage(String userId) {
		
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.mypage", userId);
	}

	public int mypageUpdate(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.mypageUpdate", vo);
	}
	
	public UserVO kakaoLogin(String userKakaoId) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.kakaoLogin", userKakaoId);
	}
	
	public int upDateKakaoId(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.upDateKakaoId", vo);
	}
	
	public UserVO naverLogin(String userNaverId) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.naverLogin", userNaverId);
	}
	
	public int upDateNaverId(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.upDateNaverId", vo);
	}
	
	public int userDelete(String userid) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.userDelete", userid);
	}
	
	public UserVO findId(UserVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.findId", vo);
	}
	
	public UserVO findPw(UserVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.findPw", vo);
	}
	
	public UserVO selectIndex(int userIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.selectIndex", userIndex);
	}
	
	public int chgPw(UserVO vo) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.chgPw", vo);
	}
	
	public List<UserVO> cntTotal(SearchVO svo) {
		return sqlSession.selectList("proj.stepUp.mapper.userMapper.cntTotal", svo);
	}
	
	public UserVO selectSNS(int userIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.userMapper.selectSNS", userIndex);
	}
	
	public int updateDisconnectNaver(int userIndex) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.updateDisconnectNaver", userIndex);
	}
	
	public int updateDisconnectKakao(int userIndex) {
		return sqlSession.update("proj.stepUp.mapper.userMapper.updateDisconnectKakao", userIndex);
	}
}
