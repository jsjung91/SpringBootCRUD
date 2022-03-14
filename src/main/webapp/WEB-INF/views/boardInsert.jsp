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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on("click", function(e){
		e.preventDefault();
		fn_boardInsert();
	});
	$("#list").on("click", function(e){		
		fn_boardList();
	});
});

function fn_boardList(){
	window.location.href="/board/list.do";
}

function fn_boardInsert(){
	if(!$("#subject").val()){
		alert("제목을 입력하세요.");
		return;
	}else if(!$("#name").val()){
		alert("이름을 입력하세요.");
		return;
	}
	
	var data = {
		subject : $("#subject").val(),
		name : $("#name").val(),
		content : $("#content").val()
	};
	
	$.ajax({
		type:"POST",
		url:"/board/boardInsert.do",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		data:JSON.stringify(data),
		success : function(data, status) {
			alert("글이 등록되었습니다.");
			window.location.href="/board/list.do";
		},
		error : function(jqXHR){
			alert("실패 하였습니다 : " + jqXHR.responseText);
		}
	});
}
</script>
<body>
	 <form id="frm" name="frm">
          <table class="board_view">
          	<colgroup>
          		<col width="15%">
          		<col width="*">
          	</colgroup>
     	    <caption>게시글 작성</caption>
     	    <tbody>
     	    	<tr>
     	    		<th scope="row">제목</th>
     	    		<td><input type="text" id="subject" name="subject" class="wdp_90"></input></td>
     	    	</tr>
     	    	<tr>
     	    		<th scope="row">작성자</th>
     	    		<td><input type="text" id="name" name="name" class="wdp_90"></input></td>
     	    	</tr>  
          		<tr>
          			<td colspan="2" class="view_text">
          				<textarea rows="20" cols="100" title="내용" id="content" name="content"></textarea>
          			</td>
          		</tr>	            
          	</tbody>
        </table> 
        <a href="#this" class="btn" id="write">등록하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
     </form>	
</body>
</html>