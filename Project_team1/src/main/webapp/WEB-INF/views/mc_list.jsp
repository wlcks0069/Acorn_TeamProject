<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Contents</title>
</head>
<body>
	<div>
		<h1>Main Content List</h1>
		<p>리스트</p>
		<a href="mcwrite">글쓰기</a>
	</div>

	<table>
		<thead>
			<tr style="background-color: silver">
				리스트 확인용 임시 포맷
				<th>번호</th>
				<th>샘플 이미지</th>
				<th>본문(test는 짧게 해주세요)</th>
				<th>닉네임</th>
				<th>작성일</th>
				<th>좋아요</th>
				<th>댓글</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="maincontent" items="${maincontentslist}">
				<tr>
					<td>${maincontent.mc_no}</td>
					<td><img
						src="https://post-phinf.pstatic.net/MjAxODExMDdfMTg5/MDAxNTQxNTQ3MTI0MzMz.x7pnNMgKFtBCuU2ecu_Kb4fOCqZT_e-FicfgELZus6wg.YJK6ERoqHz5_jqLpZu5Sn8GixQOa17sAUcL1I94ogWQg.JPEG/20181028085129.jpg?type=w1200"
						style="width: 200px" /></td>
					<td>${maincontent.mc_content }</td>
					<td>${maincontent.mem_nick }</td>
					<td>${maincontent.mc_date }</td>
					<td>${maincontent.mc_like }</td>
					<td>${maincontent.mc_comment }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		//페이지가 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정한다.
		let currentPage=${page};
		//현재 로딩중인지 여부를 관리할 변수
		let isLoading=false;
	
		//웹브라우저의 창을 스크롤 할때 마다 호출되는 함수 등록
		$(window).on("scroll", function(){
			//위로 스크롤 된 길이
			let scrollTop=$(window).scrollTop();
			//웹 브라우저 창의 높이
			let windowHeight=$(window).height();
			//문서 전체의 높이
			let documentHeight=$(document).height();
			//바닥까지 스크롤 되었는지 여부를 알아낸다.
			let isBottom=scrollTop+windowHeight+10>=documentHeight;
			//만일 바닥까지 스크롤되고
			if(isBottom){
				console.log("hit!!");
				//만일 현재 페이지가 마지막 페이지이거나 아직 로딩중이라면
				if(currentPage==${totalpage}||isLoading){
					return; //함수를 여기서 끝내기
				}
				//현재 로딩중이라는 상태로 바꿔준다.
				isLoading=true;
				//요청할 페이지 번호를 1 증가시킨다.
				currentPage++;
				//ajax요청을 통해서 추가목록을 받아온다.
				$.ajax({
					url:"moremcboard",
					method:"post",
					data:"page="+currentPage,
					success:function(responseData){
						//응답된 문자열을 tbody에 추가해서 html로 해석되게 하고
						$("tbody").append(responseData);
						//로딩이 끝났다고 상태를 바꿔준다.
						isLoading=false;
					}
				});
			}
		});
	</script>
</body>
</html>











