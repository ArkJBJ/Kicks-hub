package proj.stepUp.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import org.json.JSONObject;

public class NaverLogin {
	public String requestLogin() {//네이버 api 로그인 요청 url 생성
	    String clientId = "_RZQQODb8_uG7sO8FvBU";//애플리케이션 클라이언트 아이디값";
	    String redirectURI;
	    String state;
	    String apiURL = "";
		try {
			redirectURI = URLEncoder.encode("http://jjezen.cafe24.com/stepUp/user/naverLoginOk.do", "UTF-8");

	    SecureRandom random = new SecureRandom();
	    state = new BigInteger(130, random).toString();
	    apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return apiURL;
	}
	
	
	public String getNaverAccessToken(String Code, String State) throws IOException {
	    String clientId = "_RZQQODb8_uG7sO8FvBU";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "BZ5t8_WwKZ";//애플리케이션 클라이언트 시크릿값";
	    String code = Code;
	    String state = State;
	    String redirectURI;
	    String apiURL;
	    String access_token = "";
	    String refresh_token = "";
		try {
			redirectURI = URLEncoder.encode("http://jjezen.cafe24.com/stepUp/user/naverLoginOk.do", "UTF-8");		    
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    
		    URL url = new URL(apiURL);
		    HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    con.setRequestMethod("GET");
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) { // 정상 호출
		    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    	
		    } else {  // 에러 발생
		    	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		    String inputLine;
		    String result = "";
		    while ((inputLine = br.readLine()) != null) {
		    	result += inputLine;
		    }
		    br.close();
		    if(responseCode==200) {
		    	JSONObject jsonObject = new JSONObject(result);
		    	access_token = jsonObject.getString("access_token");
		    }
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return access_token;
	}
	
	public String getUserInfo(String accessToken) {
		String access_token = accessToken;
		String id = "";
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", "Bearer " + access_token);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            JSONObject jsonObject = new JSONObject(response.toString());
            JSONObject responseObj = jsonObject.getJSONObject("response");
            id = responseObj.getString("id");
        } catch (Exception e) {
            System.out.println(e);
        }
        
		return id;
	}
	
	
	public int logout(String accessToken) {
		
		 try {
	            String apiURL = "https://nid.naver.com/oauth2.0/token";
	            String params = "grant_type=delete";
	            params += "&client_id=" + "_RZQQODb8_uG7sO8FvBU";//애플리케이션 클라이언트 아이디값";
	            params += "&client_secret=" + "BZ5t8_WwKZ";//애플리케이션 클라이언트 시크릿값";
	            params += "&access_token=" + accessToken;
	            params += "&service_provider=NAVER";

	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setDoOutput(true);

	            // 파라미터 전송
	            con.getOutputStream().write(params.getBytes("UTF-8"));
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));;
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		 
		return 0;
	}
}
