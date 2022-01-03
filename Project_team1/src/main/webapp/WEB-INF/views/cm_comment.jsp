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
body {
	min-height: 100vh;
	background: linear-gradient(45deg, Violet, Orange);
}

h2{
text-align: center;
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
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="mb-3 fw-bold">코멘트 작성</h2>
				<form action="cmcomment?mc_no=${mc_no }" method="post" name="cw">
					<div class="row">
						<div>
							<div class="table table-borderless">
								<table class="table table-borderless align-middle">
									<tr>
										<td class="fw-bold" colspan="1">닉네임</td>
										<td colspan="1"><input type="text" name="mem_nick"
											value="${usernick}" disabled></td>
									</tr>
									<tr>
										<td class="fw-bold" colspan="1">코멘트</td>
										<td colspan="1"><textarea maxlength="50" style="width:100%;"
												rows="10" name="cm_commentcontent"></textarea></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="button" value="등록" id="btnAdd" class="btn btn-dark">
											<input id="listBtn" type="button" value="목록"
											onclick="location.href='mcboard?page=1'" class="btn btn-dark"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
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