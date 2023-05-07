package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

public interface UserService {
	
	public int checkId(String userId);
	public int checkNick(String userNick);
	public int insertUser(UserVO vo);
	public UserVO login(UserVO vo);
	public UserVO mypage(String userId);
	public int mypageUpdate(UserVO vo);
	public UserVO kakaoLogin(String userKakaoId);
	public int upDateKakaoId(UserVO vo);
	public UserVO naverLogin(String userNaverId);
	public int upDateNaverId(UserVO vo);
	public int userDelete(String userid);
	public UserVO findId(UserVO vo);
	public UserVO findPw(UserVO vo);
	public UserVO selectIndex(int userIndex);
	public int chgPw(UserVO vo);
	public List<UserVO> cntTotal(SearchVO svo);
	public UserVO selectSNS(int userIndex);
	public int updateDisconnectNaver(int userIndex);
	public int updateDisconnectKakao(int userIndex);
}
