<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<!-- jQuery -->
<script type="text/javascript" src="/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>점수</th>
			</tr>
		</thead>

		<tbody class="resultTbody">
			<%-- <c:forEach var="l" items="${list}">
				<tr onclick="location.href='/detail/${l.name}'">
					<td>${l.name}</td>
					<td>${l.age}</td>
					<td>${l.score}</td>
				</tr>
			</c:forEach> --%>
			
		</tbody>
	</table>
<script type="text/javascript">
	function fn_boardlist() {
		$.ajax({
	        type : "GET",
	        url : "/data/list",
	        dataType : 'json',
	        success : function(returnData) {
	            var list = returnData.member_list;
	
	            $(".resultTbody").empty();
	            // 테이블
	            if(list.length > 0){
	                /* 표 생성 */
	                var str = '';
	                $.each(list, function(i, value){
	                    str += '<tr>'
	                    str += '<td>' + value.name + '</td>'
	                    str += '<td>' + value.age + '</td>'
	                    str += '<td>' + value.score + '</td>'
	                    str += '</tr>'
	                });
	                $(".resultTbody").append(str);
	            } else {
	                $(".resultTbody").empty();
	                var str = $("<p/>").text("데이터가 없습니다.");
	                $(".resultTbody").append(str);
	            }
	        },
	        error: function (xhr, ajaxOptions, thrownError) {
	            alert(xhr.status);
	        }
		});
	}
	window.onload = fn_boardlist();
</script>
</body>
</html>