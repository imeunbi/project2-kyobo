/**
 * 
 */

/**
 * 
 */
function userCreateForm() {
		location.href = "userinfo_insert_form.jsp";
	}

	function login() {
		if (document.f.userId.value == "") {
			alert("사용자 아이디를 입력하십시요.");
			document.f.userId.focus();
			return;
		}
		if (document.f.password.value == "") {
			alert("비밀번호를 입력하십시요.");
			f.password.focus();
			return;
		}

		document.f.action = "userinfo_login_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
	function userModifyAction() {
		
		if (document.f.u_password.value == "") {
			alert("비밀번호를 입력하세요.");
			document.f.password.focus();
			return;
		}
		if (document.f.password2.value == "") {
			alert("비밀번호확인을 입력하세요.");
			f.password2.focus();
			return;
		}
		if (document.f.u_name.value == "") {
			alert("이름을 입력하세요.");
			f.name.focus();
			return;
		}
		if (document.f.u_email.value == "") {
			alert("이메일 주소를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_phone.value == "") {
			alert("핸드폰 번호를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_birth.value == "") {
			alert("생일을 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_gender.value == "") {
			alert("성별을 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_address.value == "") {
			alert("주소를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
			f.password.focus();
			f.password.select();
			return;
		}
		document.f.action = "userinfo_update_action.jsp";
		document.f.method = "POST"
		document.f.submit();
	}
	
	function userMain() {
		document.f.action = "kyobo_main.jsp";
		document.f.submit();
	}
	
	function userCreate() {
		if (document.f.u_id.value == "") {
			alert("사용자 아이디를 입력하세요.");
			document.f.userId.focus();
			return;
		}
		if (document.f.u_password.value == "") {
			alert("비밀번호를 입력하세요.");
			document.f.password.focus();
			return;
		}
		if (document.f.password2.value == "") {
			alert("비밀번호확인을 입력하세요.");
			f.password2.focus();
			return;
		}
		if (document.f.u_name.value == "") {
			alert("이름을 입력하세요.");
			f.name.focus();
			return;
		}
		if (document.f.u_email.value == "") {
			alert("이메일 주소를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_phone.value == "") {
			alert("핸드폰 번호를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_birth.value == "") {
			alert("생일을 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_gender.value == "") {
			alert("성별을 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_address.value == "") {
			alert("주소를 입력하세요.");
			f.email.focus();
			return;
		}
		if (document.f.u_password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치하여야합니다.");
			f.password.focus();
			f.password.select();
			return;
		}
		document.f.action = "userinfo_insert_action.jsp";
		document.f.method='POST';
		document.f.submit();
	}

	function userMain() {
		location.href='kyobo_main.jsp';
	}
	
	function repassword() {
		if(document.f.u_password.value != ""){
		if(document.f.u_password.value != document.f.password2.value){
			document.getElementById('pass2').innerHTML = "비밀번호가 일치하지 않습니다."
			console.log("1");
		}else{
			document.getElementById('pass2').innerHTML = "비밀번호가 일치합니다."
			console.log("2");
		}
		}
	}
	
	
	function userModify() {
		document.f.action = "userinfo_update_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	function userRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "userinfo_delete_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
	}
	
	function reviewGo(){
			document.f.action = "review_Id_list.jsp";
			document.f.method='POST';
			document.f.submit();
	}
	
	function ebookGo(){
			document.f.action = "ebook_list.jsp";
			document.f.method='POST';
			document.f.submit();
	}
	