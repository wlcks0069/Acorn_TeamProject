<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	System.out.println(session.getAttribute("numList"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Contents</title>
<style>
#content {
	height: 500px;
	width: 500px;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1>Git Pen</h1>
		<a href="mcwrite">글쓰기</a>
		<table>
			<tbody>
				<c:forEach var="maincontent" items="${maincontentslist}"
					varStatus="status">
					<tr>
						<th colspan="2">작성자 - ${maincontent.mem_nick }</th>
						<th>No.${maincontent.mc_no}</th>
					</tr>
					<tr>
						<td id="content" colspan="3"
							style="background-color: ${maincontent.mc_color }">${maincontent.mc_content }</td>
					</tr>
					<tr>
						<td>${maincontent.mc_date }</td>
						<td><a href="cmcomment?mc_no=${maincontent.mc_no}">${maincontent.mc_comment }
								comments</a></td>
						<td><button id="btnLike${status.index }" type="button">
								<img id="imgId${status.index }"
									src="./resources/images/dislike.PNG" width="20" height="20">
								${maincontent.mc_like }
							</button></td>
					</tr>
					<c:forEach var="cmcontent" items="${cmList }">
						<tr>
							<td>${cmcontent.mem_nick }</td>
							<td>${cmcontent.cm_commentcontent }</td>
							<td>${cmcontent.cm_date }</td>
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
		for(let i=0; i<1000000; i++){
			$(function(){
				$("#btnLike"+i).on("click",function(){
					
					console.log("clicked");
					if($("#imgId"+i).attr("src")==="./resources/images/dislike.PNG"){
						$("#imgId"+i).attr("src","./resources/images/like.PNG");
					}else{
						$("#imgId"+i).attr("src","./resources/images/dislike.PNG");
					}
				});
			});
		}
		
		
		
	
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











