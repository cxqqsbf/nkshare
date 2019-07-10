<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的订单</title>
		<link rel="stylesheet" type="text/css" href="css/intro.css" />
		<link rel="stylesheet" type="text/css" href="css/orstyle.css" />	
		<link rel="stylesheet" type="text/css" href="css/headerOfAll.css" />	
		<link rel="stylesheet" type="text/css" href="css/foot.css" />	
		<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
		<style type="text/css">
			#shade {
				position: fixed;
				top: 0;
				left: 0;
				z-index: 1;
				width: 100%;
				height: 100%;
				background-color: #000;
				opacity: 0.3;
				/*兼容IE8及以下版本浏览器*/
				filter: alpha(opacity=30);
				display: none;
			}
			
			#comment {
				position: fixed;
				top:300px;
				left:600px;
				width:240px;
				height:200px;
				background: white;
				display: none;
				z-index: 20;
			}
		</style>
		<script type="text/javascript">
			function statement(order_id,state,goods_id){
				if(state=="0"){
					location.href="payment?order_id="+order_id;
				}
				if(state=="1"){
					$("#goods_id").val(goods_id);
					$("#comment").css("display", "block");
					$("#shade").css("display", "block");
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
						document.getElementById("scores").innerHTML = index + 1 + "分";
						var rel_score = (index + 1).toString;
						$("#order_scores").val(rel_score);
					};
					
					$("#ok").click(function() {
						var rel_score = (index + 1).toString;
						$("#order_scores").val(rel_score);
						var form1 = $("#form1");
						form1.submit();
						$("#comment").css("display", "none");
						$("#shade").css("display", "none");
					});
				}
			}
		</script>
	</head>
	<body onload="choosetype()">
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
							<option value="s_userName">商品名</option>
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
			<div class="indivicenter">
			<div class="state_01" id="tab1">
				<p style="font-size: 20px; margin-top: 15px; margin-bottom: 15px;">订单管理/Order</p>
				<div class="centop" style="margin-bottom:1px">
				<ul style="list-style: none; float: left;margin-bottom:-20px">
				<li><a href="myorder" onclick="change_tab('0')"><font color="black">所有订单</font></a></li>
				<li><a href="myorder?pay_state=0" onclick="change_tab('1')"><font color="black">待付款</font></a></li>
				<li><a href="myorder?pay_state=1" onclick="change_tab('2')"><font color="black">待评价</font></a></li>
				</ul>
				</div>
				<table class="shop" cellspacing="10px" style="background-color:#D6D6D6;width:100%" rules="rows">
					<tr>
					<td>订单编号</td>
					<td>商品信息</td>
					<td>单价</td>
					<td>数量</td>
					<td>合计</td>
					<td>支付状态</td>
					<td>交易操作</td>
					</tr>
					<c:forEach items="${pageInfo.list}" var="order" varStatus="status">
					<tr id="${order.order_id}">
					<td colspan="4">${order.order_id}</td>
					<td>${order.money}</td>
					<td>${order.signal}</td>
					<td><button id="comment_button" class="btn btn-danger" style="display:${order.operation}"  onclick="statement('${order.order_id}','${order.pay_state}','0')">${order.operation}</button></td>
					</tr>
					<c:forEach items="${order.orders_info}" var="orders_info" varStatus="status">
					<tr>
						<td></td>
						<td>${orders_info.goodss.goods_name }</td>
						<td>${orders_info.goodss.rel_price}</td>
						<td>${orders_info.goods_num}</td>
						<td></td><td></td>
						<td><button id="comment_button" class="btn btn-danger" style="display:${order.goods_operation}"  onclick="statement('${order.order_id}','${order.pay_state}','${orders_info.goodss.goods_id}')">商品评价</button></td>
					</tr>
					</c:forEach>
					</c:forEach>
				</table>
			<div style="font-size:20px;">
			<span>共${pageInfo.total}条/共${pageInfo.pages}页
			<span style="margin-left:200px">第${pageInfo.pageNum}页</span>
				<a href="myorder?pn=${pageInfo.navigateFirstPage}" style="margin-left:400px">首页</a>
				<c:if test="${pageInfo.hasPreviousPage}">
				<a href="myorder?pn=${pageInfo.prePage}">上一页</a>
				</c:if>
				<c:forEach items="${pageInfo.navigatepageNums}" var ="pageNum">
				<a href="myorder?pn=${pageNum}">${pageNum}</a>
				</c:forEach>
				<c:if test="${pageInfo.hasNextPage}">
				<a href="myorder?pn=${pageInfo.nextPage}">下一页</a>
				</c:if>
				<a href="myorder?pn=${pageInfo.navigateLastPage}">尾页</a>
				</span>
				</div>
					</div>
					</div>
			</div>
				<div id="shade"></div>
				<div id="comment">
					<form id="form1" action="order_comment" method="get" style="margin-left:30px;margin-top:20px;">
						<textarea rows="5" cols="25" wrap="off" name="content"></textarea>
						<table id="stars">
							<tr>
								<td>评价商品&nbsp;</td>
								<td name="star">★</td>
								<td name="star">★</td>
								<td name="star">★</td>
								<td name="star">★</td>
								<td name="star">★</td>
								<td><span id="scores" name="scores">分</span></td>
							</tr>
						</table><br>
						<input type="hidden" id="goods_id" name="goods_id" value="" />
						<input type="hidden" id="order_scores" name="order_scores" value="" />
						<button id="ok" name="ok" onclick="order_com()">提交评价</button>
					</form>
				</div>
			
		</div>
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