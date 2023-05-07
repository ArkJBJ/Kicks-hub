package proj.stepUp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.owasp.encoder.Encode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj.stepUp.service.OrderService;
import proj.stepUp.service.ReviewService;
import proj.stepUp.vo.ReviewVO;

@RequestMapping(value="/review")
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public String insertReview(ReviewVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		int orderHistory = orderService.selectByOrder(vo);	
		if(orderHistory == 0) {
			pw.append("<script>alert('주문 내역이 존재하지 않습니다.');location.href='"+req.getContextPath()+"/product/view.do?prdIndex="+vo.getPrdIndex()+"'</script>");
			pw.flush();
			return null;
		}
		
		int writeCheck = reviewService.selectCheckReview(vo);
		if(writeCheck > 0) {
			pw.append("<script>alert('이미 리뷰를 작성한 상품입니다.');location.href='"+req.getContextPath()+"/product/view.do?prdIndex="+vo.getPrdIndex()+"'</script>");
			pw.flush();
			return null;
		}
		
		if(req.getAttribute("reviewContent") != null){
			vo.setReviewContent(Encode.forHtmlAttribute((String) req.getAttribute("reviewContent")));
		}
	
		int result = reviewService.insertRivew(vo);
		return "redirect:/product/view.do?prdIndex="+vo.getPrdIndex();
	}	
		
}
