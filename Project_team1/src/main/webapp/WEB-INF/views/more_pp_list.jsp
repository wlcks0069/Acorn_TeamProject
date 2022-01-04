<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="ppmaincontent" items="${ppmaincontentslist}"
	varStatus="status">
	<tr>
		<th colspan="2">작성자 - ${ppmaincontent.mem_nick }</th>
		<th>No.${ppmaincontent.mc_no}</th>
	</tr>
	<tr>
		<td id="content" colspan="3"
			style="background-color: ${ppmaincontent.mc_color }"><a
			href="cmboard?page=1&&mc_no=${ppmaincontent.mc_no}&&mc_page=${page}&&isppmclist=true&&isppcommentlist=false"
			id="letterStyle">${ppmaincontent.mc_content }</a></td>
	</tr>
	<tr>
		<td>${ppmaincontent.mc_date }</td>
		<td>${ppmaincontent.mc_comment }comments</td>
		<td>${ppmaincontent.mc_like }likes</td>
	</tr>
</c:forEach>