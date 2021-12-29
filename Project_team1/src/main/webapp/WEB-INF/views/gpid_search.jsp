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
<form action=gpid_search method="post" name="id_searchform">
	<h2>GP Project ID 찾기</h2>
		<table border="1">
		
			<tr>
				<td>이름</td>
				<td><input type="text" name="gpmName"></td>
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
				<td><input type="button" value="메일 주소 찾기" id="id_search"></td>
			</tr>
		</table>
	</form>

<hr>
<a href="gpsignup">신규 회원가입</a>&nbsp;&nbsp;
<a href="gppw_search">PW 찾기</a>	
</body>
</html>