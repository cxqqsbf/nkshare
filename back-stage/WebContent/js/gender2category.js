/**
 * 
 */

	//使用ajax加载数据 
$(document).ready(function() {
	$.ajax({
		method : 'post',
		url : 'gender2category',
		dataType : 'json',
		success : function(data) {//data格式:[{name:nameValue,value:valueVal},...] 
			initChat(data,"male");
			initChat(data,"female");
		}
	});
	function initChat(data,g) {
		var myChart = echarts.init(document.getElementById('mainChart'+g));
		option = {
			backgroundColor : '#cccccc',
			title : {
				text : g,
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : formatData(data,g).xAxData
			},
			series : [ {
				name : 'category',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : formatData(data,g).serData,
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};
		myChart.setOption(option, true);
	};
	function formatData(data,g) {
		var xAxData = [];
		var serData = [];

		for (var i = 0; i < data.length; i++) {
			if(g == "male" && data[i].gender == "男") {
				xAxData.push(data[i].name || "");
				serData.push({
					name : data[i].category,
					value : data[i].num || 0
				});
			}
			else if(g == "female" && data[i].gender == "女") {
				xAxData.push(data[i].name || "");
				serData.push({
					name : data[i].category,
					value : data[i].num || 0
				});
			}
		}

		return {
			xAxData : xAxData,
			serData : serData
		};
	};
});