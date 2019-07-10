<!--
        	作者：1341530396@qq.com
        	时间：2018-08-05
        	描述： 这是用来描述商品详情的网页
        -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script src="js/book_details.js" type="text/javascript"></script>
<script src="js/searchmove(1).js" type="text/javascript"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/book_details.css" type="text/css">
<link rel="stylesheet" href="css/headerOfAll.css" type="text/css">
<link rel="stylesheet" href="css/foot.css" type="text/css">
<title>商品详情</title>
<script type="text/javascript">
	$(function() {
		$("#addshoppingcart")
				.click(
						function() {
							var number = document.getElementById("buytext").value;
							if(number>0){
								$.ajax({
									type : "get",
									url : "insertShoppingcart",
									data : $("#buy_count").serialize(),
									success : function() {
										alert("加入购物车成功");
									}
								});
							}
							else alert("请先选择数量")
						});
	})
</script>
</head>
<body style="background:url(img/library.jpg);background-attachment:fixed;background-size:cover;">
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
	<div id="container">
		<!--头部-->
		
		<!--商品图片-->
		<div id="productimg">
			<img src=${data.image_path }>
		</div>
		<!--商品介绍-->
		<a href="#"></a>
		<p href="#"></p>
		<div id="productintroduce">
			<p class="imgname" style="font-size: 30px;">${data.goods_name}</p>
			<p class="Aprice">
				价格：<strike>${data.pre_price}</strike>
			</p>
			<p class="price">
				促销价：<span>${data.rel_price }</span>
			</p>
			<p class="kefu">类别：${data.category_id }</p>
			<div id="buynumber">
				<form id="buy_count" class="form-horizontal">
					<span>购买数量</span> <input type="button" class="options" id="minus"
						value="-"> <input type="text" value="0" name="goods_num"
						id="buytext" /> <input type="button" class="options" id="plus"
						value="+"> <input type="hidden" name="goods_id"
						value=${data.goods_id}>
				</form>
			</div>
			<p class="buy">
				<a href="#" id="firstbuy">立即购买</a> <a href="#" id="addshoppingcart">加入购物车</a>
			</p>
			<div class="clear"></div>
			<p class="pay">
				支付方式：<img src="img/book_details/6.jpg"><img src="img/book_details/7.jpg">
			</p>
		</div>
		<!--左边商品推荐-->
		<!--其他商品推荐-->
		<div id="recommand">
			<div class="classify">
				<div class="shopim">
					<p class="name">
						nkshare<img src="img/book_details/img/icon.png" width="22" height="22">
					</p>
					<img src="img/book_details/img/images/more.png">
					<p class="sc">
						<a href="#">收藏本店</a>
					</p>
					<p class="sc">
						<a href="#">进入本店</a>
					</p>
					<div class="search">
						<input class="left" type="text" /> <input
							class="btn btn-default active" type="button" value="商店搜索" />
					</div>
				</div>
			</div>
			<div class="shopfl">
				<p class="name">本店分类</p>
				<ul style="list-style-image: url(book_details/img/images/i4.png)">
					<li><a href="#">数码家电</a></li>
					<li><a href="#">书籍</a></li>
					<li><a href="#">服装</a></li>
					<li><a href="#">运动</a></li>
					<li><a href="#">日常用品</a></li>
					<li><a href="#">美妆洗护</a></li>
					<li><a href="#">生鲜零食</a></li>
				</ul>
			</div>
		</div>

		<!--商品介绍及商品评论-->
		<div id="buttom-nav">
			<ul class="list-inline" id="choose-type" style="background-image: url(img/book_details/background/4.jpg);">
				<li class="nav-text"><a href="#panel01">商品介绍</a></li>
				<li class="nav-text"><a href="#panel02">商品评价</a></li>
			</ul>
			<div>
				<div class="panel" id="panel01" style="background-image: url(img/book_details/background/6.jpg);">
					<div id="introduce">
						<p class="sell">商品介绍</p>
						<p>
							${data.details_path}
						</p>
					</div>
				</div>
				<div class="panel" id="panel02" style="background-image: url(img/book_details/background/6.jpg);">
					<div id="buyjudge">
						<p class="sell">买家评价</p>
						<p class="judge">
						</p>
						<c:if test="${empty comment.list}">
							<div class="none">
								<p>该商品还没有用户评论</p>
							</div>
						</c:if>
						<c:if test="${!empty comment.list}">
							<c:forEach items="${comment.list}" var="comm">
								<div class="book_comment">
									<p class="user_id">用户：${comm.user_id }</p>
									<p class="comment">${comm.content }</p>
									<span>评论时间: ${comm.comment_time }</span> 
									<span class="scores">评分: ${comm.score }</span>
								</div>
							</c:forEach>
							<div>
								<c:if test="${comment.hasPreviousPage}">
									<a href="selectAll?pn=${pageInfo.prePage}">上一页</a>
								</c:if>
								<c:forEach items="${comment.navigatepageNums}" var="pageNum">
									<a href="selectAll?pn=${pageNum}">第${pageNum}页</a>
								</c:forEach>
								<c:if test="${comment.hasNextPage}">
									<a href="selectAll?pn=${pageInfo.nextPage}">下一页</a>
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!--下部-->
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