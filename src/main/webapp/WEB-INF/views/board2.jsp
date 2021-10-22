<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript" src="/resources/jquery/jquery-3.6.0.js"></script>
</head>
<body>
<form id="search" method="get" action="/board2">
<!-- 동기 통신은 form 으로 넘겨줌.. form tag 안에 버튼 있으면 js 안씀,, -->
	<input type="text" id="search_title" name="title">
</form>
<button id="search_btn">검색</button>
<div>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>내용</th>
			</tr>
		</thead>

		<tbody class="resultTbody">
			<c:forEach var="l" items="${board}">
				<tr>
					<td>${l.title}</td>
					<td>${l.writer}</td>
					<td>${l.contents}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<form id="write" method="post" action="/boardSubmit">
		<label>제목</label>
		<input type="text" id"="title" name="title"><br>
		<label>이름</label>
		<input type="text" id"="name" name="writer"><br>
		<label>내용</label>
		<input type="text" id"="contents" name="contents">
		<button id="submit" type="submit">등록</button>
	</form>
</div>
	<script>
		$("#search_btn").click(function() {
			$("#search").submit()
		})
	</script>	
</body>
</html>