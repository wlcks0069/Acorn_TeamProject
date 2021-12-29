<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		}
		else{
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
</head>
<body>
	<form action=gpsignup method="post" name="signupform">
	<h2>GP Project 회원가입</h2>
		<table border="1">
		
			<tr>
				<td>이름</td>
				<td><input type="text" name="gpmName"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td><select name="gpmGender">
					<option value="g_n" selected="selected">비공개</option>
					<option value="g_m">남성</option>
					<option value="g_f">여성</option>
				</select></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><select name="gpmAge">
					<option value="-1">선택</option>
					<%for(int i=1; i<100; i++){ %>
					<option value="<%=i%>"><%=i+"세"%></option>
					<%} %>
				</select></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="email" name="gpmEmail"></td>
			</tr>
			
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="gpmNick"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="gpmPwd"></td>
			</tr>
			
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="gpmPwd_confirm"></td>
			</tr>
			
			<tr>
				<td><input type="button" value="가입" id="btnsignup"></td>
			</tr>
		</table>
	</form>
</html>