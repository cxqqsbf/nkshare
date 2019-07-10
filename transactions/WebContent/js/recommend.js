/**
 * 
 */
$(document).ready(function(){
	$.ajax({
		url: "recommend",
		data : {category_id: "asdfasdf"},
		type: "post",
		dataType: "json",
		contentType : "application/json" ,
		error: function() {
			for(var i=1;i<10;i++){
				
				var img = document.getElementById("panel_" + i + "_img");
				var h2 = document.getElementById("panel_" + i + "_h2");
				var p = document.getElementById("panel_" + i + "_p");
				var a = document.getElementById("inside_a_" + i);
				img.src = data[i].image_path;
				h2.innerText = data[i].goods_name;
				a.href="showgoods?goods_id="+data[i].goods_id;
				//p.innerText = data[i].Book_name;
			}
		},
		success : function(data) {
			for(var i=1;i<10;i++){
				var img = document.getElementById("panel_" + i + "_img");
				var h2 = document.getElementById("panel_" + i + "_h2");
				var p = document.getElementById("panel_" + i + "_p");
				var a = document.getElementById("inside_a_" + i);
				img.src = data[i].image_path;
				h2.innerText = data[i].goods_name;
				a.href="showgoods?goods_id="+data[i].goods_id;
			}
		}
	})
});
$(document).ready(function(){
	$.ajax({
		url: "recommend",
		data : {category_id: "asdfasdf"},
		type: "post",
		dataType: "json",
		error: function() {
			for(var i=1;i<6;i++){
				var img = document.getElementById("jiushu_" + i + "_img");
				var a = document.getElementById("jiushu_" + i + "_a");
				var aa = document.getElementById("jiushu_" + i + "_aa");
				var p = document.getElementById("jiushu_" + i + "_p");
				var ii = document.getElementById("jiushu_" + i + "_i");
				//a.href = 
				img.src = data[i].image_path;
				aa.innerText = data[i].goods_name;
				//aa.href = 
				ii.innerText = data[i].rel_price;
			}
		},
		success : function(data) {
			for(var i=1;i<9;i++){
				var img = document.getElementById("jiushu_" + i + "_img");
				var a = document.getElementById("jiushu_" + i + "_a");
				var aa = document.getElementById("jiushu_" + i + "_aa");
				var p = document.getElementById("jiushu_" + i + "_p");
				var ii = document.getElementById("jiushu_" + i + "_i");
				//a.href = 
				img.src = data[i].image_path;
				aa.innerText = data[i].goods_name;
				//aa.href = 
				a.href="showgoods?goods_id="+data[i].goods_id;
				ii.innerText = data[i].rel_price;
			}
		}
	})
});
$(document).ready(function(){
	$.ajax({
		url: "recommend",
		data : {category_id: "asdfasdf"},
		type: "post",
		dataType: "json",
		success : function(data) {
			for(var i=1;i<9;i++){
				
				var img = document.getElementById("xinshu_" + i + "_img");
				var a = document.getElementById("xinshu_" + i + "_a");
				var aa = document.getElementById("xinshu_" + i + "_aa");
				var p = document.getElementById("xinshu_" + i + "_p");
				var ii = document.getElementById("xinshu_" + i + "_i");
				//a.href = 
				img.src = data[i].image_path;
				aa.innerText = data[i].goods_name;
				//aa.href = 
				a.href="showgoods?goods_id="+data[i].goods_id;
				ii.innerText = data[i].rel_price;
				
				}
			}
		})
    });