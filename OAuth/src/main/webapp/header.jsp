<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%    
    String appKey        = "970014479732422";
    String appSecret     = "58059e8050c2c90a3b4e0cb9e4eec760";
    
    session.setAttribute("appKey", "970014479732422");
    session.setAttribute("appSecret", "58059e8050c2c90a3b4e0cb9e4eec760");
        
    String url = "http://www.facebook.com/dialog/oauth?client_id="+ 
    appKey+"&redirect_uri=http://localhost:8080/OAuth/facebookoauth.jsp&scope=public_profile,email";
    //https://graph.facebook.com/1002825653113268?fields=id,name,email&access_token=CAANyORh9zsYBAPtnYY53x0OVTBcULMAA8jZAws8LdNUr5u0xMnnjQH2m8WbimknflHwQ1U7pTnTNCVZBv8pzOzxr6BFDD2E3kaZACOZCSA41wMahSljgCJmcqHN2KOOtj33er0IGruzciWeBgxMdWO9FZA97fgSwdnCUrfpaWo6xjCITO7QvRtezQO26WTzkZD&expires=5183804
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script language="javascript"
	src="http://connect.facebook.net/ko_KR/all.js"></script>
<style>
.modal-dialog {
	margin-top: 15%;
}
</style>
<title>헤더 페이지</title>
<script>
function oauth_page() {
    window.location.href = '<%=url%>'
}
console.log("accesstoken : "+ "<%= (String)session.getAttribute("accessToken")%>");
function logout_page(){
	location.href = "/OAuth/logout.jsp";
}
</script>
</head>
<body>
	<!--  // include file="/WEB-INF/include/facebookoauth.jspf" -->
	<%
	String accessToken = (String)session.getAttribute("accessToken");
	%>



	<!-- http://bootstrapk.com/javascript/#modals -->
	<div class="container">
		<h2>인증창 예제</h2>
		<%
	if(accessToken != null){
		
	%>
		<button type="button" class="btn btn-info btn-lg" onclick="logout_page()">Logout</button>
		<%
	}
	else{
		%>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-backdrop="static" data-target="#myModal">Login</button>
		<%
	}
	
	%><!-- Trigger the modal with a button -->




		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">

			<div id="facebook-modal-1" class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" style="text-align: center">사용자 인증</h4>
					</div>
					<div class="modal-body">


						<div class="row">
							<div class="col-sm-4">
								<a href="#" onclick="oauth_page()"> <img
									class="img-responsive" src="img/facebook_icon.png"
									/ width="100" height="100"
									style="margin-right: auto; margin-left: auto;">
									<p style="text-align: center">페이스북</p>
								</a>
							</div>
							<div class="col-sm-4">
								<img class="img-responsive" src="img/twitter_icon.png"
									/ width="100" height="100"
									style="margin-right: auto; margin-left: auto;">
								<p style="text-align: center">트위터</p>
							</div>
							<div class="col-sm-4">
								<img class="img-responsive" src="img/payco_icon.jpg"
									/ width="100" height="100"
									style="margin-right: auto; margin-left: auto;">
								<p style="text-align: center">페이코</p>
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>

			<div id="facebook-modal-2" style="display: none;"
				class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" style="text-align: center">사용자 정보입력</h4>
					</div>
					<div class="modal-body">


						<form class="form-inline" role="form">
							<div style="text-align: center">
								<div>
									<label for="age">나이 :</label> <input type="text"
										class="input-mini form-control" id="age" style="width: 46px;"
										pattern="[0-9]{2}" required>
								</div>
								<br />
								<div>
									<label for="gender">성별 :</label> <label class="radio-inline">
										<input type="radio" name="optradio">남성
									</label> <label class="radio-inline"> <input type="radio"
										name="optradio">여성
									</label>
								</div>
								<textarea class="form-control valid" readonly rows="10"
									cols="70">

                                    서비스약관 제 1 장 총 칙 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱! 야호 신난다! UI나와라 뚝딱!
                                </textarea>
								<h3>개인정보 제공 동의서에 동의하십니까?</h3>
							</div>

							<div style="text-align: right">
								<div class="checkbox">

									<label> <input type="checkbox">네, 동의합니다.
									</label>
								</div>
							</div>
							<div style="text-align: center">
								<button type="submit" class="btn btn-default">저장하기</button>
								<br /> <br />
							</div>
						</form>
					</div>
				</div>

			</div>









		</div>
</body>
</html>