(function($) {
	var fullHeight = function() {
		$('.js-fullheight').css('height', $(window).height());
		$(window).resize(function(){
			$('.js-fullheight').css('height', $(window).height());
		});
	};
	fullHeight();

	let contraid = true; 

	$('#sidebarCollapse').on('click', function () {
    $('#sidebar').toggleClass('active');
    
    if(contraid){
    	$('.img-logo-auth').attr("src","/assets/avatar_teste.svg").css({"height":"80%", "width":"80%"}); // implement other image
    	contraid = false;
    }else{
    	$('.img-logo-auth').attr("src","/assets/logotipo_onebit_health_black.svg");
    	contraid = true;
    }

    if(contraid){
    	$("a.my_history span").remove();
    }else{
    	$("a.my_history img").after("<span class='text_inner_links'>  Meu Histórico </span>");
    }

    if(contraid){
    	$("a.histories_shares span").remove();
    }else{
    	$("a.histories_shares img").after("<span class='text_inner_links'> Históricos <p>Compartilhados</p> </span>");
    }

    if(contraid){
    	$("button.share_history span").remove();
    }else{
    	$("button.share_history img").after("<span class='text_inner_links'>  Compartilhar </span>");
    }
  });


})(jQuery);

$(document).ready(
    $('#exampleModal').click('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var recipient = button.data('whatever') // Extract info from data-* attributes
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      console.log("foi")
      var modal = $(this)
      modal.find('.modal-title').text('New message to ' + recipient)
      modal.find('.modal-body input').val(recipient)
    })
)