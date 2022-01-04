<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MC_Writer</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<script type="text/javascript">
	window.onload = function() {
		let btnAdd = document.querySelector("#btnAdd");
		btnAdd.addEventListener("click", checkData);
	}
	function checkData() {
		//alert(mw.mem_nick.value);
		if (mw.mc_content.value === "") {
			alert("내용를 입력하세요.");
			mw.mc_comment.focus();
			return;
		}

		//색 입력칸 선택 확인
		if (mw.mc_color.value === "-1") {
			alert("색을 선택하세요")
			mw.mc_color.focus();
			return;
		}

		//채도 입력칸 선택 확인
		if (mw.mc_brightness.value === "-1") {
			alert("채도를 선택하세요")
			mw.mc_brightness.focus();
			return;
		}

		mw.submit();
	}
</script>
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
	<div class="container">
		<form action="mcwrite?color=${mc_color.value }" method="post"
			name="mw">
			<br>
			<div>
				<textarea class="form-control" style="font-size: 19px; maxlength="300" cols="50" rows="20"
					placeholder="Content here" name="mc_content"></textarea>
			</div>
			<br>
			<div>
				<label for=""><strong>현재의 기분</strong></label> <select
					class="form-select" style="width:150px;height:30px;" aria-label="Default select example"
					name="mc_color">
					<option value="-1">====색상====</option>
					<option value="#C5E1A5">평온 / green</option>
					<option value="#FFFC81">기쁨 / yellow</option>
					<option value="#EB6363">화남 / red</option>
					<option value="#A5C9E8">우울 / blue</option>
					<option value="#DDBADE">무서움 / purple</option>
					<option value="#bdbdbd">심심 / grey</option>
				</select> <label for=""><strong>기분의 정도</strong></label> <select
					class="form-select" style="width:150px;height:30px;" aria-label="Default select example"
					name="mc_brightness">
					<option value="-1">====채도====</option>
					<option value=100>100%</option>
					<option value=75>75%</option>
					<option value=50>50%</option>
					<option value=25>25%</option>
					<option value=0>0%</option>
				</select>
			</div><br>
			<div style="text-align: center;">
				<input type="button" class="btn btn-dark btn-md" style="font-size : 24px;" value="등록" id="btnAdd">&ensp;
				<input id="listBtn" type="button" class="btn btn-dark btn-md" style="font-size : 24px;" value="목록"
					onclick="location.href='mcboard?page=1'">
			</div>
		</form>
	</div>
</body>
</html>