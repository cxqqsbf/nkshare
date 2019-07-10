/**
 * 
 */

	//使用ajax加载数据 
$(document).ready(function () {
	$.ajax({
		method : 'post',
		url : 'cate2colume',
		dataType : 'json',
		success : function(data) {//data格式:[{name:nameValue,value:valueVal},...] 
			initChat(data);
		}
	});
	function initChat(data) {
		var myChart = echarts.init(document.getElementById('mainChart'));
		option = {
			backgroundColor : '#cccccc',
			title : {
				text : '图书种类购买状况',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : formatData(data).xAxData
			},
			series : [ {
				name : 'category',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : formatData(data).serData,
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
	function formatData(data) {
		var xAxData = [];
		var serData = [];

		for (var i = 0; i < data.length; i++) {
			xAxData.push(data[i].name || "");
			serData.push({
				name : data[i].category,
				value : data[i].colume || 0
			});
		}

		return {
			xAxData : xAxData,
			serData : serData
		};
	};
});