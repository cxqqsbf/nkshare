<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>添加新商品</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="system_assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="system_assets/css/admin.css">
<script src="system_assets/js/jquery.min.js"></script>
<script src="system_assets/js/app.js"></script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->



</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="system_assets/i/logo.png"></div>
   <div style="margin-left:800px"><img src="system_assets/i/nkshare.png" style="width:200px;height:50px"></div>
</header>


<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：CSGO</div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
      <ul>
        <li><a href="gotogoodsmanage">商品列表</a></li>
        <li class="func" dataType='html' dataLink='msn.htm' iconImg='images/msn.gif'><a href="add_goods">添加新商品</a></li>
        <li><a href="gotousercomment">用户评论</a></li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
      <ul>
        <li><a href="gotoordersmanage">订单列表</a></li>
        <li><a href="">订单打印</a></li>
        <li><a href="">添加订单</a></li>
      </ul>
      <h3 class="am-icon-users"><em></em> <a href="#">用户管理</a></h3>
      <ul>
        <li><a href="gotousersmanage">用户列表</a></li>
        <li><a href="">添加用户</a></li>
        <li><a href="">修改用户</a></li>
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 
</div>

<div class=" admin-content">
<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on">添加商品</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > <a href="#">添加商品</a></dl>

      
      
    </div>
	
    <div class="fbneirong">
      <form class="am-form" action="goods" method="post" enctype="multipart/form-data">
        <div class="am-form-group am-cf">
          <div class="zuo">商品名称：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入商品名字" name="goods_name">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">商品分类：</div>
          <div class="you">
           <c:forEach items="${categorylist }" var="category">
           <input type="checkbox" name="category" value=${category.category_id }>${category.category_name }&nbsp;&nbsp;
           </c:forEach>
          </div>
        </div>
		 <div class="am-form-group am-cf">
          <div class="zuo">卖家：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入卖家名字" name="user_id">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">内容简介：</div>
          <div class="you">
            <textarea class="" rows="2" id="doc-ta-1" name="details"></textarea>
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">商品图片：</div>
          <div class="you" style="height: 45px;">
            <input type="file" id="doc-ipt-file-1" name="image">
            <p class="am-form-help">请选择要上传的文件...</p>
          </div>
        </div>
         <div class="am-form-group am-cf">
          <div class="zuo">原价格：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入原价" name="pre_price">
          </div>
        </div>
        <div class="am-form-group am-cf">
          <div class="zuo">现价格：</div>
          <div class="you">
            <input type="text" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入现价" name="rel_price">
          </div>
        </div>
        
 
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
          </div>
        </div>
      </form>
    </div>

  
 
 <div class="foods">
  <ul>
    版权所有@2019
  </ul>
  <dl>
    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
  </dl>
</div>




</div>

</div>




</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->



</body>
</html>