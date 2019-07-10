function carray(length) {
	var a=[];
	for(var i=0;i<length;i++) {
		a.push("-");
	}
	return a;
}

$(document).ready(function (){	
$.ajax({
		method : 'post',
		url : 'predict',
		dataType : 'json',
		success : function(data) {//data格式:[{name:nameValue,value:valueVal},...] 
			initChat(data);
		}
	});
	function initChat(data) {
		var dom = document.getElementById("mainChart");
		var myChart = echarts.init(dom);
		// 初始 option
		l=formatData(data).serData1.length;
		//alert(formatData(data).serData1.length);
		option = {
		    title: {
		        text: '图书销量及预测',
	        	textStyle: {
		            color: '#000'
		        }
		    },
		    backgroundColor: '#ccc',
		    textStyle: {
	            color: '#000',
	        },
		    tooltip: {},
		    grid: {
		    	x: 120
		    },
		    calculable : true,
		    legend: {
		        data:['colume_a','colume_b'],
		        textStyle: {
		            color: '#000'
		        }
		    },
		    itemStyle: {
				normal: {
					lineStyle: {
						width: 3 //折线宽度
					}
				}
            },
		    xAxis: {
		    	//data:['9:00-10:00','10:00-11:00','14:00-15:00','15:00-16:00','17:00-18:00']
		        data: formatData(data).xAxData,
			    type:'category',
		        axisLabel:{  
	                interval:0,//横轴信息全部显示  
	                //rotate:-30,//-30度角倾斜显示  
	           },
	           name : 'month',
	           nameLocation:'middle',
	           nameGap : 40
		    
		    },
		    yAxis: {
		    	type:'value',
		    	name : 'colume',
		        nameLocation:'middle',
		        nameGap : 40
		    },
		    series: [{
		        name: 'colume_a',
		        type: 'line',
		        data: formatData(data).serData1.slice(0,-1),
		        smooth:false
		    },,{
		        name: 'colume_a_predict',
		        type: 'line',
		        data: carray(l-2).concat([formatData(data).serData1[l-2].value,formatData(data).serData1[l-1].value]),
		        smooth:false
		    },{
		        name: 'colume_b',
		        type: 'line',
		        data: formatData(data).serData2.slice(0,-1),
		        smooth:false
		    },{
		        name: 'colume_b_predict',
		        type: 'line',
		        data: carray(l-2).concat([formatData(data).serData2[l-2].value,formatData(data).serData2[l-1].value]),
		        smooth:false
		    }],
		};
		if (option && typeof option === "object") {
		    myChart.setOption(option, true);
		}
	};
	function formatData(data) {
		var xAxData = [];
		var serData1 = [];
		var serData2 = [];
		
		var direct = 1;
		for (var i = 0; i < data.length; i++) {
			if(i != 0){
				if(data[i].category != data[i-1].category) {
					direct = 2;
				}
			}
			if(direct == 1) {
				if(data[i].month <= 12) {
					xAxData.push(data[i].month || "");
				}
				else {
					xAxData.push("1" || "");
				}
			}		
			if(direct == 1) {
				serData1.push({
					name : data[i].month,
					value : data[i].colume || 0
				});
			} else if (direct == 2) {
				serData2.push({
					name : data[i].month,
					value : data[i].colume || 0
				});
			}
		}
		return {
			xAxData : xAxData,
			serData1 : serData1,
			serData2 : serData2
		};
	};
});