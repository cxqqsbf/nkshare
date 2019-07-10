<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>支付</title>
<style>
body{
background:url(img/library.jpg);
background-attachment:fixed;
background-size:cover;
font-size:20px;
}
#overall{margin-top: 130px;position:absolute;top:2%;width:60%;left:20%;height:60%;background: rgba(255,255,255,0.3);}
#list{width:100%;text-align:left;vertical-align:middle;}
.num{width:57px;height:30px;text-align:center;font-size:18px}
.jia,.jian{width:28px;height:35px;font-size:18px}
.check{width:20px;height:20px}
#payment{width:90px;height:45px;font-size:29px;font-family:"楷体";font-weight:bolder}
#bottom{
text-align:center;
vertical-align:middle;
font-size:21px;
height:8.5%;
background-color:rgba(0,0,0,0.1);
position:fixed;
bottom:1.1%;
width:60%;
left:20%;
z-index:99;
}
.book td:first-child{width:8%;text-align:right}
.photo{width:18%;height:160px;text-align:center}
.book img{width:150px;height:150px}
#bottom img{width:50px;height:50px}
.name{width:43%}
.price{width:15%;text-align:center}
</style>
<link rel="stylesheet" href="css/headerOfAll.css" />
<link rel="stylesheet" href="css/foot.css" />
<script src="js/jquery-1.11.3.js"></script>
</head>
<body>

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
			<%-- <c:choose>
			   <c:when test="${!empty cookie.username.value}">
			     <c:set value="${cookie.username.value }" var="changeHeader" scope="page"/>
			   </c:when>
			</c:choose> --%>
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
<!--公共顶部模板结束-->
<div id="overall">
		<hr>
		<table>
		<tr>
			<td width="8%"></td>
			<td width="41%">订单号：${requestScope.order.order_id}&nbsp;&nbsp;</td>
			<td width="51%">创建时间：${requestScope.order.create_time}</td>
		</tr>
		</table>
		<table id="list">
			<c:forEach items="${requestScope.order.orders_info}" var="oi" varStatus="status">
			<tr class="book" id="${oi.goods_id}">
				<td><span class="check"></span></td>
				<td class="photo"><a href="showgoods?goods_id=${oi.goods_id}"><img src="${oi.goodss.image_path}"></a></td>
				<td class="name"><a href="showgoods?goods_id=${oi.goods_id}" color="black"><font color="black">${oi.goodss.goods_name}</font></a>
				</td>
				<td class="price">￥${oi.goodss.rel_price}</td>
				<td>
					<span class="jian"></span>
					<span class="num">${oi.goods_num}</span>
					<span class="jia"></span>
				</td>
			</tr>
			</c:forEach>
		</table>
		<form action="order_success" method="post">
		<input type="hidden" name="order_id" value="${requestScope.order.order_id}">
		<table id="bottom">
			<tr>
				<td width="25%"><input type="radio" name="pay" value="Alipay" checked><img src="img/book_details/6.jpg"></td>
				<td width="25%"><input type="radio" name="pay" value="WeChat"><img src="img/book_details/7.jpg"></td>
				<td width="25%">合计：${requestScope.order.money}</td>
				<td width="25%"><button id="payment" type="submit">支付</button></td>
			</tr>
		</table>
		
		</form>
</div>
</body>
</html>