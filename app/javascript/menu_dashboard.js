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
      	$('.img-logo-auth').attr("src","/assets/logotipo_mod.svg");
      	contraid = false;
      	event.preventDefault();
      }else{
      	$('.img-logo-auth').attr("src","/assets/logotipo_onebit_health_black.svg");
      	contraid = true;
      	 event.preventDefault();
      }
  });
})(jQuery);
