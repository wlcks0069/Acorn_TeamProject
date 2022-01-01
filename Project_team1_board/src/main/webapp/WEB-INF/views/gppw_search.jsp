<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		}
		else{
			alert("다시 생각해보세요")
			pw_searchform.buttering.focus();
			return;
		}
		
		pw_searchform.submit();
	}
</script>
</head>
<body>
<form action=gppw_search method="post" name="pw_searchform">
	<h2>GP Project ID 찾기</h2>
		<table border="1">
		
			<tr>
				<td>이름</td>
				<td><input type="text" name="gpmName"></td>
			</tr>
						
			<tr>
				<td>이메일</td>
				<td><input type="email" name="gpmEmail"></td>
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
				<td>이 시대가 낳은 최고의 교육자 이름을 쓰세요</td>
				<td><input type="text" name="buttering"></td>
			</tr>	
			
			<tr>
				<td><input type="button" value="비밀번호 찾기" id="pw_search"></td>
			</tr>
		</table>
	</form>

<hr>
<a href="gpsignup">신규 회원가입</a>&nbsp;&nbsp;
<a href="gpid_search">ID 찾기</a>	
</body>
</html>