<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="maincontent" items="${maincontentslist}">
	<tr>
		<th colspan="2">작성자 - ${maincontent.mem_nick }</th>
		<th>No.${maincontent.mc_no}</th>
	</tr>
	<tr>
		<td id="content" colspan="3"
			style="background-color: ${maincontent.mc_color }">${maincontent.mc_content }</td>
	</tr>
	<tr>
		<th>${maincontent.mc_date }</th>
		<td><a href="cmcomment?mc_no=${maincontent.mc_no}">${maincontent.mc_comment }
				comments</a></td>
		<td>${maincontent.mc_like }likes</td>
	</tr>
</c:forEach>