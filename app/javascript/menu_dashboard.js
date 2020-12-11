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
    	$("a.share_history span").remove();
    }else{
    	$("a.share_history img").after("<span class='text_inner_links'>  Compartilhar </span>");
    }
  });

})(jQuery);
