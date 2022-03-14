<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#delete").on("click", function(){		
		fn_boardDelete();
	});
});

function fn_boardDelete(){
	if(confirm(${view.bno} + "번 게시글을 삭제할까요?")) {
		window.location.href="/board/boardDelete.do?bno="+${ view.bno };
	}
}

</script>
<body>
	<form id="frm" name="frm">
	<table class="board_view">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">
			<col width="15%">
		</colgroup>
		<caption>게시판 상세</caption>
		<tbody>
            <tr>
                <th>제목</th>
                <td>${view.subject}</td>                
            </tr>
            <tr>
                <th>작성자</th>
                <td>${view.name}</td>
                <th>작성시간</th>
                <td><fmt:formatDate value="${ view.ins_date }" pattern="yyyy.MM.dd" /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="4" class="view_text">                                              	  
              	  ${ view.content }              	  
                </td>
            </tr>            
        </tbody>
	</table>
	<a href="<c:url value='/board/list.do'/>" class="btn" id="list">목록</a>
	<a href="<c:url value='/board/updateForm?bno=${ view.bno }'/>" class="btn" id="update">수정</a>
	<a href="#this" class="btn" id="delete">삭제</a>
</form>
</body>
</html>