$(function(){
	address();
	count();
	choose_address();
	submit();
});
function address(){
	$(".address-list").on("click",".add_item",function(){
		$(".addr-box").css("display","block");
		$("body").css("overflow","hidden");
		$("#shade").css("display","block");
	});
	$("#address_cancel").click(function(){
		$(".addr-box").css("display","none");
		$("body").css("overflow","visible");
		$("#shade").css("display","none");
	});
	$(".address-list").on("click",".item",function(){
		if($(this).children(".confirm").css("display")=="none")
		{
            $(this).children(".confirm").css("display","block");
            $(this).siblings().children(".confirm").css("display","none");
            $("#address_hidden").val($(this).children("input").val());
		}
		else if($(this).children(".confirm").css("display")=="block")
		{
			$(this).children(".confirm").css("display","none");
		}
	});
	
}
function choose_address(){
	$("#provinces").change(function(){
		$("#citys").attr("disabled",false);
		$("#county").attr("disabled",false);
	})
}
function count(){
	$(".choose_invioces").click(function(){
		if($(".input").is(":disabled")){;$(".input").attr("disabled",false);}
		else {$(".input").attr("disabled",true);}
	});
}
function submit(){
	$("#operation .submit").click(function(){
		var form = document.getElementById("order_info");
		form.method="post";
		form.action="showpayment";
		form.submit();
	})
}
