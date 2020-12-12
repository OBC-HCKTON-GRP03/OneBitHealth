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
    }else{
        $('.img-logo-auth').attr("src","/assets/logotipo_onebit_health_black.svg");
    }

    if(contraid){
    	$("a.my_history img").after("<span class='text_inner_links'>  Meu Histórico </span>");
    }else{
        $("a.my_history span").remove();
    }

    if(contraid){
        $("a.histories_shares img").after("<span class='text_inner_links'> Históricos <p>Compartilhados</p> </span>");    	
    }else{
        $("a.histories_shares span").remove();
    }

    if(contraid){
        $("button.share_history img").after("<span class='text_inner_links'>  Compartilhar </span>");    	
    }else{
        $("button.share_history span").remove();
    }

    if(contraid){
        $("#arrow_side").attr("src", "/assets/icon_arrow_left.svg");
    }else{
        $("#arrow_side").attr("src", "/assets/icon_arrow_right.svg");
    }

    if(contraid){
       contraid = false; 
   }else{
       contraid = true;
   }

  });

})(jQuery);

