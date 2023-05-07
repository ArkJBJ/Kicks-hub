package proj.stepUp.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONException;
import org.owasp.encoder.Encode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import proj.stepUp.service.CartService;
import proj.stepUp.service.MarkService;
import proj.stepUp.service.OrderItemService;
import proj.stepUp.service.OrderService;
import proj.stepUp.service.ProductService;
import proj.stepUp.service.ReviewService;
import proj.stepUp.service.SizeService;
import proj.stepUp.service.UserService;
import proj.stepUp.util.NaverSMS;
import proj.stepUp.util.PagingUtil;
import proj.stepUp.util.PaymentUtil;
import proj.stepUp.vo.CartVO;
import proj.stepUp.vo.MarkVO;
import proj.stepUp.vo.OrderItemVO;
import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;
import proj.stepUp.vo.SizeVO;
import proj.stepUp.vo.UserVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	private UserService userService;	
	@Autowired
	private MarkService markService;	
	@Autowired
	private CartService cartService;	
	@Autowired
	private ReviewService reviewService;	
	@Autowired
	private ProductService productService;	
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private SizeService sizeService;
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method = RequestMethod.POST)
	public String checkId(String userId){
		int result = userService.checkId(userId);
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNick.do", method = RequestMethod.POST)
	public String checkNick(String userNick){
		int result = userService.checkNick(userNick);
		if(result > 0) {
			return "failse";
		}else {
			return "true";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPhone.do", method = RequestMethod.POST)	//인증번호 발송처리
	public void checkPhone(String userPhone, HttpServletRequest req) throws JSONException, UnsupportedEncodingException{
		
		NaverSMS sms = new NaverSMS();
		
		String result =  sms.sendSMS(userPhone);
		HttpSession session = req.getSession();	
		session.setAttribute("phoneCode", result);
		session.setMaxInactiveInterval(300);
		return;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkPchNum.do", method = RequestMethod.POST)	//인증번호 비교 처리
	public String checkPchNum(String PchNum, HttpServletRequest req){
		HttpSession session = req.getSession();	
		String phoneCode = (String)session.getAttribute("phoneCode");
		if(PchNum.equals(phoneCode)) {
			return "1";
		}else {
			return "0";
		}

	}
	
	@RequestMapping(value="/SummerNoteImageFile.do", produces = "application/json; charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		String fileupload = request.getContextPath()+"/resources/fileupload";
		File cntDir = new File(fileupload);
		if(!cntDir.exists()) {
			cntDir.mkdirs();
		}
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url",request.getContextPath()+"/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
		@ResponseBody
		@RequestMapping(value="/addMark.do", method = RequestMethod.POST)
		public String addMark(MarkVO vo, HttpServletRequest req){	//북마크 등록
			int result = markService.insertMark(vo);
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/removeMark.do", method = RequestMethod.POST)
		public String removeMark(MarkVO vo, HttpServletRequest req){	//북마크 등록
			int result = markService.deleteMark(vo);
			return result+"";
		}
		
		
		@ResponseBody
		@RequestMapping(value="/inputCart.do", method = RequestMethod.POST)
		public String inputCart(String[] sizeIndex, String[] sizeStock, CartVO vo){	//cart 데이터 넘기는중
			int count = 0;
			try {
				for(int i = 0; i < sizeIndex.length; i++) {
					int size = Integer.parseInt(sizeIndex[i]);
					int stock =Integer.parseInt(sizeStock[i]);				
					vo.setSizeIndex(size);
					vo.setCartStock(stock);
					int check = cartService.selectCheck(vo);
					if(check == 0) {
						int result = cartService.insertCart(vo);
						count++;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(count == 0) {
				return "0";
			}else {
				return "1";
			}			
		}
				
			
		@ResponseBody
		@RequestMapping(value="/prdPaging.do", method = RequestMethod.GET)	//review리스트 페이징 ajax 처리
		public List<ReviewVO> prdPagingList(int nowPage, ReviewVO vo, Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			int totalCount = reviewService.selectCount(vo.getPrdIndex());//해당 제품페이지에 존재하는 총 상품리뷰 수
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 5);
			vo.setStart(paging.getStart());
			vo.setPerPage(paging.getPerPage());
			List<ReviewVO> reviewVO = reviewService.selectReview(vo);	
			
			return reviewVO;
		}
		
		@ResponseBody
		@RequestMapping(value="/prdPaging.do", method = RequestMethod.POST)	//페이징 버튼 ajax 처리
		public PagingUtil prdPagingBtn(int nowPage, ReviewVO vo) {		
			int totalCount = reviewService.selectCount(vo.getPrdIndex());//해당 제품페이지에 존재하는 총 상품리뷰 수
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 5);
			
			return paging;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/search.do", method = RequestMethod.GET)	
		public List<ProductVO> search(SearchVO searchVO, int nowPage) {
			int totalCount = productService.selectBrandToal(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<ProductVO> productVO = productService.selectBrandPage(searchVO);
			return productVO;
		}
		
		@ResponseBody
		@RequestMapping(value="/searchPaging.do", method = RequestMethod.GET)	
		public PagingUtil searchPaging(SearchVO searchVO, int nowPage) {					
			int totalCount = productService.selectBrandToal(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);

			return paging;
		}
		
		@ResponseBody
		@RequestMapping(value="/ordernum.do", method = RequestMethod.POST)//결제 요청전 실행ajax
		public String orderNum(int totalPrice) {			
			PaymentUtil paymentUtil = new PaymentUtil();
			String orderNum = paymentUtil.createNum();//주문번호 생성
		    int result = orderService.selectOrderNum(orderNum);//주문번호 중복 체크
		    try {
		    	while(result > 0) {//주문번호중복시
		    		orderNum = paymentUtil.createNum();
		    		result = orderService.selectOrderNum(orderNum);
		    	}
		    	String accessToken = paymentUtil.getAccessToken();//엑세스 토큰 발급
		    	int code = paymentUtil.prepare(orderNum, totalPrice, accessToken);//결제금액 사전등록
		    	if(code != 0) {
		    	}
			} catch (Exception e) {
				e.printStackTrace();
			}

		    return orderNum;		    
		}
		
		@ResponseBody
		@RequestMapping(value="/createOrder.do", method = RequestMethod.POST)	
		public String createOrder(String imp_uid, String merchant_uid, int totalPrice, int userIndex,
				int[] sizeindex, int[] orderitemStock, OrderItemVO oiVO, CartVO cartVO
				) {			
			String success = "0";
			PaymentUtil paymentUtil = new PaymentUtil();
			String accessToken = paymentUtil.getAccessToken();//엑세스 토큰 발급
			OrderVO vo = paymentUtil.paymentHistory(imp_uid, accessToken, totalPrice);
			vo.setUserIndex(userIndex);
			cartVO.setUserIndex(userIndex);
			int orderIndex = orderService.insertOrder(vo);
			
			oiVO.setOrderIndex(vo.getOrderIndex());
			for(int i = 0; i < sizeindex.length; i++) {
				oiVO.setSizeIndex(sizeindex[i]);
				oiVO.setOrderItemStock(orderitemStock[i]);
				cartVO.setSizeIndex(sizeindex[i]);
				
				int result = orderItemService.insertOrderItem(oiVO);
				int subtract = sizeService.updateSubtract(oiVO);
				int delCart = cartService.deleteCart(cartVO);
				if(result != 1) {
					success = "1";
				}else {
					success = "0";
				}
			}
			
			return success;
		}
		
		@ResponseBody
		@RequestMapping(value="/checkStock.do", method = RequestMethod.POST)
		public String checkStock(int[] sizeindex, int[] orderitemStock, OrderItemVO oiVO) {
			for(int i = 0; i < sizeindex.length; i++) {
				oiVO.setSizeIndex(sizeindex[i]);
				oiVO.setOrderItemStock(orderitemStock[i]);
				
				int result = sizeService.selectStockCheck(oiVO);
				if(result == 0) {
					return "0";
				}
			}						
			return "1";
		}
		
		@ResponseBody
		@RequestMapping(value="/prdCodeCheck.do", method = RequestMethod.GET)
		public String prdCodeCheck(String prdCode) {
			int result = productService.selectByPrdCode(prdCode);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/manageSearch.do", method = RequestMethod.GET)
		public List<ProductVO> manageSearch(SearchVO searchVO, int nowPage) {
			int totalCount = productService.selectManageCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<ProductVO> vo = productService.selectManageList(searchVO);
			
			return vo;
		}
		
		@ResponseBody
		@RequestMapping(value="/manageSearchPaging.do", method = RequestMethod.GET)	
		public PagingUtil manageSearchPaging(SearchVO searchVO, int nowPage) {					
			int totalCount = productService.selectManageCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);

			return paging;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/ prdDel.do", method = RequestMethod.POST)	
		public String prdDel(int prdIndex) {
			int result = productService.updatePrdDel(prdIndex);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/sizeModify.do", method = RequestMethod.POST)
		public String sizeModify(SizeVO vo) {
			int result = sizeService.updateSizeStock(vo);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/sizeinsert.do", method = RequestMethod.POST)
		public String sizeinsert(SizeVO vo, String inputSize) {
			vo.setSizeKind(inputSize);
			vo.setSizeStock(0);
			
			int result = sizeService.insertSize(vo);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/orderList.do", method = RequestMethod.GET)
		public List<OrderVO> orderList(SearchVO searchVO) {
			int totalCount = orderService.selectManagerCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, searchVO.getNowPage(), 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<OrderVO> orderList = orderService.selectManager(searchVO);
			
			
			return orderList;
		}
		
		@ResponseBody
		@RequestMapping(value="/orderListPaging.do	", method = RequestMethod.GET)
		public PagingUtil orderListPaging(SearchVO searchVO) {
			int totalCount = orderService.selectManagerCount(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, searchVO.getNowPage(), 20);
						
			return paging;
		}
				
		@ResponseBody
		@RequestMapping(value="/orderStatus.do	", method = RequestMethod.GET)
		public String orderStatus(OrderVO vo) {

			int result = orderService.updateOrderStatus(vo);
			
			return result+"";
		}
		
		@ResponseBody
		@RequestMapping(value="/userOrderList.do", method = RequestMethod.GET)
		public List<OrderVO> userOrderList(SearchVO searchVO, int nowPage) {
			int totalCount = orderService.selectUserCount(searchVO.getUserIndex());
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			List<OrderVO> orderList = orderService.selectUser(searchVO);
			
			
			return orderList;
		}
		
		@ResponseBody
		@RequestMapping(value="/userOrderListPaging.do", method = RequestMethod.GET)
		public PagingUtil userOrderListPaging(SearchVO searchVO, int nowPage) {
			int totalCount = orderService.selectUserCount(searchVO.getUserIndex());
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
						
			return paging;
		}
		
		@ResponseBody
		@RequestMapping(value="reviewModify.do", method = RequestMethod.GET)
		public ReviewVO reviewModify(int reviewIndex, Model model) {
			ReviewVO vo = reviewService.selectReviewModify(reviewIndex);
			
			return vo;
		}
		
		@ResponseBody
		@RequestMapping(value="modify.do", method = RequestMethod.POST)
		public int reviewModifyOk(ReviewVO vo, HttpServletRequest req) throws IOException {
			
			if(req.getAttribute("reviewContent") != null){
				vo.setReviewContent(Encode.forHtmlAttribute((String) req.getAttribute("reviewContent")));
			}
			
			int result = reviewService.updateReview(vo);
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="/delete.do", method = RequestMethod.POST)
		public int deleteReview(ReviewVO vo) {
			int result = reviewService.deleteReview(vo);		
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="/searchMyReview.do", method = RequestMethod.GET)
		public List<ReviewVO> searchMyReview(SearchVO searchVO, int nowPage, HttpServletRequest req) {
			HttpSession session = req.getSession();
			UserVO loginUser = (UserVO)session.getAttribute("login");
			
			int totalCount = reviewService.myReviewTotalCnt(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			searchVO.setStart(paging.getStart());
			searchVO.setPerPage(paging.getPerPage());
			searchVO.setUserIndex(loginUser.getUserIndex());
			
			List<ReviewVO> reviewVo = reviewService.selectMyReview(searchVO);
			
			return reviewVo;
		}
		
		@ResponseBody
		@RequestMapping(value="/myReviewPaging.do", method = RequestMethod.GET)
		public PagingUtil myReviewPaging(SearchVO searchVO, int nowPage, HttpServletRequest req) {
			HttpSession session = req.getSession();
			UserVO loginUser = (UserVO)session.getAttribute("login");
			searchVO.setUserIndex(loginUser.getUserIndex());
			int totalCount = reviewService.myReviewTotalCnt(searchVO);
			PagingUtil paging = new PagingUtil(totalCount, nowPage, 20);
			
			return paging;
		}
}
	