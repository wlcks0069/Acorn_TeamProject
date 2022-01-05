<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cm_comment(write)</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>
nav {
	position: -webkit-sticky;
	position: fixed;
	top: 0;
	width: 100%;
	background-color: #000000b3;
	font-size: larger;
	color: white;
}

a {
	color: white;
	text-decoration: none;
}

.navBar {
	color: white;
	padding-bottom: 10px;
}

body {
	height: 100vh;
	padding-top: 220px;
	background-color: #fff2d6;
	place-items: center;
	font-family: 'Nanum Brush Script', cursive;
	font-size:larger;
}

a.navbar-brand {
	color: white;
	text-decoration: none;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<div class="container-fluid fw-bold">
			<a class="navbar-brand" style="font-size: 36px;" href="mcboard?page=1">Git Pen</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav fw-bold">
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="mcwrite">글쓰기</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="ppboard" method="get" name="currentEmail" value="${idkey}">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="logout">로그아웃</a></li>
				</ul>
			</div>
			<div>
				<p class="navp mb-0" style="text-align: right">${idkey}님&thinsp;로그인중</p>
			</div>
		</div>
	</nav>
	<div class="container" style="margin-top : 150px;">
		<h2 class="mb-3 fw-bold">코멘트 작성</h2>
		<form
			action="cmcomment?mc_no=${mc_no }&&isppmclist=${isppmclist}&&isppcommentlist=${isppcommentlist}"
			method="post" name="cw">
			<div>
				<textarea maxlength="50" style="width: 100%;" rows="10"
					name="cm_commentcontent" placeholder="Content here"
					id="floatingTextarea" class="form-control"></textarea>
			</div>
			<br>
			<div style="text-align: center;">
				<input type="button" class="btn btn-dark btn-md" style="font-size : 24px;" value="등록" id="btnAdd">&ensp;
				<input id="listBtn" type="button" class="btn btn-dark btn-md" style="font-size : 24px;" value="뒤로"
					onclick="location.href='cmboard?page=1&&mc_no=${mc_no}&&mc_page=1&&isppmclist=${isppmclist}&&isppcommentlist=${isppcommentlist}'">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			let btnAdd = document.querySelector("#btnAdd");
			btnAdd.addEventListener("click", checkData);
		}
		function checkData() {
			//alert(mw.mem_nick.value);
			if (cw.cm_commentcontent.value === "") {
				alert("내용를 입력하세요.");
				cw.cm_commentcontent.focus();
				return;
			}
			cw.submit();
		}
	</script>
</body>
</html>