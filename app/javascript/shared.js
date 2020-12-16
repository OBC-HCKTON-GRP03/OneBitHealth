$(document).ready(() => {
	const ms = 200;
	let timer = 0;
	let current_user_id;
	let shared_users;

	let tbody_share_history = $(".modal-body table.not-shared-yet tbody");
	let tbody_remove_share = $(".modal-body table.users_shared tbody");

	timer = 0;


	/* It will do a search by email that are in the database. 
	In case of success it will be printed in the first table to share its history.
	*/

	const SEARCH_USER_NO_SHARED = (email='') => {
		$.ajax({
			url: 'search_shared_user',
			type: 'POST',
			data: {'email': email},
			dataType: 'json',
			success: function (response) {
				current_user_id = response['current_user_id']
				shared_users = response['shared_users']

				tbody_share_history.html("");

				shared_users.sort(
					/*alphabetical ordenation name*/
					(user1,user2) => user1.name < user2.name ? -1 : user1.name > user2.name ? 1 : 0 
				).forEach((item, index) => {
					tbody_share_history.append(`
						<tr>
							<td class="text-center add_share" id=${index}><img src="/assets/icon_user_add.svg"></td>
							<td class="text-center">${item.name}</td>
						</tr>
					`)
				})
			}
		})
	}

	// --------------------------------------------------------- 

	/*Function that deletes a user with shared history from the database, 
	if the user confirms it. After the updated set of 
	users that share history will be printed. */

	const DELETE_USER_SHARED = (id) => {
		if(confirm("Você tem certeza ?")){
			$.ajax({
				url: `/shared_users/${id}`,
				type: 'DELETE',
				data: {},
				dataType: 'json',
				success: (response) => {

					let users_who_already_share = response['shared'];

					tbody_remove_share.html("");
					
					users_who_already_share.sort( 
						/*alphabetical ordenation name*/
						(user1,user2) => user1.name < user2.name ? -1 : user1.name > user2.name ? 1 : 0 
						
					).forEach((item) => {
						if(item.id != id){
							tbody_remove_share.append(`
								<tr>
									<td>${item.name}</td>
									<td class="remove_user_shared" id=${item.id}><img src="/assets/icon_trash.svg"></td>
								</tr>
							`)
						}
					})
				}
			})
		}
	}

	//-----------------------------------------------------------

	/*This function will map the search field, if the user enters an email or if this function starts, 
	it will print possibilities. If the search field has no value, the share history table will be blank.  */

	$('#shared_search').keyup(() => {
		clearTimeout(timer);
		let val = $('#shared_search').val();

		if (val) {
			SEARCH_USER_NO_SHARED(val);	
		} else {
			$(".modal-body table.not-shared-yet tbody").html("")
		}
	})

	//------------------------------------------------------------

	/*Está função observará se o usuário deseja 
	compartilhar seu histórico com algum outro usuárico. 
	Clicando em campo, este usuário será adiciona ao banco de dados.  */


	$(".search_result_table").on("click",(event) => {
		if(event.target.parentElement.className == "text-center add_share"){
			let user_share_id = shared_users[event.target.parentElement.id].id;
			let user_name = shared_users[event.target.parentElement.id].name;
		
			$.ajax({
				url: `/shared_users?i_share_with_id=${user_share_id}&amp;user_id=${current_user_id}`,
				type: 'POST',
				data: {},
				dataType: 'json', 
				success: function (response) {
					SEARCH_USER_NO_SHARED('');
					tbody_remove_share.append(`
						<tr>
							<td>${user_name}</td>
							<td class="remove_user_shared" id=${user_share_id}><img src="/assets/icon_trash.svg"></td>
						</tr>
					`)
				}
			})
		}
	})

	//-------------------------------------------------------------
	/*When clicking on the trash can in the Remove share table the pointed user 
	will be deleted from the sharing table and deleted in the database.*/


	$(".person_already_shared_table").on("click", (event) => {
		if(event.target.parentElement.className == "remove_user_shared"){
			let user_share_id = event.target.parentElement.id;
			DELETE_USER_SHARED(user_share_id);
		} 
	})
})
