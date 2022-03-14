<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#update").on("click", function(){		
		fn_boardUpdate();
	});
	$("#list").on("click", function(){		
		fn_boardList();
	});
});

function fn_boardList(){
	window.location.href="/board/list.do";
}

function fn_boardUpdate(){	
	var data = {
			bno : $("#bno").val(),
			subject : $("#subject").val(),
			content : $("#content").val()
	};
	
	$.ajax({
		type:"POST",
		url:"/board/boardUpdate.do",
		dataType:"json",
		data:JSON.stringify(data),
		contentType:"application/json; charset=UTF-8",
		success : function(data, status) {
			alert("글이 수정되었습니다.");			
		},
		error : function(jqXHR){
			alert("실패  : " + jqXHR.responseText);
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
     	    <caption>게시글 수정</caption>
     	    <tbody>
     	    	<tr>
     	    		<th scope="row">제목</th>
     	    		<td><input type="text" id="subject" name="subject" class="wdp_90" value="${board.subject}"></input>
     	    		<input type="hidden" id="bno" value="${ board.bno }">
     	    		</td>     	    		
     	    	</tr>
     	    	<tr>
     	    		<th scope="row">작성자</th>
     	    		<td><input type="text" id="name" name="name" class="wdp_90" value="${board.name}" readOnly></input></td>
     	    	</tr>  
          		<tr>
          			<td colspan="2" class="view_text">
          				<textarea rows="20" cols="100" title="내용" id="content" name="content">${board.content}</textarea>
          			</td>
          		</tr>	            
          	</tbody>
        </table> 
        <a href="#this" class="btn" id="update">수정</a>
		<a href="#this" class="btn" id="list">목록</a>
     </form>
</body>
</html>