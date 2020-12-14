$(document).ready(() => {
	const ms = 200;
	let timer = 0;
	let val = '';

	timer = 0
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
		  					<td>${item.email}</td>
		  					<td><a rel="nofollow" data-method="post" href="/shared_users?i_share_with_id=${item.id}&amp;user_id=${current_user_id}">Adicionar</a></td>
		  				</tr>
		  			`)
		  		})
				}
			})
		} else {
			$(".modal-body table.not-shared-yet tbody").html("")
		}
	})
})	