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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import proj.stepUp.service.MarkService;
import proj.stepUp.service.ProductImgService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.ReviewService;
import proj.stepUp.service.SizeService;
import proj.stepUp.util.PaymentUtil;
import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.ProductImgVO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.SizeVO;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/product")
@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;	
	@Autowired
	private ProductImgService producImgService;
	@Autowired
	private SizeService sizeService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MarkService markService;
	
	@RequestMapping(value="registration.do", method = RequestMethod.GET)
	public String registration(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "product/registration" ;
	}
	
	@RequestMapping(value="registration.do", method = RequestMethod.POST)
	public String registrationOK(MultipartHttpServletRequest subFile,MultipartFile mainFile, ProductVO vo, ProductImgVO subVO, 
			@RequestParam("sizeKind") String[] sizeKind,
			@RequestParam("sizeStock") int[] sizeStock,
			HttpServletRequest req) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String uploadMainFolder = rootPath+"resources/prdmainimg";
		String uploadSubFolder = rootPath+"resources/prdsubimg";
		List<MultipartFile> subFileList =  subFile.getFiles("subFile");		
		
		File mainDir = new File(uploadMainFolder);//위치 폴더가 존재하는지 확인
		File subDir = new File(uploadSubFolder);
		if(!mainDir.exists()) {
			mainDir.mkdirs();
		}
		if(!subDir.exists()) {
			subDir.mkdirs();
		}
		
		
		String prdOname = mainFile.getOriginalFilename();		//원본 파일이름
		String prdRname = System.currentTimeMillis()+"_"+prdOname;//저장용 파일이름
		prdRname = new String(prdRname.getBytes("utf-8"),"8859_1");
		mainFile.transferTo(new File(uploadMainFolder, prdRname));//새로운 파일이름으로 저장
		vo.setPrdOname(prdOname);
		vo.setPrdRname(prdRname);
		productService.insertProduct(vo);
		int prdIndex = vo.getPrdIndex();
		

		for(MultipartFile sub : subFileList) {//서브 이미지 저장
			String prdImgOname = sub.getOriginalFilename();
			String prdImgRname = System.currentTimeMillis() + "_" + prdImgOname;
			prdImgRname = new String(prdImgRname.getBytes("utf-8"),"8859_1");
			sub.transferTo(new File(uploadSubFolder, prdImgRname));
			subVO.setPrdImgOname(prdImgOname);
			subVO.setPrdImgRname(prdImgRname);
			subVO.setPrdIndex(prdIndex);
			int result = producImgService.insertProductImg(subVO);
		}
		
		
		for(int i = 0; i < sizeKind.length; i++) {//상품 사이즈별 제고 저장
			SizeVO sizeVO = new SizeVO();
			String sizekind = sizeKind[i];
			int sizestock = sizeStock[i];
			sizeVO.setSizeKind(sizekind);
			sizeVO.setSizeStock(sizestock);
			sizeVO.setPrdIndex(prdIndex);
			sizeService.insertSize(sizeVO);
		}

		
		return "product/registration" ;
	}
		
	@RequestMapping(value="/view.do", method = RequestMethod.GET)
	public String view(int prdIndex, ReviewVO vo, MarkVO markVO, Model model, HttpSession session) {
		ProductVO prdVO = productService.selectProductIndex(prdIndex);
		List<ProductImgVO> prdImgVO = producImgService.selectByProductIndex(prdIndex);
		UserVO userVO = (UserVO)session.getAttribute("login");
		List<SizeVO> sizeVO = sizeService.selectByPrdIndex(prdIndex);

		try {
			if(userVO != null) {
				markVO.setUserIndex(userVO.getUserIndex());
				MarkVO result = markService.selectMarkByAll(markVO);
				if(result != null) {
					model.addAttribute("markResult", result);
				}
			}
			if(prdVO != null) {
				model.addAttribute("prdVO", prdVO);//상품 정보
				model.addAttribute("prdImgVO", prdImgVO);//상품 서브 이미지
			}
			if(sizeVO != null) {
				model.addAttribute("sizeVO", sizeVO);//상품 사이즈 정보
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return "product/product_view";
	}
	
	@RequestMapping(value = "/best.do", method = RequestMethod.GET)//best페이지
	public String best(Model model) {
		
		//상품정보(판매순)
		int maxPrd = 20;
		List<ProductVO> bestProduct = productService.selectProductSales(maxPrd);
		model.addAttribute("bestProduct", bestProduct);
		
		return "product/best";
	}
	
	@RequestMapping(value = "/brand.do", method = RequestMethod.GET)//brand페이지
	public String brand(SearchVO searchVO, Model model) {
		model.addAttribute("searchVO", searchVO);
				
		return "product/brand" ;
	}
	
	@RequestMapping(value = "/new.do", method = RequestMethod.GET)//new페이지
	public String newPage(SearchVO searchVO, Model model) {
		model.addAttribute("searchVO", searchVO);
				
		return "product/new";
	}
	
	@RequestMapping(value="/management.do", method = RequestMethod.GET)
	public String management(HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		return "product/management";
	}
	
	@RequestMapping(value="/size.do", method = RequestMethod.GET)
	public String size(int prdIndex, Model model, HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}

		List<SizeVO> vo = sizeService.selectByPrdIndex(prdIndex);
		model.addAttribute("sizeList", vo);
		model.addAttribute("prdIndex", prdIndex);
		return "product/size";
	}
	
	@RequestMapping(value="/productModify.do", method = RequestMethod.GET)
	public String productModify(int prdIndex, Model model, HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		HttpSession session = req.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("login");
		if(session.getAttribute("login") == null || !loginUser.getUserGrade().equals("A")) {
			pw.append("<script>alert('비정상적인 접근입니다.');location.href='"+req.getContextPath()+"/'</script>");
			pw.flush();
		}
		
		ProductVO prdVO = productService.selectProductIndex(prdIndex);
		List<ProductImgVO> prdImgVO = producImgService.selectByProductIndex(prdIndex);
		model.addAttribute("prdVO", prdVO);
		model.addAttribute("prdImgList", prdImgVO);
		
		return "product/productModify";
	}
	
	@RequestMapping(value="/productModify.do", method = RequestMethod.POST)
	public String productModifyOk(ProductVO vo, MultipartHttpServletRequest subFile,MultipartFile mainFile, ProductImgVO subVO,
			String mainPrdRname, String[] subPrdImgRname, int[] subPrdImgIndex, HttpServletRequest req) throws IOException {
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String uploadMainFolder = rootPath+"resources/prdmainimg";
		String uploadSubFolder = rootPath+"resources/prdsubimg";
		String prdOname = mainFile.getOriginalFilename();
		List<MultipartFile> subFileList =  subFile.getFiles("subFile");
		
		if(prdOname.equals("")) {
			int result = productService.updateProduct(vo);
		}else {
			File deleteFile = new File(uploadMainFolder+"/"+mainPrdRname);
			if(deleteFile.exists()) {
				 deleteFile.delete();
					String prdRname = System.currentTimeMillis()+"_"+prdOname;//저장용 파일이름
					prdRname = new String(prdRname.getBytes("utf-8"),"8859_1");
					mainFile.transferTo(new File(uploadMainFolder, prdRname));//새로운 파일이름으로 저장
					vo.setPrdOname(prdOname);
					vo.setPrdRname(prdRname);
					
					int result = productService.updateProduct(vo);
			}
		}
		int count = 0;
		for(MultipartFile sub : subFileList) {			
			String prdSubOname = sub.getOriginalFilename();
			if(prdSubOname != "") {
				File deleteFile = new File(uploadSubFolder+"/"+subPrdImgRname[count]);
				if(deleteFile.exists()) {
					deleteFile.delete();
					String prdImgOname = sub.getOriginalFilename();
					String prdImgRname = System.currentTimeMillis() + "_" + prdImgOname;
					prdImgRname = new String(prdImgRname.getBytes("utf-8"),"8859_1");
					sub.transferTo(new File(uploadSubFolder, prdImgRname));
					subVO.setPrdImgOname(prdImgOname);
					subVO.setPrdImgRname(prdImgRname);
					subVO.setPrdImgIndex(subPrdImgIndex[count]);
					
					int subresult = producImgService.updateSubImg(subVO);

				}		
			}else{

			}
			count++;
		}
		
		
		return "redirect:/product/management.do";
	}
	
}
