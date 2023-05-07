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

import proj.stepUp.service.NoticeService;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.NoticeBoardVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;


@RequestMapping(value="/notice")	
@Controller

public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice(Model model, SearchVO svo) {
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		
		List<NoticeBoardVO> cntTotal = noticeService.cntTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 15);
		
		List<NoticeBoardVO> list = noticeService.list(svo);
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("svo", svo);
		return "notice/notice_list";
	}	
	
	

	
	@RequestMapping(value="/notice_view.do", method = RequestMethod.GET)
	public String noticeview(int noticeIndex, Model model) {
		NoticeBoardVO vo = noticeService.selectByIndex(noticeIndex);
		model.addAttribute("vo", vo);
		
		return "notice/notice_view";
	}
	
	@RequestMapping(value="/notice_write.do", method = RequestMethod.GET)
	public String noticewrite(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		return "notice/notice_write";
	}
	
	@RequestMapping(value="/notice_write.do", method = RequestMethod.POST)
	public String noticewrite(NoticeBoardVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		int result = noticeService.insert(vo);
		
		return "redirect:/notice/notice_view.do?noticeIndex="+vo.getNoticeIndex();
	}
	
	@RequestMapping(value="/notice_modify.do", method = RequestMethod.GET)
	public String modify(int noticeIndex, Model model, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		NoticeBoardVO vo = noticeService.selectByIndex(noticeIndex);
		model.addAttribute("vo", vo);
		
		return "notice/notice_modify";
	}
	
	@RequestMapping(value="/notice_modify.do", method = RequestMethod.POST)
	public String modify(NoticeBoardVO vo) {
		
		int result = noticeService.update(vo);
		if(result>0) {
			return "redirect:/notice/notice_view.do?noticeIndex="+vo.getNoticeIndex();
		}else {
			return "redirect:/notice/notice_view.do?noticeIndex="+vo.getNoticeIndex()+"&updateYN=N";
		}
	}
	
	@RequestMapping(value="/notice_delete.do", method = RequestMethod.POST)
	public String delete(int noticeIndex) {
		int result = noticeService.delete(noticeIndex);
		
		return "redirect:/notice/notice.do";
	}

}
