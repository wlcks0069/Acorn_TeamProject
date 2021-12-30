<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment</title>
</head>
<body>
	<h3>코멘트 작성</h3>
	<form action="cmcomment?mc_no=${mc_no }" method="post" name="cw">
		<table>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="mem_nick" value="${usernick}"
					disabled></td>
			</tr>
			<tr>
				<td>코멘트</td>
				<td colspan="2"><textarea maxlength="50" cols="80" rows="10"
						name="cm_commentcontent"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;"><input
					type="button" value="등록" id="btnAdd"> <input id="listBtn"
					type="button" value="목록" onclick="location.href='mcboard?page=1'">
				</td>
			</tr>
		</table>
	</form>
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