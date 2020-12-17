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
        $('.img-logo-auth').attr("src","avatar_teste.svg").css({"height":"80%", "width":"80%"}); // implement other image
        $("a#my_history img").after("<span class='text_inner_links'>  Meu Histórico </span>");
        $("a#histories_shares img").after("<span class='text_inner_links'> Históricos <p>Compartilhados</p> </span>");      
        $("button#share_history img").after("<span class='text_inner_links'>  Compartilhar </span>");       
        $("#arrow_side").attr("src", "icon_arrow_left.svg");
    }else{
        $('.img-logo-auth').attr("src","logotipo_onebit_health_black.svg");
        $("a#my_history span").remove();
        $("a#histories_shares span").remove();
        $("button#share_history span").remove();
        $("#arrow_side").attr("src", "icon_arrow_right.svg");
    }

    if(contraid){
       contraid = false; 
   }else{
       contraid = true;
   }

  });

  /* Search animation */

  $('.search-button').click(function(){
    $(this).parent().toggleClass('open');
  });



})(jQuery);

