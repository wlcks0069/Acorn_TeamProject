<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MC_Writer</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
nav {
	top: 0;
	width: 100%;
	background-color: #000000b3;
	color: white;
}

.navBar {
	color: white;
	text-decoration: none;
	padding-bottom: 10px;
}

body {
	background-color: #fff2d6;
}
</style>
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
	<nav>
		<div>
			<h1>
				<a href="mcboard?page=1" class="navBar">Git Pen</a>
			</h1>
			<p>${idkey}님로그인중</p>
			<div class="navBar">
				<a href="mcboard?page=1" class="navBar">목록으로</a>
			</div>
		</div>
	</nav>
	<div class="container">
		<form action="mcwrite?color=${mc_color.value }" method="post"
			name="mw">
			<br>
			<div>
				<textarea class="form-control" maxlength="300" cols="50" rows="20"
					placeholder="Content here" name="mc_content"></textarea>
			</div>
			<br>
			<div>
				<label for=""><strong>현재의 기분</strong></label> <select
					class="form-select" aria-label="Default select example"
					name="mc_color">
					<option value="-1">====색상====</option>
					<option value="#C5E1A5">평온 / green</option>
					<option value="#FFFC81">기쁨 / yellow</option>
					<option value="#EB6363">화남 / red</option>
					<option value="#A5C9E8">우울 / blue</option>
					<option value="#DDBADE">무서움 / purple</option>
					<option value="#bdbdbd">심심 / grey</option>
				</select> <label for=""><strong>기분의 정도</strong></label> <select
					class="form-select" aria-label="Default select example"
					name="mc_brightness">
					<option value="-1">====채도====</option>
					<option value=100>100%</option>
					<option value=75>75%</option>
					<option value=50>50%</option>
					<option value=25>25%</option>
					<option value=0>0%</option>
				</select>
			</div>
			<div style="text-align: center;">
				<input type="button" class="btn btn-dark" value="등록" id="btnAdd">
				<input id="listBtn" type="button" class="btn btn-dark" value="목록"
					onclick="location.href='mcboard?page=1'">
			</div>
		</form>
	</div>
</body>
</html>