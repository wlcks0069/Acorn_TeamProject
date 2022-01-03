<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment</title>
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

#floatingTextarea {
	border-radius: 3%;
}
</style>
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
		<h2 class="mb-3 fw-bold">코멘트 작성</h2>
		<form action="cmcomment?mc_no=${mc_no }" method="post" name="cw">
			<div>
				<textarea maxlength="50" style="width: 100%;" rows="10"
					name="cm_commentcontent" placeholder="Content here" id="floatingTextarea" class="form-control"></textarea>
			</div>
			<div style="text-align: center;">
            <input type="button" class="btn btn-dark" value="등록" id="btnAdd">
            <input id="listBtn" type="button" class="btn btn-dark" value="뒤로"
               onclick="location.href='cmboard?mc_no=${mc_no}&&mc_page=1'">
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