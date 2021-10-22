<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<!-- jquery -->
<script type="text/javascript" src="/resources/jquery/jquery-3.6.0.js"></script> 

<!-- bootstrap -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.bundle.js"></script>

<!-- css -->
<link href="/resources/assets/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<table class="table">
	<thead>
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	</thead>

	<tbody class="resultTbody">

	</tbody>
</table>

<div class="pagination center">
</div>

<div class="input-group mb-3 search center">
	<select id="condition">
		<option value="title">제목</option>
		<option value="writer">게시자</option>
		<option value="all" selected>제목 + 게시자</option>
	</select>

  <input type="text" id="search_title" class="form-control" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="button" id="search">Button</button>
</div>
<script>
function boardlist(condition, title, nowPage, cntPerPage) { //조회, 검색
	$.ajax({
		type : "GET",
        url : "/data/board",
        dataType : 'json',
        data: {"searchkey": condition, "searchword": title, "nowPage": nowPage, "cntPerPage": cntPerPage},
        success : function(returnData) {
            const list = returnData.board_list; // rest controller "board_list"
            const paging = returnData.paging;

            $(".resultTbody").empty(); //.은 클래스 # 아이디
            // 테이블
            if(list.length > 0){
                /* 표 생성 */
                let str = '';
                $.each(list, function(i, value){
                    str += '<tr>'
                    str += '<td>' + value.title + '</td>'
                    str += '<td>' + value.writer + '</td>'
                    str += '<td>' + value.reg_date + '</td>'
                    str += '</tr>'
                });
                $(".resultTbody").append(str);
            } else {
                $(".resultTbody").empty();
                const str = $("<p/>").text("데이터가 없습니다.");
                $(".resultTbody").append(str);
            }
            
            /* pagination */
            let pagination = '';
            if (paging.startPage != 1) {
            	pagination += '<a id="before">&lt;</a>'
            }
            for(let i = paging.startPage; i <= paging.endPage; i++){
            	if(i == paging.nowpage) {
            		pagination += '<b>' + i + '</b>'
            	} else {
            		pagination += '<a id="'+ i +'">' + i + '</a>'
            	}            	
            }
            if (paging.endPage != paging.lastPage) {
            	pagination += '<a id="after">&gt;</a>'
            }
            $(".pagination").append(pagination);
            
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
        }
	});
}

$('#search').click(function(){
	const condition = document.getElementById("condition").value;
	const title = document.getElementById("search_title").value;
	boardlist(condition, title, 1, 10);
})

window.onload = boardlist("all", "", 1, 10);
</script>
</body>
</html>