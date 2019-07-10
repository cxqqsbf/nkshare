$(function() {
	"use strict";
	var totalPanels	= $(".scrollContainer").children().size();
		
	var regWidth = $(".panel").css("width");
	var regImgWidth	= $(".panel img").css("width");
	var regImgHeight = $(".panel img").css("height");
	var regTitleSize = $(".panel h2").css("font-size");
	var regParSize = $(".panel p").css("font-size");

	var movingDistance = 130;
	
	var curWidth = 150;
	var curImgWidth	= 100;
	var curImgHeight = 100;
	var curTitleSize = "16px";
	var curParSize = "12px";

	var $panels	= $('#show .scrollContainer > div');
	var $container = $('#show .scrollContainer');

	$panels.css({'float' : 'left','position' : 'relative'});
    
	$("#show").data("currentlyMoving", false);
	
	var scroll = $('#show .scroll').css('overflow', 'hidden');
	
	$container
		.css('width', ($panels[0].offsetWidth * $panels.length) + 20 )
		.css('left', (900 - $panels[0].offsetWidth * $panels.length - 20 ) / 2 );

	function returnToNormal(element) {
		$(element)
			.animate({ width: regWidth })
			.find("img")
			.animate({ width: regImgWidth })
			.animate({ height: regImgHeight })
		    .end()
			.find("h2")
			.animate({ fontSize: regTitleSize })
			.end()
			.find("p")
			.animate({ fontSize: regParSize });
	}
	
	function growBigger(element) {
		$(element)
			.animate({ width: curWidth })
			.find("img")
			.animate({ width: curImgWidth })
			.animate({ height: curImgHeight })
		    .end()
			.find("h2")
			.animate({ fontSize: curTitleSize })
			.end()
			.find("p")
			.animate({ fontSize: curParSize });
	}
	
	//direction true = right, false = left
	function change(direction) {
	   
	    //if not at the first or last panel
		if((direction && !(curPanel < totalPanels)) || (!direction && (curPanel <= 1))) {
			return false; 
		}	
        
        //if not currently moving
        if (($("#show").data("currentlyMoving") === false)) {
            
			$("#show").data("currentlyMoving", true);
			
			var next         = direction ? curPanel + 1 : curPanel - 1;
			var leftValue    = $(".scrollContainer").css("left");
			var movement	 = direction ? parseFloat(leftValue, 10) - movingDistance : parseFloat(leftValue, 10) + movingDistance;
		
			$(".scrollContainer")
				.stop()
				.animate({
					"left": movement
				}, function() {
					$("#show").data("currentlyMoving", false);
				});
			
			returnToNormal("#panel_" + curPanel);
			growBigger("#panel_" + next);
			
			curPanel = next;
			
			//remove all previous bound functions
			$("#panel_" + (curPanel+1)).unbind();	
			
			//go forward
			$("#panel_" + (curPanel+1)).click(function(){ change(true); });
			
            //remove all previous bound functions															
			$("#panel_" + (curPanel-1)).unbind();
			
			//go back
			$("#panel_" + (curPanel-1)).click(function(){ change(false); }); 
			
			//remove all previous bound functions
			$("#panel_" + curPanel).unbind();
		}
	}
	
	// Set up "Current" panel and next and prev
	var curPanel = ($panels.length + 1) / 2;
	growBigger("#panel_" + curPanel);
	
	$("#panel_"+(curPanel+1)).click(function(){ change(true); });
	$("#panel_"+(curPanel-1)).click(function(){ change(false); });
	
	//when the left/right arrows are clicked
	$(".right").click(function(){ change(true); });	
	$(".left").click(function(){ change(false); });
	
	$(window).keydown(function(event){
	  switch (event.keyCode) {
//			case 13: //enter
//				$(".right").click();
//				break;
//			case 32: //space
//				$(".right").click();
//				break;
	    	case 37: //left arrow
				$(".left").click();
				break;
			case 39: //right arrow
				$(".right").click();
				break;
	  }
	});
	
});