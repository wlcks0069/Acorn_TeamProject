<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기 화면</title>
</head>
<body>

<!-- 초기 화면. 로그인 및 회원가입, ID/PW 찾기 기능 제공 -->

<h2>Project GP</h2>
<form action="login" method="post">
	아이디: <input type="text" name="id"><br>
	비밀번호: <input type="password" name="pwd"><br>
	<br>
	<input type="submit" value="로그인"><br>			<!-- LoginController를 통해 작업 수행 지시 (POST)-->
</form>
<a href="gpsignup">신규 회원가입</a>&nbsp;&nbsp;		<!-- SignUpController를 통해 gpm_signup으로 이동하여 작업 수행 -->	
<a href="gpid_search">ID 찾기</a>&nbsp;&nbsp;			<!-- GPMemberInfoSearchController를 통해 id_search로 이동하여 작업 수행 -->	
<a href="gppw_search">PW 찾기</a>						<!-- GPMemberInfoSearchController를 통해 pw_search로 이동하여 작업 수행 -->	
</body>
</html>