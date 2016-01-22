<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="twitter4j.auth.AccessToken" %>
    <%@ page import="twitter4j.auth.RequestToken" %>
    <%@ page import="twitter4j.*" %>
    <%@ page import="twitter4j.conf.*" %>
    <%@ page import="java.util.*" %>
	<%@ page import="java.io.*" %>
	
	
<%!

public class twitteroauth {
	 
	  private String consumer_key;
	  public void setConsumer_key(String consumer_key) {this.consumer_key = consumer_key; }
	  private String consumer_secret;
	  public void setConsumer_secret(String consumer_secret) {this.consumer_secret = consumer_secret; }
	 
	  private RequestToken requestToken = null;
	  private AccessToken accessToken = null;
	  private Twitter twitter = null;
	  	  
	  public void getUser(){
		  
	  }
			  
	  /*
	  public String getUserName(String name){
		  return name;
		  
	  }
	  
	  public void getProfileUrl(){
		  twitter.verifyCredentials().getOriginalProfileImageURL();
	  }  */
	  
	 
	  public twitteroauth() {
	    twitter = new TwitterFactory().getInstance();
	  }
	 
	  // 인증 요청 토큰 생성
	  public void getRequestToken() throws Exception{
	    twitter.setOAuthConsumer(this.consumer_key, this.consumer_secret);
	    requestToken = twitter.getOAuthRequestToken();
	  }
	 
	  // 인증된 토큰 생성
	  public void getAccessToken(String request_token,String request_tokensecret,String oauth_verifier) throws Exception {
	    try {
	      twitter.setOAuthConsumer(this.consumer_key, this.consumer_secret);
	     accessToken = twitter.getOAuthAccessToken(new RequestToken(request_token, request_tokensecret),oauth_verifier);
	    } catch (TwitterException te) {
	      System.out.println(" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ te);
	    }
	 
	    twitter.setOAuthAccessToken(accessToken);
	    /*
	    getUserName(twitter.verifyCredentials().getName());
	 
	    System.out.println(twitter.verifyCredentials().getName()); // 사용자 아이디
	    System.out.println("???????????????token : " + accessToken.getToken());
	    System.out.println("???????????????tokenSecret : " + accessToken.getTokenSecret());
	     */
	  }
	 
	  // 재인증 처리
	  public void SignIn(String access_token,String access_tokensecret) throws Exception {
	    twitter.setOAuthConsumer(this.consumer_key, this.consumer_secret);
	 
	    /* System.out.println("???????????????access_token : " + access_token);
	    System.out.println("???????????????access_tokensecret : " + access_tokensecret);
	  */
	    twitter.setOAuthAccessToken(new AccessToken(access_token,access_tokensecret));
	    // 사용자 아이디
	    /* System.out.println("??????????????????" + twitter.verifyCredentials().getId()); */
	  }
	 
	}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>