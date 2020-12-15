$(document).ready(() => {
	const ms = 200;
	let timer = 0;
	let val = '';

	timer = 0
	// user search functionality via ajax

	$('#shared_search').keyup(() => {
		clearTimeout(timer);
		val = $('#shared_search').val();

		if (val) {
			$.ajax({
				url: 'search_shared_user',
			  type: 'POST',
			  data: {'email': val},
			  dataType: 'json',
			  success: function (response) {
			  	var tbody = $(".modal-body table.not-shared-yet tbody")
			  	var current_user_id = response['current_user_id']

			  	tbody.html("")

			  	response["shared_users"].forEach((item, index) => {
		  			tbody.append(`
		  				<tr>
		  					<td class="text-center add_share"><a key=${item.id} rel="nofollow" data-method="post" href="/shared_users?i_share_with_id=${item.id}&amp;user_id=${current_user_id}"><img src="/assets/icon_user_add.svg"></a></td>
		  					<td class="text-center">${item.name}</td>
		  				</tr>
		  			`)
		  		})
				}
			})
		} else {
			$(".modal-body table.not-shared-yet tbody").html("")
		}
	})

	$("td.add_share a").on(() => {
			let item_id = event.target.key
			let current_user_id = current_user.id

			$.ajax({
				url: `/shared_users?i_share_with_id=${item.id}&amp;user_id=${current_user_id}`,
			  type: 'POST',
			  success: function (response) {
			  	var tbody = $(".modal-body table.not-shared-yet tbody")
			  	var current_user_id = response['current_user_id']
	})
})
