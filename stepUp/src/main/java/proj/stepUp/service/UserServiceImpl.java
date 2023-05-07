
package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.UserDAO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int checkId(String userId) {
		return userDAO.checkId(userId);
	}

	@Override
	public int checkNick(String userNick) {
		return userDAO.checkNick(userNick);
	}
	
	@Override
	public int insertUser(UserVO vo) {
		return userDAO.insertUser(vo);
	}

	@Override
	public UserVO login(UserVO vo) {
		return userDAO.login(vo);
	}

	@Override
	public UserVO mypage(String userId) {
		return userDAO.mypage(userId);
	}
	
	@Override
	public int mypageUpdate(UserVO vo) {
		return userDAO.mypageUpdate(vo);
	}

	@Override
	public UserVO kakaoLogin(String userKakaoId) {
		return userDAO.kakaoLogin(userKakaoId);
	}

	@Override
	public int upDateKakaoId(UserVO vo) {
		return userDAO.upDateKakaoId(vo);
	}

	@Override
	public UserVO naverLogin(String userNaverId) {
		return userDAO.naverLogin(userNaverId);
	}

	@Override
	public int upDateNaverId(UserVO vo) {
		return userDAO.upDateNaverId(vo);
	}

	@Override
	public int userDelete(String userid) {
		return userDAO.userDelete(userid);
	}

	@Override
	public UserVO findId(UserVO vo) {
		return userDAO.findId(vo);
	}

	@Override
	public UserVO selectIndex(int userIndex) {		
		return userDAO.selectIndex(userIndex);
	}

	@Override
	public int chgPw(UserVO vo) {
		return userDAO.chgPw(vo);
	}

	@Override
	public UserVO findPw(UserVO vo) {
		return userDAO.findPw(vo);
	}

	@Override
	public List<UserVO> cntTotal(SearchVO svo) {
		return userDAO.cntTotal(svo);
	}

	@Override
	public UserVO selectSNS(int userIndex) {
		return userDAO.selectSNS(userIndex);
	}

	@Override
	public int updateDisconnectNaver(int userIndex) {
		return userDAO.updateDisconnectNaver(userIndex);
	}

	@Override
	public int updateDisconnectKakao(int userIndex) {
		return userDAO.updateDisconnectKakao(userIndex);
	}
	

}
