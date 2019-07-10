<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>南开二手交易平台</title>
	<link type="text/css" rel="stylesheet" href="css/Content.css"/>
	<link type="text/css" rel="stylesheet" href="css/b_classify.css">
	<link type="text/css" rel="stylesheet" href="css/Header.css"/>
	<link type="text/css" rel="stylesheet" href="css/headerOfAll.css" />
	<link type="text/css" rel="stylesheet" href="css/foot.css" />
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="js/slider.js"></script>
	<script type="text/javascript" src="js/recommend.js"></script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			var aLi=document.getElementsByClassName("li");
			for(var i=0;aLi.length>i;i++){
				aLi[i].i=i;
				aLi[i].onmouseover=function() {
					this.className="liname";
					var h1=this.i*35+25;
//					this.getElementsByTagName("div")[0].style.top=h1+'px';
					var h2=this.getElementsByTagName("div")[0].offsetHeight;
					if(h2<h1){
						this.getElementsByTagName("div")[0].style.top=(h1-25)+'px';
					}
				}
				aLi[i].onmouseout=function(){
					this.className="";
				}
			}
		});
	</script>
</head>
<body style="background-image: url(img/library.jpg);">
	<div id="header">
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
				<a href="" class="logo-text">
					<img src="img/nkushare.png" alt="NKshare" height="60px" width="400px">
				</a>
				<img src="img/nk.png" alt="NK" height="50px">
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
			
			
		<div id="navagition">
			<ul id="navagition_ul">
				<li><a href="goodssearch?type=s_category&word=数码家电">数码家电</a></li>
				<li><a href="goodssearch?type=s_category&word=书籍">书籍</a></li>
				<li><a href="goodssearch?type=s_category&word=服装">服装</a></li>
				<li><a href="goodssearch?type=s_category&word=运动">运动</a></li>
				<li><a href="goodssearch?type=s_category&word=日常用品">日常用品</a></li>
				<li><a href="goodssearch?type=s_category&word=美妆洗护">美妆洗护</a></li>
				<li><a href="goodssearch?type=s_category&word=生鲜零食">生鲜零食</a></li>
			</ul>	
		</div>
	</div>
	<div id="content">
		<div id="category">
			<div id="categoryhead">
				<div id="titlepic"></div>
				<div id="titleword">分类</div>
			</div>
			<div id="categorycontent">
				<ul class="ul">
					<li class="li">
						<a href="">手机 /电脑</a>
						<div class="div">
							<dl>
								<dd>华为</dd>
								<dd>苹果</dd>
								<dd>三星</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">考研 /上课</a>
						<div class="div">
							<dl>
								<dd>专业课</dd>
								<dd>数学</dd>
								<dd>英语</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">服装</a>
						<div class="div">
							<dl>
								<dd>男装</dd>
								<dd>女装</dd>
								<dd>其他</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">运动</a>
						<div class="div">
							<dl>
								<dd>球拍</dd>
								<dd>球鞋</dd>
								<dd>其它</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">日常用品</a>
						<div class="div">
							<dl>
								<dd>宿舍神器</dd>
								<dd>其他</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">美妆洗护</a>
						<div class="div">
							<dl>
								<dd>化妆品</dd>
								<dd>洗衣液</dd>
								<dd>其他</dd>
							</dl>
						</div>
					</li>
					<li  class="li">
						<a href="">生鲜零食</a>
						<div class="div">
							<dl>
								<dd>水果</dd>
								<dd>零食</dd>
								<dd>其他</dd>
							</dl>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="show">
			<div style="overflow: hidden;" class="scroll">
				<div class="scrollContainer">
					<div class="panel" id="panel_1">
						<div class="inside">
							<a id="inside_a_1" href=""><img id="panel_1_img" src="" alt="picture" /></a>
							<h2 id="panel_1_h2" ></h2>
							<p id="panel_1_p"></p>
						</div>
					</div>
					<div class="panel" id="panel_2">
						<div class="inside">
							<a id="inside_a_2" href=""><img id="panel_2_img" src="" alt="picture" /></a>
							<h2 id="panel_2_h2"></h2>
							<p id="panel_2_p"></p>
						</div>
					</div>			
					<div class="panel" id="panel_3">
						<div class="inside">
							<a id="inside_a_3" href=""><img id="panel_3_img" src="" alt="picture" /></a>
							<h2 id="panel_3_h2"></h2>
							<p id="panel_3_p"></p>
						</div>
					</div>					
					<div class="panel" id="panel_4">
						<div class="inside">
							<a id="inside_a_4" href=""><img id="panel_4_img" src="" alt="picture" /></a>
							<h2 id="panel_4_h2"></h2>
							<p id="panel_4_p"></p>
						</div>
					</div>				
					<div class="panel" id="panel_5">
						<div class="inside">
							<a id="inside_a_5" href=""><img id="panel_5_img" src="" alt="picture" /></a>
							<h2 id="panel_5_h2"></h2>
							<p id="panel_5_p"></p>
						</div>
					</div>	
					<div class="panel" id="panel_6">
						<div class="inside">
							<a id="inside_a_6" href=""><img id="panel_6_img" src="" alt="picture" /></a>
							<h2 id="panel_6_h2"></h2>
							<p id="panel_6_p"></p>
						</div>
					</div>
					<div class="panel" id="panel_7">
						<div class="inside">
							<a id="inside_a_7" href=""><img id="panel_7_img" src="" alt="picture" /></a>
							<h2 id="panel_7_h2"></h2>
							<p id="panel_7_p"></p>
						</div>
					</div>
					<div class="panel" id="panel_8">
						<div class="inside">
							<a id="inside_a_8" href=""><img id="panel_8_img" src="" alt="picture" /></a>
							<h2 id="panel_8_h2"></h2>
							<p id="panel_8_p"></p>
						</div>
					</div>
					<div class="panel" id="panel_9">
						<div class="inside">
							<a id="inside_a_9" href=""><img id="panel_9_img" src="" alt="picture" /></a>
							<h2 id="panel_9_h2"></h2>
							<p id="panel_9_p"></p>
						</div>
					</div>	
				</div>
			</div>
