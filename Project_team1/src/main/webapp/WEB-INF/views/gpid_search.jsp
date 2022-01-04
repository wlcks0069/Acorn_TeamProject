<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="./resources/css/searchIdPwd.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		let btnIns = document.querySelector("#id_search");
		btnIns.addEventListener("click", idsearching);
	}

	function idsearching() {
		//alert("success");

		//이름 입력칸 공백 확인
		if (id_searchform.gpmName.value === "") {
			alert("이름을 입력하세요")
			id_searchform.gpmName.focus();
			return;
		}

		//나이 입력칸 선택 확인
		if (id_searchform.gpmAge.value === "-1") {
			alert("나이를 선택하세요")
			id_searchform.gpmAge.focus();
			return;
		}

		id_searchform.submit();
	}
</script>

</head>
<body>
	<style>
body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 480px;
	padding: 15px;
	margin: auto;
}
</style>
	<main class="form-signin">
		<div class="container">
			<div class="input-form-background row">
				<div class="input-form col-md-12 mx-auto">
					<h2 class="mb-3 fw-bold text-center">GP Project ID 찾기</h2>
					<form class="validation-form" novalidate action=gpid_search
						method="post" name="id_searchform">
						<div class="row">
							<div class="mb-3">
								<label class="fw-bold">이름</label> <input class="form-control"
									class="form-control" type="text" name="gpmName">
							</div>
						</div>

						<div class="row">
							<div class="mb-3">
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
							<div class="mb-3">
								<input class="form-control btn btn-primary fw-bold"
									type="button" value="메일 주소 찾기" id="id_search">
							</div>
						</div>
					</form>
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
					</a> &nbsp;&nbsp; <a href="gppw_search">
						<button type="submit" class="btn btn-dark btn-md mb-3 fw-bold">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
                    <path
									d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
               </svg>
							PW 찾기
						</button>
					</a>
				</div>
			</div>
	</main>
</body>
</html>