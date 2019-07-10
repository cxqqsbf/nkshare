<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>地址管理</title>
		<link rel="stylesheet" type="text/css" href="css/intro.css"/>
		<link rel="stylesheet" type="text/css" href="css/headerOfAll.css">
		<link rel="stylesheet" type="text/css" href="css/foot.css">
		<script type="text/javascript" src="jquery-1.11.3.js"></script>
	</head>
	<body>
		<div class="cxq">
		
			<!--顶部通栏开始-->
			<div id="navHeader" class="nav-header-box" style="font-family:'楷体';">
				
				<div class="header-wrap">
					<div class="index-link-box clearfix">
						<div class="item-info">
							<a href="homepage" class="info-link">
								<span class="info-text">首页</span>
							</a>
						</div>
						<div class="item-info">
							<a href="register" class="info-link" >
								<span class="info-text" id="nickname-hello" name="nickname-hello">注册</span>
							</a>
						</div>
						<div class="item-info">
							<a href="login" class="info-link" >
								<span class="info-text" id="nickname" name="nickname">登录</span>
							</a>
						</div>
						<div class="item-info">
							<a href="login" class="info-link">
								<span class="info-text" id="loginout"></span>
							</a>
						</div>
					</div>
					<div class="user-info-box clearfix">
						<div class="item-info">
							<a id="cartLink" href="shoppingcart" class="info-link" target="_blank" rel="nofollow">
								<span class="info-text">购物车 <span id="cartNum" class="num"></span></span>
							</a>
							<!-- <div id="cartListWin" class="info-win">
								<div class="load-box"></div>
							</div> -->
						</div>
						<div class="item-info">
							<a href="myorder" class="info-link" target="_blank" rel="nofollow">
								<span class="info-text">我的订单</span>
							</a>
						</div>
						<div class="item-info">
							<a href="indivi" class="info-link" target="_blank" rel="nofollow">
								<span class="info-text">个人中心</span>
							</a>
						</div>
						<div class="item-info">
							<span class="info-normal">
                        		<span class="info-text">联系客服</span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<c:choose>
			   <c:when test="${!empty sessionScope.user}">
			   <c:if test="${!empty user.user_id}">
			        <c:set value="${user.user_id }" var="changeHeader" scope="page"/>
			     </c:if>
			     <c:if test="${!empty user.nickname}">
			       <c:set value="${user.nickname }" var="changeHeader" scope="page"/>
			     </c:if>
			   </c:when>
			</c:choose>
			<script type="text/javascript">
			(function (){
				var change = "${changeHeader}";
				if(change != ""){
					$("#nickname-hello").text("欢迎您");
					$("#nickname").text(change);
					$("#loginout").text("退出登录");
				} 
			}());
			</script>
			<!--公共顶部模板开始-->
			<!--所在地模板-->
			<!--公共顶部模板结束-->
			<div class="header-search clearfix" style="font-family:'楷体';">
				<a href="homepage" class="logo-text">
					<img src="img/nkushare.png" alt="NKshare" height="60px" width="400px">
				</a>
				<img src="img/nk.png" alt="NK" style="width: 50px;height:50px">
				<div class="search-box clearfix">
					<form ModelAttribute="goodssearch" id="searchForm" class="search-con" action="goodssearch" method="post">
						<select id="goodsType" name="goodsType" style="float: left;width: 80px;height:36px;font-size: 16px;text-align: center;font-family:'楷体';">
							<option value="s_all">全部项</option>
							<option value="s_user">卖家</option>
							<option value="s_goodsName">商品名</option>
							<option value="s_category">类别</option>
						</select>
						<div class="search-put">
							<input type="text" name="searchWord" autocomplete="off" value="${requestScope.goodssearch.searchWord }"  style="font-family:'楷体';">
							<div id="searchSugBox" class="sug-box"></div>
						</div>
						<input type="hidden" id="sortName" name="sortName" value="">
						<input type="hidden" id="sortWay" name="sortWay" value="">
						<button id="searchBtn" class="btn" type="submit"  style="font-family:'楷体';">搜索</button>
					</form>
					<script type="text/javascript">
						var se = document.getElementById('goodsType');
						se.onchange = function(){
						    localStorage.value = this.value;
						    localStorage.index = this.selectedIndex;
						}
						window.onload = function(){
						    se.options[ localStorage.index ].selected = true;
						}
					</script>
				</div>
			</div>
			
		<div class="leftcho">
		<table cellpadding="10" cellspacing="30" style="text-align:center; margin:auto;color: black;font-family:'楷体'">
					<tr>
						<td>
							<h2>个人中心</h2>
						</td>
					</tr>
					<tr>
						<td>
							<a href="indivi" style="color: black;">个人资料</a>
						</td>
					</tr>
					<tr>
						<td >
							<a href="changepwd" style="color: black;">修改密码</a>
						</td>
					</tr>
					<tr>
					<td>
					<a href="address" style="color: black;">地址管理</a>
					</td>
					</tr>
					<tr>
						<td>
							<a href="myorder" style="color: black;">订单管理</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="myrecord" style="color: black;">浏览记录</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="mycomment" style="color: black;">我的评价</a>
						</td>
					</tr>
				</table>	
		</div>
		<div class="huge">
		<div class="addmanage">	
		<p style="font-family: 'arial black'; font-size: 20px; margin-top: 15px; margin-bottom: 15px;">地址管理/address list</p>
		<hr/>
		<div style="height:240px;width:1000px;overflow:auto;">
		<ul style="list-style: none;" >
			<c:forEach items="${requestScope.addressList }" var="address" varStatus="status">
			<div class="addplace" scrolling="yes">
			<li class="useradrs" style="padding: 30px;">
			<!-- <span><i></i>默认地址</span> -->
			<p>
			<span>${address.name}</span><br><br>
			<span class="new-txt-rd2">手机号:&nbsp;${address.telephone}</span>
			</p>
			<div>
			<p>
			<span>地址：</span>
			<span>${address.province}</span>
			<span>${address.city}</span>
			<span>${address.details}</span>
			</p>
			</div>
			<div>
			<a href="#"><i></i>编辑</a>
			<span>|</span>
			<a href="javascript:void(0);" onclick="delClick(this);"><i></i>删除</a>
			</div>
			</li>
			</div>
			</c:forEach>
		</ul>
		</div>
		</div>
		<div class="newadd">
		<p style="font-family: 'arial black'; font-size: 20px; margin-top: 15px; margin-bottom: 15px;">增添地址/add address</p>
		<hr/>
		<form:form modelAttribute="myAddress" action="address" method="post" style="margin-left: 50px;margin-top: 140px;">
		<p style="text-align:right;margin-right: 200px;font-family: '楷体';">收货人：<form:input path="name" class="text_" style="margin-bottom: 20px;"   placeholder="收货人"/><br>
		<form:errors path="name"  cssStyle="color:red"/>
		</p>	
		<p style="text-align:right;margin-right: 200px;font-family: '楷体'">手机号码：<form:input path="telephone" class="text_" style="margin-bottom: 20px;"  placeholder="手机号码"/><br>
		<form:errors path="telephone"  cssStyle="color:red"/>
		</p>		
		
		<div style="float: left; margin-left: 165px;font-family: '楷体'">收货地址：</div>
		<div class="cascade">
       		<select id="province" name="province" onchange="change();" style="float:left;background:url(../img/showbackground.jpg);background-size:300px 60px">
           <option>--请选择省份--</option>
      		</select>
      	 </div>
       	<div class="cascade" style="margin-left: 0px; margin-bottom: 20px;">
     	  	<select id="city" name="city" style="float:left ;background:url(../img/showbackground.jpg);background-size:300px 60px">
            <option>--请选择市--</option>
       		</select>
    	</div>
    	<div style="margin-left: 245px;clear: both; ">	
   		<textarea name="details" style="width: 400px; height: 50px; margin-top: 20px;background:url(../img/showbackground.jpg);background-size:410px 60px" placeholder="详细地址：100字以内"></textarea>
    	</div>
    	<input type="submit" value="保存" class="btn btn-danger" style=" margin-top: 20px;margin-left: 400px; float: left;"></button>
    	<input type="reset" value="重置" class="btn btn-danger" style=" margin-top: 20px;margin-left: 20px; float: left;"></button>
		</form:form>	
		</div>
		</div>
		</div>
		<script type="text/javascript">
        //首先建立一个你需要省，和它对应的市的数组，如下：
        var cityList = new Array();
        cityList['北京市'] = ['朝阳区', '东城区', '西城区', '海淀区', '宣武区', '丰台区', '怀柔', '延庆', '房山'];
        cityList['上海市'] = ['宝山区', '长宁区', '丰贤区', '虹口区', '黄浦区', '青浦区', '南汇区', '徐汇区', '卢湾区'];
        cityList['广州省'] = ['广州市', '惠州市', '汕头市', '珠海市', '佛山市', '中山市', '东莞市'];
        cityList['深圳市'] = ['福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边'];
        cityList['重庆市'] = ['俞中区', '南岸区', '江北区', '沙坪坝区', '九龙坡区', '渝北区', '大渡口区', '北碚区'];
        cityList['天津市'] = ['和平区', '河西区', '南开区', '河北区', '河东区', '红桥区', '塘古区', '开发区'];
        cityList['江苏省'] = ['南京市', '苏州市', '无锡市'];
        cityList['浙江省'] = ['杭州市', '宁波市', '温州市'];
        cityList['四川省'] = ['四川省', '成都市'];
        cityList['海南省'] = ['海口市'];
        cityList['福建省'] = ['福州市', '厦门市', '泉州市', '漳州市'];
        cityList['山东省'] = ['济南市', '青岛市', '烟台市'];
        cityList['江西省'] = ['江西省', '南昌市'];
        cityList['广西省'] = ['柳州市', '南宁市'];
        cityList['安徽省'] = ['安徽省', '合肥市'];
        cityList['河北省'] = ['邯郸市', '石家庄市'];
        cityList['河南省'] = ['郑州市', '洛阳市'];
        cityList['湖北省'] = ['武汉市', '宜昌市'];
        cityList['湖南省'] = ['湖南省', '长沙市'];
        cityList['陕西省'] = ['陕西省', '西安市'];
        cityList['山西省'] = ['山西省', '太原市'];
        cityList['黑龙江省'] = ['黑龙江省', '哈尔滨市'];
        cityList['其他'] = ['其他'];
        function change() {
            var pVal = document.getElementById("province").value; //获取省份列表中的值
            var c = document.getElementById("city"); //获取城市列表
            c.options.length = 0; //清楚当前城市列表中的值
            for (var i in cityList) { //循环遍历cityList的属性
                if (i == pVal) { //判断当i等于省份列表中的值时;
                    for (var j in cityList[i]) { //循环遍历cityList[i]的属性
                        c.add(new Option(cityList[i][j], cityList[i][j]), null)
                        //城市列表的末尾增加一个<option>选项，text：cityList[i][j]，value：cityList[i][j]
                    }
                    break;
                }
            }
        }

        function allCity() {
            var p = document.getElementById("province"); //获取省份列表
            for (var i in cityList) { //循环遍历cityList的属性
                p.add(new Option(i, i), null);
                //省份列表的末尾增加一个<option>选项，text：i，value：i
            }
        }
        window.onload = allCity;


    </script>
    
	<!--底部开始-->
		<div class="footer-box" style="font-family: '楷体';">
			<div class="footer-wrap clearfix">
				<div class="copyright-info-box">NKshare 版权所有</div>
				<div class="link-box">
					<a class="item" target="_blank" rel="nofollow" href="">关于NKshare</a>
					<a class="item" target="_blank" rel="nofollow" href="">联系我们</a>
					<a class="item" target="_blank" rel="nofollow" href="">帮助中心</a>
					<a class="item" target="_blank" rel="nofollow" href="">版权隐私</a>
					<a class="item" target="_blank" rel="nofollow" href="">广告业务</a>
					<a class="item" target="_blank" rel="nofollow" href="">工作机会</a>
					<a class="item" target="_blank" href="">商品目录</a>
					<a class="item" target="_blank" href="">商品标签</a>
				</div>
			</div>
		</div>
	</body>
</html>
