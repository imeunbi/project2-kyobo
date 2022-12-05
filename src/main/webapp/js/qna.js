/**
 * 
 */
function qnaList(){
	location.href='qna_list.jsp';
}

function mainGo(){
	location.href='kyobo_main.jsp';
}

function qnaCreateGo(){
	location.href='qna_insert_form.jsp';
}
function qnaUpdateGo(){
		document.f.action = "qna_update_form.jsp";
		f.method = "POST"
		document.f.submit();
		
	}


function qnaCreate() { 
		if (f.q_title.value == "") {
			alert("제목을 입력하십시요.");
			f.q_title.focus();
			return false;
		}
		if (f.q_class.value == "") {
			alert("문의내용을 입력하십시요");
			f.q_class.focus();
			return false;
		}
		if (f.q_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.q_contents.focus();
			return false;
		}

		document.f.action ="qna_insert_action.jsp";
		document.f.method="POST";
		document.f.submit();
	}
	
function qnaReplyCreateGo() {
		document.f.action = "qna_reply_insert_form.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
function qnaReplayCreate() {
		if (f.q_title.value == "") {
			alert("제목을 입력하십시요.");
			f.q_title.focus();
			return false;
		}
		if (f.u_id.value == "") {
			alert("작성자를 입력하십시요.");
			f.u_id.focus();
			return false;
		}
		if (f.q_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.q_contents.focus();
			return false;
		}
		f.action = "qna_reply_insert_action.jsp";
		f.method='POST';
		f.submit();
	}

	function qnaList() {
		f.action = "qna_list.jsp";
		f.method='POST';
		f.submit();
	}
	
	function qnaRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "qna_delete_action.jsp";
			f.method = "POST"
			document.f.submit();
		}
	}
	
	function qnaUpdate() {
		if (f.q_title.value == "") {
			alert("제목을 입력하십시요.");
			f.q_title.focus();
			return false;
		}
		if (f.u_id.value == "") {
			alert("작성자를 입력하십시요.");
			f.u_id.focus();
			return false;
		}
		if (f.q_contents.value == "") {
			alert("내용을 입력하십시요.");
			f.q_contents.focus();
			return false;
		}
		f.action = "qna_update_action.jsp";
		f.method = "POST"
		f.submit();
	}

	









