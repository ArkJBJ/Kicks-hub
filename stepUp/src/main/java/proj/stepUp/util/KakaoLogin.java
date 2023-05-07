package proj.stepUp.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class KakaoLogin {
	public String getKakaoAccessToken(String code) {//카카오 로그인 accessToken 발급 메소드
		String accessToken = "";
		String refreshToken = "";
		String reqUrl = "https://kauth.kakao.com/oauth/token";		
		
		
		try {
			 URL url = new URL(reqUrl);
			 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	         conn.setRequestMethod("POST");
	         conn.setDoOutput(true);
	         
	        //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	         StringBuilder sb = new StringBuilder();
	         sb.append("&grant_type=authorization_code");
	         sb.append("&client_id=0575c28de27e26d54b189d1b04528e6b");
	         sb.append("&redirect_uri=http://jjezen.cafe24.com/stepUp/user/kakaoLogin.do");
	         sb.append("&code=" + code);
	         bw.write(sb.toString());
	         bw.flush();
	         
	         //요청 결과 코드 받기
	         int responseCode = conn.getResponseCode();
	         
	         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	         String line = "";
	         String result = "";
	         
	         while ((line = br.readLine()) != null) {
	             result += line;
	         }
	         
	         //json 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	         JSONObject jsonObject = new JSONObject(result);

	         accessToken = jsonObject.getString("access_token");
	         refreshToken = jsonObject.getString("refresh_token");	          
	          
	          br.close();
	          bw.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return accessToken;
	}
	
	public String createKakaoUser(String token) {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		String userKakaoId = "";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        conn.setRequestProperty("Authorization", "Bearer " + token); //전송할 header 작성, access_token전송
			
	        //결과 코드가 200이라면 요청 성공
	        int responseCode = conn.getResponseCode();
	        
	        //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	        	result += line;
	        }
	        
	        
	        //json 라이브러리로 JSON파싱
	        JSONObject jsonObject = new JSONObject(result);
	        
	        Long id = jsonObject.getLong("id");
	        boolean hasEmail = jsonObject.getJSONObject("kakao_account").getBoolean("has_email");
	        String email = "";
	        if(hasEmail) {
	        	email = jsonObject.getJSONObject("kakao_account").getString("email");
	        }
	        
            userKakaoId = Long.toString(id);
            br.close();
            
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userKakaoId;
	}
}
