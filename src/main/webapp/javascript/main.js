
    $(document).ready(function(){
    	$('.bxSlider').bxSlider({
    		controls: true,
   		 	pager: false,
   		 	speed: 1000,
   		 	touchEnabled : false
    	});
    	
    	$('.bxSlider2').bxSlider({
   		 	mode: 'horizontal',
   		 	controls: true,
   		 	speed: 1500,
   		    slideWidth: 400,   // 슬라이드 너비
   		    minSlides: 2,      // 최소 노출 개수
   		    maxSlides: 2,      // 최대 노출 개수
   		    slideMargin: 5,    // 슬라이드간의 간격
			pager: false,
			infiniteLoop: false,
			hideControlOnEnd: true,
			touchEnabled : false
    	});
    	
    	$('.bxSlider3').bxSlider({
   		 	mode: 'horizontal',
   		 	controls: true,
   		 	speed: 1500,
   		    minSlides: 2,      // 최소 노출 개수
   		    maxSlides: 2,      // 최대 노출 개수
   		    slideMargin: 5,    // 슬라이드간의 간격
   		 	slideWidth: 278.5, 
   		 	slideMargin: 20,
			pager: false,
			infiniteLoop: false,
			hideControlOnEnd: true,
			touchEnabled : false
    	});
    });