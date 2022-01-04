<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GitPen 초기화면</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!----CSS link----->

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: linear-gradient(45deg, Violet, Orange);
	background-size: cover;
	height: 100vh;
}

.brand-wrapper {
	margin-bottom: 19px;
}

.brand-wrapper .logo {
	height: 60px;
}

.login-card {
	border: 0;
	border-radius: 27.5px;
	box-shadow: 0 10px 30px 0 rgba(172, 168, 168, 0.43);
	overflow: hidden;
}

.login-card-img {
	border-radius: 0;
	position: absolute;
	width: 100%;
	height: 100%;
	-o-object-fit: cover;
	object-fit: cover;
}

.login-card .card-body {
	padding: 85px 60px 60px;
}

@media ( max-width 422px) {
	.login-card .card-body {
		padding: 35px 24px;
	}
}

.login-card-description {
	font-size: 25px;
	color: #000;
	font-weight: normal;
	margin-bottom: 23px;
}

.login-card form {
	max-width: 326px;
}

.login-card .form-control {
	border: 1px solid #d5dae2;
	padding: 15px 25px;
	margin-bottom: 20px;
	min-height: 45px;
	font-size: 13px;
	line-height: 15;
	font-weight: normal;
}

.login-card .form-control::-webkit-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::-moz-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::-ms-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::-o-input-placeholder {
	color: #919aa3;
}

.login-card .form-control::placeholder {
	color: #919aa3;
}

.login-card .login-btn {
	padding: 13px 20px 12px;
	background-color: #000;
	border-radius: 4px;
	font-size: 17px;
	font-weight: bold;
	line-height: 20px;
	color: #fff;
	margin-bottom: 24px;
}

.login-card .login-btn:hover {
	border: 1px solid #000;
	background-color: transparent;
	color: #000;
}

.login-card .forgot-password-link {
	font-size: 14px;
	color: #919aa3;
	margin-bottom: 12px;
}

.login-card .forgot-id-link {
	font-size: 14px;
	color: #919aa3;
	margin-bottom: 12px;
}

.login-card-footer-text {
	font-size: 16px;
	color: #0d2366;
	margin-bottom: 60px;
}

@media ( max-width : 767px) {
	.login-card-footer-text {
		margin-bottom: 24px;
	}
}

.login-card-footer-nav a {
	font-size: 14px;
	color: #919aa3;
}
</style>
</head>
<body>
	<!-- 초기 화면. 로그인 및 회원가입, ID/PW 찾기 기능 제공 -->
	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						<img src="https://cdn.pixabay.com/photo/2020/06/10/02/22/caricature-5280770_960_720.jpg" class="login-card-img">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="brand-wrapper">
								<img src="https://cdn.pixabay.com/photo/2019/06/24/08/45/quill-pen-4295517_960_720.png" class="logo">
							</div>
							<p class="login-card-description">Sign in to GitPen</p>
							<form action="login" method="post">
								<div class="form-group">
									<label for="email" class="sr-only">Email</label> <input
										type="text" name="id" id="email" class="form-control"
										placeholder="Email adress">
								</div>
								<div class="form-group mb-4">
									<label for="Password" class="sr-only">Password</label> <input
										type="password" name="pwd" id="password"
										class="form-control" placeholder="**********">
								</div>
								<input name="login" id="login"
									class="btn btn-block login-btn mb-4" type="submit"     
									value="Login">												<!-- LoginController를 통해 작업 수행 지시 (POST)-->
							</form>
							<a href="gpid_search" class="forgot-id-link">ID 찾기</a>				<!-- GPMemberInfoSearchController를 통해 id_search로 이동하여 작업 수행 -->
							<a href="gppw_search" class="forgot-password-link">PW 찾기</a>		<!-- GPMemberInfoSearchController를 통해 pw_search로 이동하여 작업 수행 -->
							<p class="login-card-footer-text">
								계정이 없으신가요? <a href="gpsignup" class="text-reset">회원가입</a>	<!-- SignUpController를 통해 gpm_signup으로 이동하여 작업 수행 -->
							</p>
							<nav class="login-card-footer-nav">
								<a href="index.jsp">메인 페이지</a> <a href="#!">개인정보처리방침</a>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>