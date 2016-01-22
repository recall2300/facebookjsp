<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.lang3.StringUtils"%>
<%@ page import="org.apache.http.impl.client.BasicResponseHandler"%>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@ page import="org.apache.http.client.methods.HttpGet"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.json.*" %>
<%
    String appKey        = (String)session.getAttribute("appKey");
    String appSecret     = (String)session.getAttribute("appSecret");

    String code             = request.getParameter("code");
    String errorReason         = request.getParameter("error_reason");
    String error             = request.getParameter("error");
    String errorDescription = request.getParameter("error_description");
    
    String accesstoken = "";
    String result       = "";

    if( StringUtils.isNotEmpty(code) ) {
        HttpGet get = new HttpGet("https://graph.facebook.com/oauth/access_token"+
                "?client_id="+appKey+
                "&client_secret="+appSecret+
                "&redirect_uri=http://localhost:8080/OAuth/facebookoauth.jsp" +
                "&code="+code);
        
		DefaultHttpClient http = new DefaultHttpClient();
        result = http.execute(get, new BasicResponseHandler());
        
        accesstoken = result.substring(result.indexOf("=")+1);
        System.out.println(result);
        session.setAttribute("accessToken", accesstoken);
    }
    
  //https://graph.facebook.com/me?fields=id,name,email,gender,cover,picture&access_token=CAANyORh9zsYBAPtnYY53x0OVTBcULMAA8jZAws8LdNUr5u0xMnnjQH2m8WbimknflHwQ1U7pTnTNCVZBv8pzOzxr6BFDD2E3kaZACOZCSA41wMahSljgCJmcqHN2KOOtj33er0IGruzciWeBgxMdWO9FZA97fgSwdnCUrfpaWo6xjCITO7QvRtezQO26WTzkZD&expires=5183804
    URL url = null;
    URLConnection urlConnection = null;
    String sUrl = "https://graph.facebook.com/me?fields=id,name,email,gender,cover,picture&access_token=";
    url = new URL(sUrl + accesstoken);
    urlConnection = url.openConnection();
    
        InputStream ist = urlConnection.getInputStream();
        InputStreamReader isr = new InputStreamReader(ist);
        BufferedReader br = new BufferedReader(isr);
    
        String nextLine = br.readLine();
        JSONObject jObject  = new JSONObject(nextLine);
        System.out.println(jObject.getString("email"));
        // while (nextLine != null) {
            //System.out.println(nextLine);
          //  nextLine = br.readLine();
        //} 
    
    
%>



    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type ="text/javascript">
	location.href = '<%= "http://localhost:8080/OAuth/header.jsp" %>';
</script>
</body>
</html>