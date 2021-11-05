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
	
	
	<!-- 게시물 등록 -->
	<div class="modal fade" id="boardInsertModalToggle" aria-hidden="true"
		aria-labelledby="boardInsertModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="boardInsertModalToggleLabel">게시물 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="insert" action="/insert" method="post" enctype="multipart/form-data">
						<div class="title">
							<label for="title_insert" class="col-form-label">제목</label> <input
								type="text" class="form-control" id="title_insert"
								name="title">
						</div>
						<br>
						<div class="writer">
							<label for="writer_insert" class="col-form-label">작성자</label> <input
								type="text" class="form-control" id="writer_insert"
								name="writer">
						</div>
						<br>
						<div class="contents">
							<label for="contents_insert" class="col-form-label">내용</label> <input
								type="text" class="form-control" id="contents_insert"
								name="contents">
						</div>
						<br>
						<div class="file">
							<label for="file_insert" class="col-form-label">파일첨부</label> <input
								type="file" class="form-control" id="file_insert"
								name="file">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button class="btn btn-primary" id="insert_btn">저장</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 게시물 상세 -->
	<div class="modal fade" id="boardDetailModalToggle" aria-hidden="true"
		aria-labelledby="boardDetailModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="boardDetailModalToggleLabel">게시물 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="id_detail">
					<div class="title">
						<label for="title_detail" class="col-form-label">제목</label> <input
							type="text" class="form-control" id="title_detail" disabled>
					</div>
					<br>
					<div class="writer">
						<label for="writer_detail" class="col-form-label">작성자</label> <input
							type="text" class="form-control" id="writer_detail" disabled>
					</div>
					<br>
					<div class="contents">
						<label for="contents_detail" class="col-form-label">내용</label> <input
							type="text" class="form-control" id="contents_detail" disabled>
					</div>
					<br>
					<div class="file">
						<label for="file_detail" class="col-form-label">파일첨부</label>
						<div id="file_detail">
							<!-- 업로드된 파일 목록 -->
						</div>
						<input type="hidden" id="file_list_detail">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button class="btn btn-primary" id="go_update_btn" data-bs-target="#boardUpdateModalToggle" data-bs-toggle="modal">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시물 수정 -->
	<div class="modal fade" id="boardUpdateModalToggle" aria-hidden="true"
		aria-labelledby="boardUpdateModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="boardUpdateModalToggleLabel">게시물 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="update" action="/update" method="post" enctype="multipart/form-data">
						<input type="hidden" id="id_update" name="id">
						<div class="title">
							<label for="title_update" class="col-form-label">제목</label> <input
								type="text" class="form-control" id="title_update"
								name="title">
						</div>
						<br>
						<div class="writer">
							<label for="writer_update" class="col-form-label">작성자</label> <input
								type="text" class="form-control" id="writer_update"
								name="writer">
						</div>
						<br>
						<div class="contents">
							<label for="contents_update" class="col-form-label">내용</label> <input
								type="text" class="form-control" id="contents_update"
								name="contents">
						</div>
						<br>
						<div class="file">
							<label for="file_update" class="col-form-label">파일첨부</label>
							<div id="file_update">
								<!-- 업로드된 파일 목록 -->
							</div>
							<input type="file" class="form-control" name="file">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-bs-target="#boardDetailModalToggle" data-bs-toggle="modal">취소</button>
					<button class="btn btn-primary" id="update_btn" data-bs-dismiss="modal">저장</button>
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
												const file_list = value.file_path.split(',')
												let filename_list = []
												for (let file of file_list) {
													filename = file.split('\\')[file.split('\\').length-1]
													filename_list.push(filename)
												}
												filename_list_str = '["' + filename_list.join('","') + '"]'
												str += '<tr>'
												str += '<td><a type="button" onclick=\'get_detail("'
														+ value.id
														+ '", "'
														+ value.title
														+ '", "'
														+ value.writer
														+ '", "'
														+ value.contents
														+ '", '
														+ filename_list_str
														+ ')\' data-bs-toggle="modal" href="#boardDetailModalToggle" role="button">'
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
	
	$('#insert_btn').click(function() {
		$('#insert').submit()
	})

 	function get_detail(id, title, writer, contents, filename_list) {
		$('.modal-body #id_detail').val(id);
		$('.modal-body #title_detail').val(title);
		$('.modal-body #writer_detail').val(writer);
		$('.modal-body #contents_detail').val(contents);
		$('.modal-body #file_list_detail').val(filename_list);
		
		$("#file_detail").empty()
		for(let i=0; i<filename_list.length; i++) {
			console.log(filename_list[i])
			const str = "<a type='button' id='file" + i + "_detail' onclick='window.open(\"/filedownload?id=" + id + "\")'>" + filename_list[i] + "</a><br>"
			$("#file_detail").append(str)
			$('.modal-body #file'+ i + '_detail').text(filename_list[i]);
		}
	}
	
	$('#go_update_btn').click(function() {		
		const id = document.getElementById("id_detail").value;
 		const title = document.getElementById("title_detail").value;
		const writer = document.getElementById("writer_detail").value;
		const contents = document.getElementById("contents_detail").value;
		const filename_list = document.getElementById("file_list_detail").value.split(',');

		$('.modal-body #id_update').val(id);
		$('.modal-body #title_update').val(title);
		$('.modal-body #writer_update').val(writer);
		$('.modal-body #contents_update').val(contents);

		$("#file_update").empty()
		for(let i=0; i<filename_list.length; i++) {
			console.log(filename_list[i])
			const str = "<a type='button' id='file" + i + "_update' onclick='window.open(\"/filedownload?id=" + id + "\")'>" + filename_list[i] + "</a>&nbsp<button type='button' class='btn btn-danger btn-sm'>삭제</button><br>"
			$("#file_update").append(str)
			$('.modal-body #file'+ i + '_update').text(filename_list[i]);
		}
	})
	
	$('#update_btn').click(function() {
		$('#update').submit()
	})

	window.onload = boardlist("all", "", 1, 10);
</script>
</html>