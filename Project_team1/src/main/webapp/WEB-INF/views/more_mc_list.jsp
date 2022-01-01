<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<td><a href="cmboard?page=1&&mc_no=${maincontent.mc_no}">${maincontent.mc_comment }
				comments</a></td>
		<td><button id="btnLike${status.index }" type="button">
				<img id="imgId${status.index }" src="./resources/images/dislike.PNG"
					width="20" height="20"> ${maincontent.mc_like }
			</button></td>
	</tr>
</c:forEach>