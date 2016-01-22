<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="twitter.jsp" %>
<%
  // 트위터에서 받은 인증토큰
  String oauthToken = request.getParameter("oauth_token"); // requestToken 토큰과 같은 값이여야 한다. (보안)
  String oauthVerifier = request.getParameter("oauth_verifier"); // 트위터에서 인증요청하면서 생성한 토큰
 
  // 세션에 저장했던 토큰
  String requestToken = (String) session.getAttribute("TrequestToken");
  String requestTokenSecret = (String) session.getAttribute("TrequestTokenSecret");
 
  // 보안상 토큰이 일치하는 지 비교.
  if (requestToken.equals(oauthToken)) { 
 
	twitteroauth twitter_api = new twitteroauth();
    twitter_api.setConsumer_key("oi9uv7nIxPqcTTKu3WpOQeW4C");
    twitter_api.setConsumer_secret("d26Hq4TMBo2uNOplbI5hbmKObXKB4BUgl335ODOYNfymawVkv3");
 
    // 인증된 토큰 생성
    twitter_api.getAccessToken(requestToken,requestTokenSecret,oauthVerifier);
     
    // 인증된 토큰을 변수에 담는다.
    String accessToken = twitter_api.accessToken.getToken();
    String accessTokenSecret = twitter_api.accessToken.getTokenSecret();
 
 	session.setAttribute("TaccessToken",accessToken);
 	session.setAttribute("TaccessTokenSecret",accessTokenSecret);
 	session.setAttribute("LOGIN", "T");
 	    
 	// 완료되면 생성한 세션 제거함.
 
  }
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type ="text/javascript">
	location.href = '<%= "/OAuth/header.jsp" %>';
</script>
</body>
</html>