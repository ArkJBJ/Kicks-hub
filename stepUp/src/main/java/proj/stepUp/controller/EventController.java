package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.EventService;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.vo.EventBoardVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.UserVO;


@RequestMapping(value="/event")	
@Controller

public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/event.do", method = RequestMethod.GET)
	public String event(Model model, SearchVO svo) {
		
		
		int nowPage = 1;
		if(svo.getNowPage() != 0 ) {
			nowPage = svo.getNowPage();
		}
		
		List<EventBoardVO> cntTotal = eventService.cntTotal(svo);
		int totalCnt = 0;
		if(cntTotal.size()>0) {
			totalCnt = cntTotal.get(0).getTotal();
		}
		
		PagingUtil paging = new PagingUtil(totalCnt,nowPage, 15);
		
		
		List<EventBoardVO> list = eventService.list(svo);
				
		model.addAttribute("blist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("svo", svo);
		return "event/event_list";
	}
	
	@RequestMapping(value="/event_write.do", method = RequestMethod.GET)
	public String eventwrite(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		return "event/event_write";
	}
	
	@RequestMapping(value="/event_write.do", method = RequestMethod.POST)
	public String eventwrite(EventBoardVO vo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		vo.setUserIndex(loginUserVO.getUserIndex());
		int result = eventService.insert(vo);
		
		return "redirect:/event/event_view.do?eventIndex="+vo.getEventIndex();
	}
	
	@RequestMapping(value="/event_view.do", method = RequestMethod.GET)
	public String eventview(int eventIndex, Model model , HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		UserVO loginUserVO = (UserVO)session.getAttribute("login");
		
		
		Cookie[] cookies = req.getCookies();
		boolean isExists = false;
		String sessionID = req.getSession().getId(); // 사용자의 세션 ID를 가져옴

		if (loginUserVO == null) {
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("eventIndex_" + eventIndex)) {
		                isExists = true;
		                break;
		            }
		        }
		    }
		    // 쿠키 생성 후 조회수 증가
		    if (!isExists) {
		        Cookie cookie = new Cookie("eventIndex_" + eventIndex, String.valueOf(eventIndex));

		        cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 1일
		        res.addCookie(cookie);
		        eventService.hitcount(eventIndex);
		    }
		}
		if (loginUserVO != null) {
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookie.getName().equals("eventIndex_" + eventIndex + "_" + sessionID)) {
		                isExists = true;
		                break;
		            }
		        }
		    }
		    // 쿠키 생성 후 조회수 증가
		    if (!isExists) {
		        Cookie cookie = new Cookie("eventIndex_" + eventIndex + "_" + sessionID, String.valueOf(eventIndex));

		        cookie.setMaxAge(60 * 60 * 24); // 쿠키 유효 1일
		        res.addCookie(cookie);
		        eventService.hitcount(eventIndex);
		    }
		}
		
		EventBoardVO vo = eventService.selectByIndex(eventIndex);
		model.addAttribute("vo", vo);
		
		return "event/event_view";
	}
	
	@RequestMapping(value="/event_modify.do", method = RequestMethod.GET)
	public String modify(int eventIndex, Model model, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}		
		
		EventBoardVO vo = eventService.selectByIndex(eventIndex);
		model.addAttribute("vo", vo);
		
		return "event/event_modify";
	}
	
	@RequestMapping(value="/event_modify.do", method = RequestMethod.POST)
	public String modify(EventBoardVO vo) {
		
		int result = eventService.update(vo);
		if(result>0) {
			return "redirect:/event/event_view.do?eventIndex="+vo.getEventIndex();
		}else {
			return "redirect:/event/event_view.do?eventIndex="+vo.getEventIndex()+"&updateYN=N";
		}
	}
	
	@RequestMapping(value="/event_delete.do", method = RequestMethod.POST)
	public String delete(int eventIndex) {
		int result = eventService.delete(eventIndex);
		
		return "redirect:/event/event.do";
	}

}
