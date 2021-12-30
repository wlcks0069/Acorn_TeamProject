<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		let btnIns = document.querySelector("#pw_search");
		btnIns.addEventListener("click", pwsearching);
	}

	function pwsearching() {
		//alert("success");

		//이메일 입력칸 선택 확인
		if (pw_searchform.gpmEmail.value === "") {
			alert("이메일을 입력하세요")
			signupform.gpmEmail.focus();
			return;
		}

		//이름 입력칸 공백 확인
		if (pw_searchform.gpmName.value === "") {
			alert("이름을 입력하세요")
			pw_searchform.gpmName.focus();
			return;
		}

		//나이 입력칸 선택 확인
		if (pw_searchform.gpmAge.value === "-1") {
			alert("나이를 선택하세요")
			pw_searchform.gpmAge.focus();
			return;
		}

		//비밀번호 확인 질문 입력칸 확인
		if (pw_searchform.buttering.value === "박영권") {
		} else {
			alert("다시 생각해보세요")
			pw_searchform.buttering.focus();
			return;
		}

		pw_searchform.submit();
	}
</script>
<style>
body {
	min-height: 100vh;
	background: linear-gradient(45deg, Violet, Orange);
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

.outer {
	text-align: center;
}

.inner {
	display: inline-block;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="mb-3 fw-bold">GP Project 비밀번호 찾기</h2>
				<form class="validation-form" novalidate action=gppw_search
					method="post" name="pw_searchform">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">이름</label> <input class="form-control"
								class="form-control" type="text" name="gpmName">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">이메일</label> <input class="form-control"
								type="email" name="gpmEmail">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label class="fw-bold">나이</label> <select
								class="form-select form-select-sm mb-3" name="gpmAge">
								<option value="-1">선택</option>
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
							<label class="fw-bold">이 시대가 낳은 최고의 교육자 이름을 쓰세요</label> <input
								class="form-control" type="text" name="buttering">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<input class="form-control btn btn-primary fw-bold" type="button" value="비밀번호 찾기" id="pw_search">
						</div>
					</div>	
				</form>
			</div>
		</div>
	</div>
	<br>
	<div class="outer">
		<div class="ineer">
			<a href="gpsignup">
				<button type="submit" class="btn btn-dark btn-md mb-3 fw-bold">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-plus-fill"
						viewBox="0 0 16 16">
  						<path
							d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
  						<path fill-rule="evenodd"
							d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
					</svg>
					회원가입
				</button>
			</a>&nbsp;&nbsp; <a href="gpid_search">
				<button type="submit" class="btn btn-dark btn-md mb-3 fw-bold">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
  						<path
							d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
					</svg>
					ID 찾기
				</button>
			</a>
		</div>
	</div>
</body>
</html>