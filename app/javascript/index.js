$(document).ready(() => {
		$("#search_for_consults").click(function(){ 
			$("#results").html("<%= j render partial: 'search_results', locals: { results: @results } %> ");
		}
	)
	}
)