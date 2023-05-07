package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.encoder.Encode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.QnaService;
import proj.stepUp.service.ReService;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.QnaVO;
import proj.stepUp.vo.ReVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;


@RequestMapping(value="/qna")	
@Controller

public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	@Autowired
	private ReService reService;
	
	@RequestMapping(value="/qna.do")
	public String qna(Model model, SearchVO svo) {
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		List<QnaVO> cntTotal = qnaService.cntTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 15);
		List<QnaVO> list = qnaService.list(svo);
		
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("svo", svo);
		return "qna/qna_list";
	}	
	
	
	@RequestMapping(value="/qna_write.do", method = RequestMethod.GET)
	public String qnawrite(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		if(session.getAttribute("login") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "qna/qna_write";
	}
	
	@RequestMapping(value="/qna_write.do", method = RequestMethod.POST)
	public String qnawrite(QnaVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		if(req.getAttribute("qnaCnt") != null) {
			vo.setQnaCnt((String)req.getAttribute("qnaCnt"));
		}
		
		if(req.getAttribute("qnaTitle") != null){
			vo.setQnaTitle(Encode.forHtmlAttribute((String) req.getAttribute("qnaTitle")));
		}
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = qnaService.insert(vo);
		
		return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
	}
	
	@RequestMapping(value="/qna_view.do", method = RequestMethod.GET)
	public String qnaview(int qnaIndex, Model model) {
		QnaVO vo = qnaService.selectByIndex(qnaIndex);
		List<ReVO> adminrsp = qnaService.adminrsp(qnaIndex);
		
		List<ReVO> rList = reService.qnalist(qnaIndex);
		model.addAttribute("vo", vo);
		
		if(rList != null) {
		model.addAttribute("rList", rList);
		}
		if(adminrsp != null) {
		model.addAttribute("adminrsp", adminrsp);
		}
		return "qna/qna_view";
	}
	
	@RequestMapping(value="/qna_modify.do", method = RequestMethod.GET)
	public String modify(int qnaIndex, Model model, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		if(session.getAttribute("login") == null) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		QnaVO vo = qnaService.selectByIndex(qnaIndex);
		model.addAttribute("vo", vo);
		
		return "qna/qna_modify";
	}
	
	@RequestMapping(value="/qna_modify.do", method = RequestMethod.POST)
	public String modify(QnaVO vo , HttpServletRequest req) {
		
		if(req.getAttribute("qnaCnt") != null) {
			vo.setQnaCnt((String)req.getAttribute("qnaCnt"));
		}
		
		if(req.getAttribute("qnaTitle") != null){
			vo.setQnaTitle(Encode.forHtmlAttribute((String) req.getAttribute("qnaTitle")));
		}
		
		
		int result = qnaService.update(vo);
		if(result>0) {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
		}else {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex()+"&updateYN=N";
		}
	}
	
	
	
	@RequestMapping(value="/qna_delete.do", method = RequestMethod.POST)
	public String delete(int qnaIndex) {
		List<ReVO> rList = reService.qnalist(qnaIndex);
		for (ReVO re : rList) {
			reService.qnadelete(re.getQnareIndex());
        }

		int result = qnaService.delete(qnaIndex);
		return "redirect:/qna/qna.do";
	}

	
	// 댓글 컨트롤러 부분
	
	@RequestMapping(value="/qnare_write.do", method = RequestMethod.POST)
	public String rewrite(ReVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		if(req.getAttribute("qnareCnt") != null){
			vo.setQnareCnt(Encode.forHtmlAttribute((String) req.getAttribute("qnareCnt")));
		}
		
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = reService.qnainsert(vo);
		
		return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
	}
	
	@RequestMapping(value="/qnare_del.do", method = RequestMethod.POST)
	public String delete(int qnareIndex , int qnaIndex) {
		int result = reService.qnadelete(qnareIndex);
		
		return "redirect:/qna/qna_view.do?qnaIndex="+qnaIndex;
	}
	
	@RequestMapping(value="/qnare_edit.do", method = RequestMethod.POST)
	public String reedit(ReVO vo, HttpServletRequest req) {
		
		if(req.getAttribute("qnareCnt") != null){
			vo.setQnareCnt(Encode.forHtmlAttribute((String) req.getAttribute("qnareCnt")));
		}
		
		int result = reService.qnaupdate(vo);
		if(result>0) {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
		}else {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
		}
	}
	
	@RequestMapping(value = "qna_rsp.do",method = RequestMethod.POST)
	public String rersp(QnaVO vo) {
		
		
		int result = qnaService.qnarsp(vo);
		
		if(result>0) {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex();
		}else {
			return "redirect:/qna/qna_view.do?qnaIndex="+vo.getQnaIndex()+"&updateYN=N";
		}
	}
	@RequestMapping(value = "qna_rspList.do",method = RequestMethod.GET)
	public String rersp(Model model, SearchVO svo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
				
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		List<QnaVO> cntTotal = qnaService.rspTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 10);
		List<QnaVO> list = qnaService.rspList();
		
		model.addAttribute("paging", paging);
		model.addAttribute("blist", list);

		return "/admin/admin_qnaList";

	}

	
	

	
}
