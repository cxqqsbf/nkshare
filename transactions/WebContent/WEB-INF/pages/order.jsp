<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/book_order.js" type="text/javascript"></script>
<script type="text/javascript" src="js/distpicker.data.js"></script>
<script type="text/javascript" src="js/distpicker.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/order.css" type="text/css">
<link rel="stylesheet" href="css/foot.css" />
<link rel="stylesheet" href="css/headerOfAll.css" />
<title>我的订单</title>

<script type="text/javascript">
	$(function() {
		$("#address_save")
				.click(
						function() {
							$(".addr-box").css("display", "none");
							$("body").css("overflow", "visible");
							$("#shade").css("display", "none");
							$("#address_id").val($(".item").length-1);
							$
									.ajax({
										type : "post",
										url : "add_address",
										data : $("#add_address").serialize(),
										success : function(data) {
											var new_address = $('<div></div>');
											new_address.append("<strong>"+data.name+"</strong>"+"<br/><br/>");
											new_address.append("<span>"+data.provinces+"</span>");
											new_address.append("<span>"+data.city+"</span>");
											new_address.append("<span>"+data.country+"</span>");
											new_address.append("<span>"+data.street+"</span>");
											new_address.append("<span>"+data.zipcode+"</span>");
											new_address.append("<span>"+data.telephone+"</span>")
											new_address.attr("class", "item");
											new_address.append("<div class='confirm'>选中</div>");
											new_address
													.appendTo($(".address-list"));

											var add_address = $('<div></div>');
											add_address.attr("class",
													"add_item");
											var edg = $(".add_item")[0];
											add_address.append(edg.innerHTML);
											add_address
													.appendTo($(".address-list"));
											$(".add_item")[0].remove();
										}
									});
						});
	})
</script>
</head>
<body style="background:url(img/library.jpg);background-attachment:fixed;background-size:cover;">
	<div id="shade"></div>
	<!--头部-->
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
	<!--结束头部-->
	<div id="contain">
		<!--订货地址-->
		<div id="address">
			<div class="checkout-box-bd">
				<!-- 收货地址 -->
				<div class="xm-box">
					<div class="box-hd ">
						<h2 class="title">收货地址</h2>
					</div>
				</div>
				<div class="box-bd">
					<div class="address-list">
						<c:if test="${!empty addresslist}">
							<c:forEach items="${addresslist }" var="address">
								<div class="item">
									<strong>${address.name }</strong><br/><br/>
									<span>${address.provinces }</span>
									<span>${address.city }</span>
									<span>${address.country }</span>
									<span>${address.street }</span>
									<span>${address.zipcode }</span>
									<span>${address.telephone }</span>
									<div class="confirm">选中</div>
									<input type="hidden" value=${address.address_id }>
								</div>
							</c:forEach>

						</c:if>
						<div class="add_item" id="useNewAddr">
							<span>+</span> 使用新地址
						</div>
					</div>
					<!--点击弹出新增/收货地址界面start-->
					<div class="addr-box">
						<form id="add_address">
							<div class="bd">
								<div class="items" id="add_address">
									<input type="text" name="username" id="add_username"
										class="input" placeholder="收货人姓名" maxlength="15"
										autocomplete='off'>
								</div>
								<div class="items">
									<input type="text" name="Telephone" class="input"
										id="Telephone" placeholder="11位手机号" autocomplete='off'>
								</div>
								<div class="items" data-toggle="distpicker">
									<select name="provinces" id="provinces">
										<option>省份/自治区</option>
									</select> <select name="city" id="citys" disabled>
										<option>城市/地区/自治州</option>
									</select> <select name="country" id="county" disabled>
										<option>区/县</option>
									</select> <br>
									<textarea name="street" class="input-area" id="Street"
										placeholder="路名或街道地址，门牌号"></textarea>
								</div>
								<div class="items">
									<input type="text" name="zipcode" id="zipcode" class="input"
										placeholder="邮政编码" autocomplete='off'>
								</div>
							</div>
							<div class="operation">
								<button type="button" class="btn btn-default active"
									id="address_cancel">取消</button>
								<button type="button" class="btn btn-default active"
									id="address_save">保存</button>
							</div>
							<input type="hidden" name="address_id" id="address_id">
						</form>
					</div>
					<!--点击弹出新增/收货地址界面end-->
				</div>
			</div>
		</div>
		<!--结束订货地址-->
		<!--订单信息-->
		<div id="order">
			<div class="box-hd">
				<h2 class="title">确认订单信息</h2>
			</div>
			<div class="box-bd">
			<form id="order_info">
				<dl class="checkout-goods-list">
					<dt>
						<span class="col col-1">商品名称</span> <span class="col col-2">购买价格</span>
						<span class="col col-3">购买数量</span> <span class="col col-4">小计（元）</span>
					</dt>
					<c:forEach items="${orderlist}" var="order">
					<dd class="book_item">
						<div class="item-row">
							<div class="col col-1">
								<div class="g-pic">
									<img src=${order.goods.image_path }
										width="40" height="40" />
								</div>
								<div class="g-info">
									<a href="#"> ${order.goods.goods_name } </a>
								</div>
							</div>

							<div class="col col-2">${order.goods.rel_price }</div>
							<div class="col col-3">${order.goods_num }</div>
							<div class="col col-4">${order.goods_price }</div>
						</div>
						<input type="hidden" name="goods_id" value=${order.goods_id }>
						<input type="hidden" name="goods_price" value=${order.goods_price }>
						<input type="hidden" name="goods_name" value=${order.goods.goods_name }> 
						<input type="hidden" name="goods_num"  value=${order.goods_num }>
					</dd>
					</c:forEach>
				</dl>
				<input type="hidden" id="address_hidden" name="address">
				</form>
			</div>
		</div>
		<!--结束订单信息-->
		<!--发票信息-->
		<div id="invioces">
			<div class="choose_invioces">
				<input type="checkbox">开具发票
			</div>
			<div class="invioces_content">
				<table>
					<tr>
						<td>发票类型</td>
						<td>电子发票</td>
					</tr>
					<tr>
						<td>发票信息</td>
						<td><select disabled="true" class="input">
								<option>明细</option>
						</select></td>
					</tr>
					<tr>
						<td>发票抬头类型</td>
						<td><input type="radio" name="invioces_type" value="个人"
							disabled="true" class="input">个人 <input type="radio"
							name="invioces_type" value="企业" disabled="true" class="input">企业
						</td>
					</tr>
					<tr>
						<td>发票抬头</td>
						<td><span>南开大学</span></td>
					</tr>
				</table>
				<textarea name="commtent" placeholder="请给卖家留言"></textarea>
			</div>
		</div>
		<!--结束发票信息-->
		<!--快递方式-->
		<div id="transport">
			<table>
				<tr>
					<td>运送方式</td>
					<td>普通快递方式</td>
					<td>免邮</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>24:00前付款</td>
					<td>预计三日后送达</td>
				</tr>
			</table>
			<!--结束快递方式-->
			<!--广告-->
			<div id="sum">
				<div id="money">
					<span>订单总额:</span> <b>￥50</b><br> <span>商店总额:</span> <b>￥0</b>
				</div>
			</div>
			<!--结束广告-->
		</div>
		<!--总结-->
		<div id="operation">
			<button class="submit btn-default  btn-lg">提交订单</button>
			<button class="return btn-default  btn-lg">返回购物车</button>
		</div>
		<!--结束总结-->
		<!--提交订单-->
		<!--结束提交订单-->
	</div>
	<!--底部开始-->
		<div class="footer-box" style="font-family:'楷体';">
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