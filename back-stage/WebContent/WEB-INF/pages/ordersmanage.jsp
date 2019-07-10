<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<title>订单列表</title>
<link rel="stylesheet" href="system_assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="system_assets/css/admin.css">
<script src="system_assets/js/jquery.min.js"></script>
<script src="system_assets/js/app.js"></script>
<link rel="stylesheet" href="system_assets/css/intro.css">
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
      <ul class="am-icon-cart-plus">订单列表</ul>
      
      <dl class="am-icon-home" style="float: right;">当前位置： 首页 > <a href="#">订单列表</a></dl>
      <!--这里打开的是新页面-->      
    </div>
    <form class="am-form am-g" action="ordermana" method="get">
   		 <table id="bottom">
			<tr>
				<td><input type="submit" value="显示所有结果" /></td>
				<td align="right" width="17%" style="margin-left:1000px"><input type="checkbox" id="all" />全选</td>
				<td align="right"><button type="button" id="del">删除</button></td>
				<td align="right" width="20%">请输入订单ID：</td>
				<td width="16%"><input type="text" id="selorder_id" name="selorder_id" class="am-form-field am-input-sm am-input-xm" style="width:150px"/></td>
				<td width="10%"><input type="submit" class="am-btn am-radius am-btn-xs am-btn-success" /></td>	
			</tr>
			</table>
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th class="table-check"></th>
                <th class="table-id">订单ID</th>
                <th class="table-title">用户ID</th>
                <th class="table-date am-hide-sm-only">支付状态</th>
                <th class="table-type">创建时间</th>
                <th class="table-author am-hide-sm-only">总价</th>
                <th width="130px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${pageInfo.list}" var="ordermana" varStatus="status">
            	<tr class="goods1" id="${ordermana.order_id}">
				<td><input type="checkbox" class="check" /></td>
				<td>${ordermana.order_id}</td>
				<td>${ordermana.user_id}</td>
				<td>${ordermana.pay_state}</td>
				<td>${ordermana.create_time}</td>
				<td>${ordermana.money}</td>
				<td>
                	<div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button class="am-btn am-btn-default am-btn-xs am-text-success am-round"><span class="am-icon-search" title="查看订单详情"></span> </button>
                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改订单"><span class="am-icon-pencil-square-o"></span></button>
                      <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除订单"><span class="am-icon-trash-o" ></span></button>
                    </div>
                  </div>
                </td>
				</tr>
				</c:forEach>
            </tbody>
          </table> 
          <hr />
        </form>
 
 	<div style="font-size:20px;">
		<span>共${pageInfo.total}条/共${pageInfo.pages}页
		<span style="margin-left:500px">第${pageInfo.pageNum}页</span>
		<a href="ordermana?pn=${pageInfo.navigateFirstPage}&recorddate=${requestScope.date}" style="margin-left:400px">首页</a>
		<c:if test="${pageInfo.hasPreviousPage}">
		<a href="ordermana?pn=${pageInfo.prePage}&recorddate=${requestScope.date}">上一页</a>
		</c:if>
		<c:forEach items="${pageInfo.navigatepageNums}" var ="pageNum">
		<a href="ordermana?pn=${pageNum}&recorddate=${requestScope.date}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageInfo.hasNextPage}">
		<a href="ordermana?pn=${pageInfo.nextPage}&recorddate=${requestScope.date}">下一页</a>
		</c:if>
		<a href="ordermana?pn=${pageInfo.navigateLastPage}&recorddate=${requestScope.date}">尾页</a>
		</span>
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
<script>
			$(document).ready(function(){
				function all(){
						$("#all").prop("checked",true);
					$(".check").each(function(){
						if(!$(this).prop("checked")){
							$("#all").prop("checked",false);
						}
					});
				}
				$(".check").click(function(){
					all();
				});
				$("#all").click(function(){
					if($("#all").prop("checked")){
						$(".check").prop("checked",true);
					}
					else{
						$(".check").prop("checked",false);
					}
				});
				$("#del").click(function(){
					$(".goods1").each(function(){
						if($(this).find(".check").prop("checked")){
							var url = "ordermana";
							$.ajax({
								url : url,
								type : "post",
								data : {
									"order_id" :$(this).attr("id")
								},
								success : function() {
									}
							});
							$(this).remove();
						} 
					});
				});
			});
			function sel()
			{
				$.ajax({
					url : "ordermana",
					type : "post",
					data : {
						"selorder_id" :$("#selorder_id").val()
					},
					success : function(data) {
						}
				});	
			}
</script>
<script src="assets/js/amazeui.min.js"></script>
</body>
</html>