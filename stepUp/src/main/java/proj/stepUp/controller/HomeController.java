package proj.stepUp.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import proj.stepUp.service.AdminService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.QnaService;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SlideVO;
import proj.stepUp.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private AdminService adminservice;
		
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		//상품 정보(Date순)
		int maxPrd = 9;
		// 슬라이드 가져오기
		List<SlideVO> slideObj = adminservice.slideSelect();
		
		List<ProductVO> newProduct = productService.selectProductByDate(maxPrd);
		model.addAttribute("newProduct", newProduct);
		
		//상품정보(판매순)
		maxPrd = 15;
		List<ProductVO> bestProduct = productService.selectProductSales(maxPrd);
		model.addAttribute("bestProduct", bestProduct);
		//슬라이드 삽입
		model.addAttribute("blist", slideObj);
		
		
		return "index";
	}
	
	@RequestMapping(value = "/location.do", method = RequestMethod.GET)
	public String location() {

		return "about/location";
	}
	
	@RequestMapping(value = "/weare.do", method = RequestMethod.GET)
	public String weare() {

		return "about/weare";
	}
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String admin(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "admin/admin_page";
	}
	
	
	@RequestMapping(value = "/slide.do", method = RequestMethod.POST)
	public String slide(MultipartFile mainFile, HttpServletRequest req, SlideVO slvo) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String uploadMainFolder = rootPath+"resources/image/main";
		
		File mainDir = new File(uploadMainFolder);
		if(!mainDir.exists()) {
			mainDir.mkdirs();
		}
		String slideFileOname = mainFile.getOriginalFilename();
		String slideFileRname = System.currentTimeMillis()+"_"+slideFileOname;
		
		slideFileRname = new String(slideFileRname.getBytes("utf-8"),"8859_1");
		mainFile.transferTo(new File(uploadMainFolder, slideFileRname));
		
		slvo.setSlideFileOname(slideFileOname);
		slvo.setSlideFileRname(slideFileRname);		
		
	   	adminservice.slideinsert(slvo);
		return "admin/admin_page";
	}
	//제재
	@RequestMapping(value = "restrict.do",method = RequestMethod.GET)
	public String restrict(Model model, UserVO vo, HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}			
		
		List<UserVO> list = qnaService.restrictList(vo);
		model.addAttribute("blist", list);	
	
		return "admin/admin_restrict";
	}
	
	@RequestMapping(value = "restrict.do",method = RequestMethod.POST)
	public String restrict(UserVO vo) {
		
		int result = qnaService.restrict(vo);
		
		return "redirect:restrict.do";
	}
	
}
