/**
 * 
 */
function reviewList(){
	location.href='review_Id_list.jsp';
}
function reviewBookList(){
	location.href='review_view.jsp';
}

function mainGo(){
	location.href='kyobo_main.jsp';
}

function reviewCreateGo(){
	location.href='review_insert_form.jsp';
}
function reviewUpdateGo(){
		document.f.action = "review_modify_form.jsp";
		document.f.method='POST';
		document.f.submit();
	}


function reviewCreate() { 
		if (f.r_title.value == "") {
			alert("제목을 입력하십시요.");
			f.r_title.focus();
			return false;
		}
		if (f.u_id.value == "") {
			alert("아이디를 입력하십시요.");
			f.u_id.focus();
			return false;
		}
		if (f.r_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.r_contents.focus();
			return false;
		}
		if (f.r_grade.value == "") {
			alert("평점을 입력하십시요.");
			f.r_grade.focus();
			return false;
		}

		document.f.action ="review_insert_action.jsp";
		document.f.method="POST";
		document.f.submit();
	}
	
function reviewReplyCreate() {
		document.f.action = "review_reply_insert_form.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
function reviewReplayCreate() {
		if (f.r_title.value == "") {
			alert("제목을 입력하십시요.");
			f.r_reply_title.focus();
			return false;
		}
		if (f.r_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.r_reply_contents.focus();
			return false;
		}
		f.action ="review_reply_insert_action.jsp";
		f.method='POST';
		f.submit();
	}

	
	
	function reviewRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "review_remove_action.jsp";
			document.f.submit();
		}
	}
	
	function reviewUpdate() {
		if (f.r_title.value == "") {
			alert("제목을 입력하십시요.");
			f.r_title.focus();
			return false;
		}
		if (f.r_grade.value == "") {
			alert("평점을 입력하십시요.");
			f.r_grade.focus();
			return false;
		}
		if (f.r_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.r_contents.focus();
			return false;
		}

		f.action = "review_modify_action.jsp";
		f.submit();
	}

	









