<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		let btnIns = document.querySelector("#btnsignup");
		btnIns.addEventListener("click", checkData);
	}

	function checkData() {
		//alert("success");

		//이름 입력칸 공백 확인
		if (signupform.gpmName.value === "") {
			alert("이름을 입력하세요")
			signupform.gpmName.focus();
			return;
		}

		//나이 입력칸 선택 확인
		if (signupform.gpmAge.value === "-1") {
			alert("나이를 선택하세요")
			signupform.gpmAge.focus();
			return;
		}

		//이메일 입력칸 선택 확인
		if (signupform.gpmEmail.value === "") {
			alert("이메일을 입력하세요")
			signupform.gpmEmail.focus();
			return;
		}

		//비밀번호 입력칸 공백 확인
		if (signupform.gpmPwd.value === "") {
			alert("비밀번호를 입력하세요")
			signupform.gpmPwd.focus();
			return;
		}

		//비밀번호 확인 동일 여부 확인
		if (signupform.gpmPwd.value === signupform.gpmPwd_confirm.value) {
		} else {
			alert("비밀번호를 확인하세요")
			signupform.gpmPwd.focus();
			return;
		}

		//닉네임 입력칸 공백 확인
		if (signupform.gpmNick.value === "") {
			alert("닉네임을 입력하세요")
			signupform.gpmNick.focus();
			return;
		}

		signupform.submit();
	}
</script>
<style type="text/css">
body {
		background: linear-gradient(45deg, Violet, Orange);
		background-size: cover;
		height: 100vh;
}
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
.input-form2 {
	max-width: 680px;
	margin-top: 40px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="mb-3 fw-bold">친구들의 게시글을 보려면 가입하세요.</h2>
				<form class="validation-form" novalidate action=gpsignup method="post" name="signupform">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">이름</label>
							<input class="form-control" type="text" name="gpmName">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">성별</label>
								<select class="form-select form-select-sm mb-3" name="gpmGender">
									<option value="g_n" selected="selected">비공개</option>
									<option value="g_m">남성</option>
									<option value="g_f">여성</option>
							</select>
						</div>	
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">나이</label>
							<select class="form-select form-select-sm mb-3"  name="gpmAge">
									<option class="form-select form-select-sm mb-3" value="-1">선택</option>
									<%
										for (int i = 1; i < 100; i++) {
									%>
									<option value="<%=i%>"><%=i + "세"%></option>
									<%
										}
									%>
							</select>
						</div>	
					</div>
					<div class="row">
						<div class="col-md-7 mb-3">
							<label class="fw-bold">이메일</label>
							<input class="form-control" type="email" name="gpmEmail">
						</div>
					</div>	
					<div class="row">
						<div class="col-md-7 mb-3">
							<label class="fw-bold">닉네임</label>
							<input class="form-control" type="text" name="gpmNick">
						</div>
					</div>
					<div class="row">
						<div class="col-md-7 mb-3">
							<label class="fw-bold">비밀번호</label>
							<input class="form-control" type="password" name="gpmPwd">
						</div>
					</div>
					<div class="row">
						<div class="col-md-7 mb-3">
							<label class="fw-bold">비밀번호 확인</label>
							<input class="form-control" type="password" name="gpmPwd_confirm">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">	
							<input class="form-control btn btn-primary fw-bold" type="button" value="가입" id="btnsignup">
						</div>
					</div>		
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form2 col-md-12 mx-auto">
				<p class="fw-bold">계정이 있으신가요?<a class="fw-bold" href="index.jsp">로그인</a>
			</div>
		</div>
	</div>
</html>