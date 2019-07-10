$(function() {
	choosetype();
	choosenumber();
	submit();
})
function choosetype(){
	$(".nav-text").click( function(){
	    var i = parseInt($(this).index());
        var div = $(".panel").eq(i);
        div.css("display","block").siblings().css("display","none");
     });
}
function submit(){
	$("#firstbuy").click(function(){
		var number = document.getElementById("buytext").value;
		if(number>0){
		var form = document.getElementById("buy_count");
		form.method="post";
		form.action="showorder";
		form.submit();
		}
		else alert("请先选择数量")
	});
}
function choosenumber(){
	var object = document.getElementById("buytext");
	var value = parseInt(object.value);
	var minus = document.getElementById("minus");
	var plus = document.getElementById("plus");
	minus.onclick = function(){
		
		if(value > 0){
			value-=1;
			object.value = value;
		}
	}
	plus.onclick = function(){
		value+=1;
		object.value = value;
	}
}