<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/assets/common/head.jsp"%>

<body>
	<%@include file="/resources/assets/common/header.jsp"%>

	<div class="board">

		<h1 class="page_title">게시물 목록</h1>

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

		<div class="pagination center"></div>
		<br>

		<div class="input-group mb-3 search center">
			<select id="condition">
				<option value="title">제목</option>
				<option value="writer">게시자</option>
				<option value="all" selected>제목 + 게시자</option>
			</select> <input type="text" id="search_title" class="form-control"
				aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="search">검색</button>
		</div>
	</div>


	<!-- 게시물 상세 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시물 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="title">
						<label for="title_input" class="col-form-label">제목</label>
						<input type="text" class="form-control" id="title_input" name="title_input" disabled>
					</div><br>
					<div class="writer">
						<label for="writer_input" class="col-form-label">작성자</label>
						<input type="text" class="form-control" id="writer_input" name="writer_input" disabled>
					</div><br>
					<div class="contents">
						<label for="contents_input" class="col-form-label">내용</label>
						<input type="text" class="form-control" id="contents_input" name="contents_input" disabled>
					</div><br>
					<div class="file">
						<label for="file_input" class="col-form-label">파일첨부</label>
						<input type="file" class="form-control" id="file_input" name="file_input" disabled>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" data-bs-target="exampleModal2" data-bs-toggle="modal">수정</button> -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시물 수정 Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel2">게시물 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="title">
						<label for="title_input" class="col-form-label">제목</label>
						<input type="text" class="form-control" id="title_reinput" name="title_reinput">
					</div><br>
					<div class="writer">
						<label for="writer_input" class="col-form-label">작성자</label>
						<input type="text" class="form-control" id="writer_reinput" name="writer_reinput">
					</div><br>
					<div class="contents">
						<label for="contents_input" class="col-form-label">내용</label>
						<input type="text" class="form-control" id="contents_reinput" name="contents_reinput">
					</div><br>
					<div class="file">
						<label for="file_input" class="col-form-label">파일첨부</label>
						<input type="file" class="form-control" id="file_reinput" name="file_reinput">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/resources/assets/common/footer.jsp"%>
</body>
<script>
	function boardlist(condition, title, nowPage, cntPerPage) { //조회, 검색
		$
				.ajax({
					type : "GET",
					url : "/data/board",
					dataType : 'json',
					data : {
						"searchkey" : condition,
						"searchword" : title,
						"nowPage" : nowPage,
						"cntPerPage" : cntPerPage
					},
					success : function(returnData) {
						const list = returnData.board_list; // rest controller "board_list"
						const paging = returnData.paging;

						$(".resultTbody").empty();
						$(".pagination").empty();

						// 테이블
						if (list.length > 0) {
							/* 표 생성 */
							let str = '';
							$
									.each(
											list,
											function(i, value) {
												str += '<tr>'
												str += '<td><a type="button" onclick=\'get_detail("'+ value.title +'", "'+ value.writer +'", "'+ value.contents +'", "'+ value.file_path +'",)\' data-bs-toggle="modal" data-bs-target="#exampleModal">'
														+ value.title
														+ '</a></td>'
												str += '<td>' + value.writer
														+ '</td>'
												str += '<td>' + value.reg_date
														+ '</td>'
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
							const before = paging.startPage - 1;
							pagination += '<a class="page" href="javascript:void(0);" onclick=\'boardlist("'
									+ condition
									+ '", "'
									+ title
									+ '", "'
									+ before
									+ '", "'
									+ cntPerPage
									+ '");\'>&lt;</a>';
						}
						for (let i = paging.startPage; i <= paging.endPage; i++) {
							if (i == paging.nowPage) {
								pagination += '<b class="page">' + i + '</b>';
							} else {
								pagination += '<a class="page" href="javascript:void(0);" onclick=\'boardlist("'
										+ condition
										+ '", "'
										+ title
										+ '", "'
										+ i
										+ '", "'
										+ cntPerPage
										+ '");\'>'
										+ i + '</a>';
							}
						}
						if (paging.endPage != paging.lastPage) {
							const after = paging.endPage + 1;
							pagination += '<a class="page" href="javascript:void(0);" onclick=\'boardlist("'
									+ condition
									+ '", "'
									+ title
									+ '", "'
									+ after
									+ '", "'
									+ cntPerPage
									+ '");\'>&gt;</a>';
						}
						$(".pagination").append(pagination);
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert(xhr.status);
					}
				});
	}

	$('#search').click(function() {
		const condition = document.getElementById("condition").value;
		const title = document.getElementById("search_title").value;
		boardlist(condition, title, 1, 10);
	})
	
	function get_detail(title, writer, contents, file_path) {
		$('.modal-body #title_input').val(title);
		$('.modal-body #writer_input').val(writer);
		$('.modal-body #contents_input').val(contents);
		$('.modal-body #file_input').val(file_path);
	}

	window.onload = boardlist("all", "", 1, 10);
</script>
</html>