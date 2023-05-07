package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import proj.stepUp.service.FreeService;
import proj.stepUp.service.MarkService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.QnaService;
import proj.stepUp.service.ReService;
import proj.stepUp.service.UserService;
import proj.stepUp.util.KakaoLogin;
import proj.stepUp.util.NaverLogin;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.FreeBoardVO;
import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private FreeService freeService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private MarkService markService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReService reService;
	
	
	@RequestMapping(value="/join_terms.do", method = RequestMethod.GET)
	public String joinTerms(HttpServletRequest req) {
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "redirect:/";
		}else {
			return "user/join_terms";
		}
	}

	
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String join(UserVO vo, HttpServletRequest req,Model model) {
		
		//jointerms에서 항목을 가져올 때 선택하지 않은 것에 N을 넣어줌
		 if(vo.getEveChk() == null) {
			 vo.setEveChk("N");
		 }
		 if(vo.getLoChk() == null) {
			 vo.setLoChk("N");
		 }
		 		
		model.addAttribute("vo", vo);  //join_terms에서 선택한 체크박스  값을 join으로 넘겨줌
		
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "redirect:/";
		}else {
			return "user/join";
		}
	}
	
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String join(UserVO vo) {
		 
		 int result = userService.insertUser(vo);
		 if(result > 0) { 
			return "redirect:/user/joinok.do";
		 }else { 
			return "redirect:/user/join.do"; 
		 }
	}

	
	@RequestMapping(value="/joinok.do", method = RequestMethod.GET)
	public String joinok(UserVO vo) {
		return "user/joinok";
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest req, String type, Model model) {
		if(type != null) {
			model.addAttribute("SNS", type);
		}
		HttpSession session = req.getSession();
		if(session.getAttribute("login") != null) {
			return "redirect:/";
		}else {
			return "user/login";
		}
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login(UserVO vo, HttpServletRequest req, HttpServletResponse rsp, String sns) throws IOException {
		
		rsp.setContentType("text/html;charset=utf-8");
		UserVO loginVO = userService.login(vo);
		PrintWriter pw = rsp.getWriter();
		
		if(loginVO != null ) {
			if(loginVO.getUserGrade().equals("Q")){
				pw.append("<script>alert('탈퇴한 사용자입니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
			}else {
				HttpSession seesion = req.getSession();
				seesion.setAttribute("login", loginVO);
				if(sns != null) {
					pw.append("<script>location.href='"+req.getContextPath()+"/user/mypage_sns.do'</script>");
				}else {
					pw.append("<script>location.href='"+req.getContextPath()+"/'</script>");
				}
				
			}
		}else{
			pw.append("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href='"+req.getContextPath()+"/user/login.do'</script>");
		}
		pw.flush();
	}
	
	
	@RequestMapping(value="/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		
		KakaoLogin kakaoLogin = new KakaoLogin();//로그인 요청 후 코드 발급
		String token = kakaoLogin.getKakaoAccessToken(code);//발급받은 코드를 이용하여 토큰 발급		
		String userKakaoId = kakaoLogin.createKakaoUser(token);//토큰을 이용하여 사용자 정보 조회 후 아이디 반환

		HttpSession seesion = req.getSession();
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(seesion.getAttribute("login") != null) {//로그인 중인 아이디가 존재하면
			UserVO kakaoVO = userService.kakaoLogin(userKakaoId);
			if(kakaoVO != null) {
				pw.append("<script>alert('해당 SNS 계정에 연결된 계정이 존재합니다.');opener.location.reload();window.close();</script>");
			}else {
				UserVO vo = (UserVO)seesion.getAttribute("login");
				vo.setUserKakaoId(userKakaoId);
				
				int result = userService.upDateKakaoId(vo);
				if(result == 1) {
					pw.append("<script>alert('연동이 완료되었습니다.');opener.location.reload();window.close();</script>");
				}else {
					pw.append("<script>alert('연동에 실패하였습니다.');opener.location.reload();window.close();</script>");
				}
			}			
			pw.flush();
		}else {										//로그인된 아이디가 존재하지 않는다면
			//발급받은 아이디로 db 비교 진행
			UserVO kakaoVO = userService.kakaoLogin(userKakaoId);
			if(kakaoVO != null) {
				//로그인 진행
				seesion.setAttribute("login", kakaoVO);				
				return "redirect:/";
			}else {				
				pw.append("<script>alert('최초 1회 계정 연동이 필요합니다.');location.href='"+req.getContextPath()+"/user/login.do?type=SNS'</script>");
			}
			pw.flush();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/naverLogin.do", method = RequestMethod.GET)
	public String naverLogin() {
		NaverLogin requestLogin = new NaverLogin();
		String request = requestLogin.requestLogin();
		
		return "redirect:"+request;
	}
	
	
	@RequestMapping(value="/naverLoginOk.do", method = RequestMethod.GET)
	public String naverLoginOk(@RequestParam String code, String state, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		NaverLogin requestLogin = new NaverLogin();
		String accessToken = requestLogin.getNaverAccessToken(code, state);//토큰 발급
		String userNaverId = requestLogin.getUserInfo(accessToken);//사용자 정보 조회를 통해 아이디 추출
		
		HttpSession seesion = req.getSession();
		
		seesion.setAttribute("naverToken", accessToken);
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(seesion.getAttribute("login") != null) {//로그인 중인 아이디가 존재하면
			UserVO naverVO = userService.naverLogin(userNaverId);
			if(naverVO != null) {
				pw.append("<script>alert('해당 SNS 계정에 연결된 계정이 존재합니다.');opener.location.reload();window.close();</script>");
			}else {
				UserVO vo = (UserVO)seesion.getAttribute("login");
				vo.setUserNaverId(userNaverId);
				
				int result = userService.upDateNaverId(vo);
				if(result == 1) {
					pw.append("<script>alert('연동이 완료되었습니다.');opener.location.reload();window.close();</script>");
				}else {
					pw.append("<script>alert('연동에 실패하였습니다.');opener.location.reload();window.close();</script>");
				}
			}
			pw.flush();
		}else {										//로그인된 아이디가 존재하지 않는다면
			//발급받은 아이디로 db 비교 진행
			UserVO naverVO = userService.naverLogin(userNaverId);
			if(naverVO != null) {
				//로그인 진행
				seesion.setAttribute("login", naverVO);				
				return "redirect:/";
			}else {				
				pw.append("<script>alert('최초 1회 계정 연동이 필요합니다.');location.href='"+req.getContextPath()+"/user/login.do?type=SNS'</script>");
			}
			pw.flush();
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public void kakaoLogout(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		if(session.getAttribute("login") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}else {
			HttpSession seesion = req.getSession();
			seesion.removeAttribute("login");
			pw.append("<script>alert('로그아웃 되었습니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
	}
	
	
	
	
	
	//개인정보수정 비밀번호 확인
	@RequestMapping(value="/mypage_modify_check.do", method = RequestMethod.GET)
	public String mpModifyCheck(HttpServletRequest req) {
		HttpSession seesion = req.getSession();
		if(seesion.getAttribute("login") != null) {
			return "user/mypage_modify_check";
		}else {
			return "user/login";
		}
	}
	
	
	@RequestMapping(value="/mypage_modify_check.do", method = RequestMethod.POST)
	public void mpModifyCheck(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		 UserVO loginVO = userService.login(vo);
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
			if(loginVO != null) {
				HttpSession seesion = req.getSession();
				seesion.setAttribute("login", loginVO);
				pw.append("<script>location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
			}else {
				pw.append("<script>alert('비밀번호가 정확하지 않습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify_check.do'</script>");
			}
			pw.flush();
		}
	
	
	//개인정보수정 기존정보 불러오기
	@RequestMapping(value="/mypage_modify.do", method = RequestMethod.GET)
	public String mpModify(HttpServletRequest req, Model model, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		HttpSession session = req.getSession();  //로그인정보는 세션에 있는거라서 세션에서 가져와야함
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		UserVO mypage = userService.mypage(loginUser.getUserId());
		model.addAttribute("mypage", mypage);
			return "user/mypage_modify";
	}
	
	
	//개인정보수정 후 업데이트
	@RequestMapping(value="/mypage_modify.do", method = RequestMethod.POST)
	public void mpModify(UserVO vo, String userNPw, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		vo.setUserId(loginUser.getUserId());  //그 로그인정보에 있는 사용자의 아이디를 vo에 넣어준다

		vo.setUserPw(userNPw);  //새로운 비밀번호를 기존의 비밀번호에 넣어주는
		
		int result = userService.mypageUpdate(vo);
		
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
		if(result > 0) {
			pw.append("<script>alert('정보가 수정되었습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
		}else {
			pw.append("<script>alert('정보가 수정되지 않았습니다.');location.href='"+req.getContextPath()+"/user/mypage_modify.do'</script>");
		}
		pw.flush();
	}

	
	
	//회원탈퇴
	@RequestMapping(value="/mypage_withdrawal.do", method = RequestMethod.GET)
	public String mpwd(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(session.getAttribute("login") != null) {
		    return "user/mypage_withdrawal";
		}else {
		    return "user/login";
		}
		
	}

	//회원탈퇴 비밀번호 입력하는 페이지
	@RequestMapping(value="/mypage_withdrawal.do", method = RequestMethod.POST)
	public void mpwd(UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		
		//disabled를 사용하면 값이 안넘어감. userId 값 넘기려면 아래 세 줄써야함
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		vo.setUserId(loginUser.getUserId());  //그 로그인정보에 있는 사용자의 아이디를 vo에 넣어준다
		
		 UserVO loginVO = userService.login(vo);  //db에 정보가 있는지 확인		 
		 
		 rsp.setContentType("text/html;charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
			if( loginVO != null) {
				int result = userService.userDelete(vo.getUserId());
				if(result > 0) {
					HttpSession seesion = req.getSession();
					seesion.invalidate();  //세션에서 회원의 모든 정보를 브라우저에서 지운다
					pw.append("<script>location.href='"+req.getContextPath()+"/user/mypage_withdrawal_ok.do'</script>");
				}else {
					pw.append("<script>alert('탈퇴되지 않았습니다.');location.href='"+req.getContextPath()+"/user/mypage_withdrawal.do'</script>");
				}
			}else {
				pw.append("<script>alert('비밀번호가 정확하지 않습니다.');location.href='"+req.getContextPath()+"/user/mypage_withdrawal.do'</script>");
			}
			pw.flush();
		} 
	
	
	@RequestMapping(value="/mypage_withdrawal_ok.do", method = RequestMethod.GET)
	public String mpwdok(UserVO vo) {
		return "user/mypage_withdrawal_ok";
	}
	

	//mypage 내가쓴 글
	@RequestMapping(value="/mypage_posting.do", method = RequestMethod.GET)
	public String myposting(Model model, HttpServletRequest req, SearchVO svo, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		
		int totalCnt = freeService.userCntTotal(loginUser.getUserIndex());
		PagingUtil paging = new PagingUtil(totalCnt, nowPage, 10);
		
		SearchVO searchVO = new SearchVO();
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		searchVO.setUserIndex(loginUser.getUserIndex());
		List<FreeBoardVO> list = freeService.listByUserIdx(searchVO);
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		
		return "user/mypage_posting";
	}

	//내가 쓴 글 삭제
	@RequestMapping(value="/myposting_delete.do", method = RequestMethod.POST)
	public String mppdelete(int[] freeIndex) { //name이 같은 애들을 삭제하는거라 배열로..		

		for(int idx : freeIndex) {
			List<ReVO> rList = reService.list(idx);
			for (ReVO re : rList) {
				reService.delete(re.getReIndex());
	        }
			
			int result = freeService.delete(idx);
		}
		return "redirect:/user/mypage_posting.do";
	}

	
	//mypage qna
	@RequestMapping(value="/mypage_qna.do", method = RequestMethod.GET)
	public String myqna(Model model, HttpServletRequest req, SearchVO svo, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		//리스트
		
		int totalCnt = qnaService.myPageCnTotal(loginUser.getUserIndex());
		
		PagingUtil paging = new PagingUtil(totalCnt, nowPage, 10);		
		SearchVO searchVO = new SearchVO();
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		searchVO.setUserIndex(loginUser.getUserIndex());
		List<QnaVO> list = qnaService.listByUserIdx(searchVO);
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		
		return "user/mypage_qna";
	}
	 
	//qna 삭제
	@RequestMapping(value="/myqna_delete.do", method = RequestMethod.POST)
	public String mpqdelete(int[] qnaIndex) { //name이 같은 애들을 삭제하는거라 배열로..		
		
		for(int idx : qnaIndex) {
			List<ReVO> rList = reService.qnalist(idx);
			for (ReVO re : rList) {
				reService.qnadelete(re.getQnareIndex());
	        }			
			int result = qnaService.delete(idx);
		}
		return "redirect:/user/mypage_qna.do";
	}
	
	//mypage 관심목록
	@RequestMapping(value="/mypage_like.do", method = RequestMethod.GET)
	public String mylike(Model model, HttpServletRequest req, SearchVO svo, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();  //지금 세션에 로그인되어있는 사용자의
		UserVO loginUser = (UserVO)session.getAttribute("login");  //로그인정보를 가져와서
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		//페이지
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		
		int totalCnt = markService.cntTotal(loginUser.getUserIndex());				
		
		MarkVO markVO = new MarkVO(totalCnt, nowPage, 12);
		markVO.setUserIndex(loginUser.getUserIndex());
		
		List<MarkVO> list = markService.marklist(markVO);
		
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", markVO);

		return "user/mypage_like";
	}
		
		
		
		
	

	//mypage 리뷰
	@RequestMapping(value = "/mypage_review.do", method = RequestMethod.GET)
	public String mpreview(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		if(session.getAttribute("login") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "user/mypage_review";
	}
			
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
	public String findId() {
		
		return "user/find_id";
	}
	
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String findId(UserVO vo, Model model) {
		
		
		if(userService.findId(vo) != null){
			UserVO id = userService.findId(vo);
			model.addAttribute("vo", id);
			return "user/find_idOK";
		}else {
			
			return "user/find_idOK";
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.GET)
	public String findPw() {

		return "user/find_pw";
	}
	
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	public String findPw(UserVO vo, Model model) {
		
		UserVO id = userService.findPw(vo);
		
		if(id != null) {
			model.addAttribute("vo", id);
			return "user/find_pwChg";
		}else {
			return "redirect:/user/pwChgOK.do?result=0";
		}		
	}
	
	//비밀번호 변경
	@RequestMapping(value = "/pwChg.do", method = RequestMethod.GET)
	public String pwChg(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		if(session.getAttribute("vo") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "user/find_pwChg";
	}
	
	@RequestMapping(value = "/pwChgOK.do", method = RequestMethod.GET)
	public String pwChgNot(int result, Model model) {
		if(result == 0) {
			model.addAttribute("findResult", 0);
		}
		
		return "user/find_pwOK";
	}
	
	@RequestMapping(value = "/pwChgOK.do", method = RequestMethod.POST)
	public String pwChgOK(UserVO vo, Model model) {
		
		int updateResult = userService.chgPw(vo);
		if(updateResult == 1) {
			model.addAttribute("findResult", 1);
		}
		
		return "user/find_pwOK";
	}
	
	@RequestMapping(value = "/mypage_sns.do", method = RequestMethod.GET)
	public String mypageSNS(Model model,HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();		
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		UserVO userVO = userService.selectSNS(loginUser.getUserIndex());
		model.addAttribute("sns", userVO);
		
		return "user/mypage_sns";
	}
	
	@RequestMapping(value="/disconectKakao.do", method = RequestMethod.GET)
	public void disconectKakao(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");	
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		int result = userService.updateDisconnectKakao(loginUser.getUserIndex());
		if(result == 1) {
			pw.append("<script>alert('카카오 계정 연결이 해제되었습니다.');location.href='"+req.getContextPath()+"/user/mypage_sns.do'</script>");
		}else {
			pw.append("<script>alert('카카오 계정 연결 해제를 실패하였습니다.');location.href='"+req.getContextPath()+"/user/mypage_sns.do'</script>");
		}
		
		pw.flush();

	}
	
	@RequestMapping(value="/disconectNaver.do", method = RequestMethod.GET)
	public void disconectNaver(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");	
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if(loginUser == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}			
		
		int result = userService.updateDisconnectNaver(loginUser.getUserIndex());
		if(result == 1) {
			pw.append("<script>alert('네이버 계정 연결이 해제되었습니다.');location.href='"+req.getContextPath()+"/user/mypage_sns.do'</script>");
		}else {
			pw.append("<script>alert('네이버 계정 연결 해제를 실패하였습니다.');location.href='"+req.getContextPath()+"/user/mypage_sns.do'</script>");
		}
		
		pw.flush();

	}
}
	
	

