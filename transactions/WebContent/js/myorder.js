/*function change_tab(states) {
	$.ajax({
		url: "myorder",
		data : {state: states},
		type: "post",
		dataType: "json",
		contentType : "application/json",
		error : function() {
			alert("error");
		},
		success : function(data) {
			var table = document.getElementById("table_shop");
			var trs = table.getElementsByTagName("tr");
			var isdel = false;
			for (var tr in trs) {
				if (isdel == true){
					tr.innerHTML = "";
				}
				isdel = true;
			}
			for(var i = 0; i < data.length; i++) {
				var order = document.createElement("tr");
				var order_id = document.createElement("td");
				var t1 = document.createTextNode(data.order_id);
				order_id.appendChild(t1);
				var order_time = document.createElement("td");
				var t2 = document.createTextNode(data[i].create_time);
				order_time.appendChild(t2);
				order.appendChild(order_id);
				order.appendChild(order_time);
				
				var content = document.createElement("tr");
				
				var photo = document.createElement("td");
				photo.setAttribute("class", "photo");
				var img = document.createElement("img");
				img.src = data[i].orders_info.books.image_path;
				photo.appendChild(img);
				
				var name = document.createElement("td");
				name.setAttribute("class", "name");
				var t3 = document.createTextNode(data[i].orders_info.books.book_name);
				name.appendChild(t3);
				//var span = document.createElement("span");
				
				var price = document.createElement("td");
				price.setAttribute("class", "price");
				var t4 = document.createTextNode(data[i].orders_info.books.rel_price);
				price.appendChild(t4);
				
				var num = document.createElement("td");
				num.setAttribute("class", "num");
				var t5 = document.createTextNode(data[i].orders_info.book_num);
				num.appendChild(t5);
				
				var calu = document.createElement("td");
				calu.setAttribute("class", "calu");
				var t6 = document.createTextNode(data[i].money);
				calu.appendChild(t6);
				
				var dealstate = document.createElement("td");
				dealstate.setAttribute("class", "dealstate");
				var t7 = document.createTextNode(data[i].pay_state);
				
				dealstate.appendChild(t7);
				
				var doget = document.createElement("td");
				doget.setAttribute("class", "doget");
				var b1 = document.createElement("button");
				b1.setAttribute("type", "submit");
				b1.setAttribute("class", "btn btn-danger");
				if (data[i].pay_state == "1") {
					var t7 = document.createTextNode("1");
					b1.appendChild(t7);
					//b1.setAttribute("href", "pingjia");
				} else if (data[i].pay_state == "2") {
					var t7 = document.createTextNode("2");
					b1.appendChild(t7);
					//b1.setAttribute("href", "zhifu");
				} else if(data[i].pay_state == "0") {
					var t7 = document.createTextNode("0");
					b1.appendChild(t7);
				}
				doget.appendChild(b1);
				doget.addEventListener('click', function(){
					$("#comment").css("display", "block");
					$("#shade").css("display", "block");
				}, false);
				
				content.appendChild(photo);
				content.appendChild(name);
				content.appendChild(price);
				content.appendChild(num);
				content.appendChild(calu);
				content.appendChild(dealstate);
				content.appendChild(doget);
				
				table.appendChild(content);
			}
		}
	})
};*/
function addclick(){
	$("#comment_button").click(function() {
		$("#comment").css("display", "block");
		$("#shade").css("display", "block");
	});
	tds = document.getElementsByName("star");
	for(var i = 0; i < tds.length; i++) {
		tds[i].onmouseover = test;
	}
	var index = -1
	
	function test() {
	
		for(var i = 0; i < tds.length; i++) {
			if(tds[i] == this) {
				index = i;
			}
		}
	
		for(var i = 0; i <= index; i++) {
			tds[i].style.color = "red";
		}
		for(var i = index + 1; i < tds.length; i++) {
			tds[i].style.color = "black";
		}
	
		/*var scores = document.getElementById("scores");
		scores.value=index+1;
		var form1 = document.getElementById("form");
		form1.action+="?user_id=711&book_id=123&";*/
		document.getElementById("scores").innerHTML = index + 1 + "分";
	}
	
	$("#ok").onclick = function() {
		$("#comment").css("display", "none");
		$("#shade").css("display", "none");
		alert("评分：" + (index + 1) + "分");
		var form1 = $("#form1");
		var rel_score = index + 1;
		form1.action += "&scores=" + rel_score;
		//form1.submit();
	}
};