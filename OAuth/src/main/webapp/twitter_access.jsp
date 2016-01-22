<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="twitter4j.*" %>
<%@ page import="twitter4j.conf.*" %>
<%@ page import="twitter4j.auth.*" %>
<%@ page import ="java.util.*" %>
<%@ include file="twitter.jsp" %>
    
<%
	twitteroauth twitter_api = new twitteroauth();
 
  // 트위터 앱 생성후 받은 토큰
  twitter_api.setConsumer_key("oi9uv7nIxPqcTTKu3WpOQeW4C");
  twitter_api.setConsumer_secret("d26Hq4TMBo2uNOplbI5hbmKObXKB4BUgl335ODOYNfymawVkv3");
 
//  HashMap<String,String> mapCookie = (HashMap) setCookies(request.getCookies());
 
  // 인증받은 토큰
  String accessToken = (String)session.getAttribute("TaccessToken");
  String accessTokenSecret = (String)session.getAttribute("TaccessTokenSecret");
 
  // 재인증여부
  if (accessToken != null && accessTokenSecret != null) {
    twitter_api.SignIn(accessToken,accessTokenSecret);
 
    out.println(twitter_api.twitter.verifyCredentials().getId()); // 사용자 아아디
    out.println(twitter_api.twitter.verifyCredentials().getScreenName()); // 사용자 이름
 
  } else { // 인증 받은 토큰이 없는 경우
 
    // 인증 요청 토큰 생성
    twitter_api.getRequestToken();
 
    String requestToken = twitter_api.requestToken.getToken();
    String requestTokenSecret = twitter_api.requestToken.getTokenSecret();
    String authorizationUrl = twitter_api.requestToken.getAuthenticationURL();
    System.out.println("");
 
    // 생성한 토큰 세션에 저장.
    session.setAttribute("TrequestToken",requestToken);
    session.setAttribute("TrequestTokenSecret",requestTokenSecret);
    
    // 인증url 리다이렉트
    response.sendRedirect(authorizationUrl);
  }
%>