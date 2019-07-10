/**
 * 
 */
function change_tab(state) {
	var user_id = (session.getAttribute("user")).getUser_id();
	$.ajax({
		url: "<%=basePath%>/order",
		data : {"user_id": user_id, "state": state},
		type: "post",
		success : function(datas) {
			var table = document.getElementById("table_shop");
			var trs = table.getElementByTagName("tr");
			var isdel = false;
			for (var tr in trs) {
				if (isdel == true){
					tr.innerHTML = "";
				}
				isdel = true;
			}		
			for(var data in datas) {
				var order = document.createElement("tr");
				var order_id = document.createElement("td");
				var t1 = document.createTextNode(data.Order_id);
				order_id.appendChild(t1);
				var order_time = document.createElement("td");
				var t2 = document.createTextNode(data.Create_time);
				order_time.appendChild(t2);
				order.appendChild(order_id);
				order.appenChild(order_time)
				
				var content = document.createElement("tr");
				
				var photo = document.createElement("td");
				photo.setAttribute("class", "photo");
				var img = document.createElement("img");
				img.src = data.Image_path;
				photo.appendChild(img);
				
				var name = document.createElement("td");
				name.setAttribute("class", "name");
				var t3 = document.createTextNode(data.Book_name);
				name.appendChild(t3);
				//var span = document.createElement("span");
				
				var price = document.createElement("td");
				price.setAttribute("class", "price");
				var t4 = document.createTextNode(data.Real_price);
				price.appendChild(t4);
				
				var num = document.createElement("td");
				num.setAttribute("class", "num");
				var t5 = document.createTextNode(data.Num);
				num.appendChild(t5);
				
				var calu = document.createElement("td");
				calu.setAttribute("class", "calu");
				var t6 = document.createTextNode(data.Money);
				calu.appendChild(t6);
				
				var dealstate = document.createElement("td");
				dealstate.setAttribute("class", "dealstate");
				var t7 = document.createTextNode(data.pay_state);
				dealstate.appendChild(t7);
				
				var doget = document.createElement("td");
				doget.setAttribute("class", "doget");
				var b1 = document.createElement("button");
				b1.setAttribute("type", "submit");
				b1.setAttribute("class", "btn btn-danger");
				if (t7 == "支付成功") {
					var t7 = document.createTextNode("立即评价");
					b1.appendChild(t7);
					//b1.setAttribute("href", "pingjia");
				} else if (t7 == "未支付") {
					var t7 = document.createTextNode("立即支付");
					b1.appendChild(t7);
					//b1.setAttribute("href", "zhifu");
				}
				
				content.appendChild(photo);
				content.appendChild(name);
				content.appendChild(price);
				content.appendChild(num);
				content.appendChild(calu);
				content.appendChild(dealstate);
				content.appendChild(doget);
			}
		}
	})
};