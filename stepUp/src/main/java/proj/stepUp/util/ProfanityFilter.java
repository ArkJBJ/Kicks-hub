package proj.stepUp.util;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component
public class ProfanityFilter implements Filter{

	   private final String regex = "\\b(시발|씨발|병신|새끼|미친|개새|좆|창녀|보지|보따리|빠가|걸레|십자가|섹스|야동|개년|개녀|개돼지|불알|애미|엄창|자지|잠지|젖밥|존나|좆나|씹귀찮|니애미|니미|니어미|보빨|보따|조또|조낸|조까|니아비|보지년|보지냥|보지놈|보지새|보지섹|보지털|보지충|보지팔이|보짓물|빨아대|빨아대는|염병|염병신|이새끼|저새끼|좆까|좆밥|좆만|좆바|좆빨|좆찐|좆찌|좆텐|좆트|좇같|좇이나|존니|존나게|존만|존만한|존만하네|존만한네|존만하네요|존만한것|존만하신|존만하신것|존만함|존만한놈|존만하시|존만하시겠|존만하심|존만하심|존만하시는|존만하시는것|존만하시나|존만하십|존만하시오|존만했|존만했나|존만했네|존만했는|존만했는것|존만했던|존만했던것|존만했다|존만했다고|존만했다면|존만했던가|존만했는가|존만하고|존만하면|존만하더라|존만하네|존만하게|존만하다|존만하냐|존만하고싶|존만하길|존만하길바라|존만했어|존만했어요|존만하냐고|존만하면|존만하겠|존만하시랄|존만하신지|존만한것같|존만한거같)\\b";
	   private final Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);

	
	   @Override
	   public void init(FilterConfig filterConfig) throws ServletException {}

	   @Override
	   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	           throws IOException, ServletException {
	       HttpServletRequest req = (HttpServletRequest) request;
	       HttpServletResponse res = (HttpServletResponse) response;

	       
	       // POST 메서드에 대해서만 필터링 수행하기
	       if (req.getMethod().equalsIgnoreCase("POST")) {
	           String freeCnt = req.getParameter("freeCnt");
	           String freeTitle = req.getParameter("freeTitle");
	           String reCnt = req.getParameter("reCnt");
	           String reviewContent = req.getParameter("reviewContent");
	           String qnaCnt = req.getParameter("qnaCnt");
	           String qnaTitle = req.getParameter("qnaTitle");
	           String qnareCnt = req.getParameter("qnareCnt");
	           
	           
	           if (freeCnt != null) {
	               String filteredContent = pattern.matcher(freeCnt).replaceAll("***");
	               req.removeAttribute("freeCnt");
	               req.setAttribute("freeCnt", filteredContent);
	           }
	           
	           if (freeTitle != null) {
	               String filteredContent = pattern.matcher(freeTitle).replaceAll("***");
	               req.removeAttribute("freeTitle");
	               req.setAttribute("freeTitle", filteredContent);
	           }
	           
	           if (reCnt != null) {
	               String filteredContent = pattern.matcher(reCnt).replaceAll("***");
	               req.removeAttribute("reCnt");
	               req.setAttribute("reCnt", filteredContent);
	           }
	           if (reviewContent != null) {
	        	   String filteredContent = pattern.matcher(reviewContent).replaceAll("***");
	        	   req.removeAttribute("reviewContent");
	        	   req.setAttribute("reviewContent", filteredContent);
	           }
	           
	           if (qnaCnt != null) {
	               String filteredContent = pattern.matcher(qnaCnt).replaceAll("***");
	               req.removeAttribute("qnaCnt");
	               req.setAttribute("qnaCnt", filteredContent);
	           }
	           if (qnaTitle != null) {
	        	   String filteredContent = pattern.matcher(qnaTitle).replaceAll("***");
	        	   req.removeAttribute("qnaTitle");
	        	   req.setAttribute("qnaTitle", filteredContent);
	           }	           
	           if (qnareCnt != null) {
	        	   String filteredContent = pattern.matcher(qnareCnt).replaceAll("***");
	        	   req.removeAttribute("qnareCnt");
	        	   req.setAttribute("qnareCnt", filteredContent);
	           }	           

	           
	       }
	       chain.doFilter(req, res);
	   }

	    @Override
	    public void destroy() {
	    	
	    }

}
