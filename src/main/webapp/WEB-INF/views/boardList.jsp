<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<table width="690" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="50" class="td_a">번호</td>			
			<td class="td_b" width="200">제목</td>			
			<td width="90" class="td_b">작성자</td>			
			<td width="90" class="td_b">작성일</td>		
		</tr>
		<!-- 데이터가 있을 경우 -->		
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td class="td_a_1">${ vo.bno }</td>				
				<td class="td_b_1 left">					
					<a href="<c:url value='/board/boardDetail.do?bno=${vo.bno}'/>" id="subject"
					style="text-decoration: none; color: red;">${ vo.subject }</a>
					<input type="hidden" id="bno" value="${ vo.bno }">
				</td>				
				<td class="td_b_1">${ vo.name }</td>				
				<td class="td_b_1"><fmt:formatDate
						value="${ vo.ins_date }" pattern="yyyy.MM.dd" /></td>				
			</tr>
		</c:forEach>

		<!-- 게시물이 없는경우 -->
		<c:if test="${ empty list }">
			<tr>
				<td align="center" colspan="11" width="100%" height="50"
					style="border: 1 solid #efefef">현재 등록된 글이 없습니다.</td>
			</tr>
		</c:if>
	</table>
	<a href="<c:url value='/board/insertForm'/>" class="btn" id="insert">글 작성</a>
</body>
</html>