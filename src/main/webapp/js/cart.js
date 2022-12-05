/**
 * 
 
function changeNumber(desc, formId) {
		console.log(formId);
		var form = document.getElementById(formId);
		if (desc == '+') {
			form.c_qty.value = parseInt(form.c_qty.value) + 1;
		} else if (desc == '-') {
			if (form.c_qty.value - 1 >= 0) {
				form.c_qty.value = parseInt(form.c_qty.value) - 1;
			}
		}
		form.method = 'POST';
		form.action = 'cart_update_action.jsp';
		form.submit();
	}
	/*
	cart item1개삭제하기
	 */
	function cart_delete_action(formId) {
		if(window.confirm('해당상품을 장바구니에서 삭제하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'cart_delete_action.jsp';
			form.submit();
		}
		
	}
	
	
	/*
	cart 전체삭제(비우기)
	 */
	function cart_delete() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_all_action.jsp';
		document.cart_view_form.submit();
		
	}
	function cart_view_form_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.buyType.value = 'cart';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	
	function cart_view_form_select_submit() {
		var cart_item_no_check_list = document
				.getElementsByName("cart_item_no_check");
		var isChecked = false;
		for (var i = 0; i < cart_item_no_check_list.length; i++) {
			if (cart_item_no_check_list.item(i).checked === true) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert('구매 할 제품을 선택해주세요');
			return;
		}
		document.cart_view_form.buyType.value = 'cart_select';
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_create_form.jsp';
		document.cart_view_form.submit();
	}
	function cart_item_all_select_checkbox_deselect(){
		document.getElementById('all_select_checkbox').checked=false;
	}
	/*
	cart 아이템카운트갱신,cart_view_form 갱신
	*/
	function cart_item_select_count(){
			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
			var cart_item_check_selected_count = 0;
			document.cart_view_form.innerHTML ='';
			document.cart_view_form.innerHTML +="<input type='hidden' name='buyType'>";
			
			
			var tot_order_price=0;
			var tot_order_price_deli=0;
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				if (cart_item_no_check_list.item(i).checked === true) {
					document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"+ cart_item_no_check_list.item(i).value + "'>";
					var updateFormId='cart_update_form_'+ cart_item_no_check_list.item(i).value;
					var c_qty=document.getElementById(updateFormId).c_qty.value;
					var cart_product_unit_price=document.getElementById(updateFormId).cart_product_unit_price.value;
					tot_order_price+=c_qty*cart_product_unit_price;
					
					var deli_price=0;
						if( 1<tot_order_price && tot_order_price<50000){
							deli_price=2500;
						} else {
							deli_price=0;
						}

					tot_order_price_deli+=c_qty*cart_product_unit_price+deli_price;
					
					cart_item_check_selected_count++;
					
				}
			}
			
			
			var tot_order_price_deli=tot_order_price+deli_price;
			document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			document.getElementById('tot_order_price').innerHTML = tot_order_price.toLocaleString();
			document.getElementById('deli_price').innerHTML = deli_price.toLocaleString();
			document.getElementById('tot_order_price_deli').innerHTML = tot_order_price_deli.toLocaleString();
			
	}
	/*
	cart 아이템전체선택해제
	*/
	function cart_item_all_select(e){
		var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
		if(e.target.checked){
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=true;
			}
		}else{
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				cart_item_no_check_list.item(i).checked=false;
			}
		}
	}