<!--			<img class="scrollButtons right" src="img/rightarrow.png">-->
		</div>
		<!--图片轮播-->
		<div class="container">
			<div class="wrap" style="left: 0px;">
				<img src="img/tran1.jpg" alt="">
				<img src="img/tran2.jpg" alt="">
				<img src="img/tran4.jpg" alt="">
				<img src="img/tran5.jpg" alt="">
				<img src="img/tran6.jpg" alt="">
			</div>
			<div class="buttons">
				<span class="on" name="image_bt">1</span>
				<span name="image_bt">2</span>
				<span name="image_bt">3</span>
				<span name="image_bt">4</span>
				<span name="image_bt">5</span>
			</div>
			<a href="javascript:;" class="arrow arrow_left">&lt;</a>
			<a href="javascript:;" class="arrow arrow_right">&gt;</a>
		</div>  
		<script type="text/javascript" src="js/lunbo.js" ></script>
		<!--分类推荐-->
		<div class="index_xinshushu">
			<div class="ancient-box">
				<div class="ancient-title">
					<!--楼层的大标题名称和链接-->
					<div class="floor-big-title clearfix">
						<ul> <span class="floor-big-title-name">数码家电</span>
							<li>
								<a href="" target="_blank"><font color="black">手机</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">电脑</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">相机</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">耳机</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">U盘</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">移动硬盘</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">充电宝</font></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="ancient-left">
					<!--楼层的主要内容的推荐商品或者拍品-->
					<div class="gallery-main-list" style="background:rgba(255,255,255,0.8);">
						<p class="gallery-main-title"><span>为您推荐 <i> / </i> <a href="" target="_blank">更多</a></span></p>
						<div class="gallery-main-product-xinshu clearfix"> 
						<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_1_a" href="" target="_blank"><img id = "xinshu_1_img" src="" alt="老子今注今译"></a></span>
							<a id = "xinshu_1_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_1_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_1_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
					
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_2_a" href="" target="_blank"><img id = "xinshu_2_img" src="" alt=""></a></span>
							<a id = "xinshu_2_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_2_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_2_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_3_a" href="" target="_blank"><img id = "xinshu_3_img" src="" alt=""></a></span>
							<a id = "xinshu_3_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_3_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_3_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_4_a" href="" target="_blank"><img id = "xinshu_4_img" src="" alt=""></a></span>
							<a id = "xinshu_4_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_4_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_4_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_5_a" href="" target="_blank"><img id = "xinshu_5_img" src="" alt=""></a></span>
							<a id = "xinshu_5_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_5_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_5_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_6_a" href="" target="_blank"><img id = "xinshu_6_img" src="" alt=""></a></span>
							<a id = "xinshu_6_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_6_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_6_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_7_a" href="" target="_blank"><img id = "xinshu_7_img" src="" alt=""></a></span>
							<a id = "xinshu_7_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_7_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_7_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "xinshu_8_a" href="" target="_blank"><img id = "xinshu_8_img" src="" alt=""></a></span>
							<a id = "xinshu_8_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "xinshu_8_p"></p>
							<p class="gallery-main-product-price" ><i id = "xinshu_8_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							</span>
						</div>
					</div>
				</div>
				<div class="ancient-right">
					<!--楼层的推荐的商品-->
					<div class="list-recommand-list list-recommand-list-new">
						<p class="list-main-title"> <span>  <b>商品推荐</b>  </span> </p>
						<ul>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">数码家电</a>
								</div>
								<p class="list-recommand-list-intro" title="华为手机，惠普电脑,Mac Book,索尼相机,蓝牙耳机。">华为手机，惠普电脑,Mac Book,索尼相机,蓝牙耳机。</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">考研书籍</a>
								</div>
								<p class="list-recommand-list-intro" title="概率论、统计、离散数学、微积分。">概率论、统计、离散数学、微积分</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">运动</a>
								</div>
								<p class="list-recommand-list-intro" title="乒乓球拍、网球拍、羽毛球拍、Aj球鞋">乒乓球拍、网球拍、羽毛球拍、Aj球鞋</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">服装</a>
								</div>
								<p class="list-recommand-list-intro" title="西服，南开品牌衣服，牛仔裤，棒球帽。">西服，南开品牌衣服，牛仔裤，棒球帽。</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">日常用品</a>
								</div>
								<p class="list-recommand-list-intro" title="驱蚊液、电风扇、插排、台灯。">驱蚊液、电风扇、插排、台灯</p>
								<p class="list-shop-line"></p>
							</li>
						</ul>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
		</div>
		<div class="index_xinshu" moduleid="6">
			<div class="ancient-box">
				<div class="ancient-title">
					<!--楼层的大标题名称和链接-->
					<div class="floor-big-title clearfix">
						<ul> <span class="floor-big-title-name">考研书籍</span>
							<li>
								<a href="" target="_blank"><font color="black">计算机</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">数学</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">物理</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">金融</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">英语</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">文学</font></a>
							</li>
							<li>
								<a href="" target="_blank"><font color="black">化学</font></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="ancient-left" style="filter:(opactity=90);background:rgba(255,255,255,0.3);">
					<!--楼层的主要内容的推荐商品或者拍品-->
					<div class="gallery-main-list" style="background:rgba(255,255,255,0.8);">
						<p class="gallery-main-title"><span>为您推荐 <i> / </i> <a href="" target="_blank">更多</a></span></p>
						<div class="gallery-main-product-xinshu clearfix"> 
						<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_1_a" href="" target="_blank"><img id = "jiushu_1_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_1_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_1_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_1_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_2_a" href="" target="_blank"><img id = "jiushu_2_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_2_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_2_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_2_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_3_a" href="" target="_blank"><img id = "jiushu_3_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_3_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_3_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_3_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_4_a" href="" target="_blank"><img id = "jiushu_4_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_4_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_4_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_4_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_5_a" href="" target="_blank"><img id = "jiushu_5_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_5_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_5_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_5_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_6_a" href="" target="_blank"><img id = "jiushu_6_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_6_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_6_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_6_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_7_a" href="" target="_blank"><img id = "jiushu_7_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_7_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_7_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_7_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
							<span class="gallery-lot-slide"> 
							<span class="gallery-book-list-img"><a id = "jiushu_8_a" href="" target="_blank"><img id = "jiushu_8_img" src="" alt="老子今注今译"></a></span>
							<a id = "jiushu_8_aa" href="" target="_blank" class="gallery-main-product-text" title="老子今注今译"></a>
							<p class="gallery-book-time" id = "jiushu_8_p"></p>
							<p class="gallery-main-product-price" ><i id = "jiushu_8_i"><span style="font-size:14px;color: #bf7f5f;"></span> </i><span>￥起</span></p>
							</span>
						</div>
					</div>
				</div>
				<div class="ancient-right">
					<!--楼层的推荐的商品-->
					<div class="list-recommand-list list-recommand-list-new">
						<p class="list-main-title"> <span>  <b>商品推荐</b>  </span> </p>
						<ul>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">数码家电</a>
								</div>
								<p class="list-recommand-list-intro" title="华为手机，惠普电脑,Mac Book,索尼相机,蓝牙耳机。">华为手机，惠普电脑,Mac Book,索尼相机,蓝牙耳机。</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">考研书籍</a>
								</div>
								<p class="list-recommand-list-intro" title="概率论、统计、离散数学、微积分。">概率论、统计、离散数学、微积分</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">运动</a>
								</div>
								<p class="list-recommand-list-intro" title="乒乓球拍、网球拍、羽毛球拍、Aj球鞋">乒乓球拍、网球拍、羽毛球拍、Aj球鞋</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">服装</a>
								</div>
								<p class="list-recommand-list-intro" title="西服，南开品牌衣服，牛仔裤，棒球帽。">西服，南开品牌衣服，牛仔裤，棒球帽。</p>
								<p class="list-shop-line"></p>
							</li>
							<li>
								<div class="f_left"><span class="ico-small-box"></span></div>
								<div class="text_box">
									<a href="" target="_blank" class="list-recommand-list-name">日常用品</a>
								</div>
								<p class="list-recommand-list-intro" title="驱蚊液、电风扇、插排、台灯。">驱蚊液、电风扇、插排、台灯</p>
								<p class="list-shop-line"></p>
							</li>
						</ul>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
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