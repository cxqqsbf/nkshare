<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>浏览记录</title>
<link rel="stylesheet" type="text/css" href="css/intro.css" />
	<!-- <link rel="stylesheet" type="text/css" href="css/orstyle.css" /> -->
	<link rel="stylesheet" href="css/headerOfAll.css" />
	<link rel="stylesheet" href="css/foot.css" />
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
</head>
<body>
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
					total();
				});
				$("#del").click(function(){
					$(".goods1").each(function(){
						if($(this).find(".check").prop("checked")){
							var url = "record";
							$.ajax({
								url : url,
								type : "post",
								data : {
									"record_id" :$(this).attr("id")
								},
								success : function() {
									}
							});
							$(this).remove();
						} 
					});
				});
				$(".goods").hover(
					function(){
						$(this).attr("style","background-color:rgba(166,174,176,0.6)");
					},
					function(){
						$(this).attr("style","background-color:rgba()");
					}
				)
			});
			function sel()
			{
				$.ajax({
					url : "myrecord",
					type : "post",
					data : {
						"searchtime" :$("#recorddate").val()
					},
					success : function(data) {
							
						}
				});	
			}
		</script>
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
			<div class="indivicenter">
			<div class="state_01" id="tab1">
				<p style="font-family: 'arial black'; font-size: 20px; margin-top: 15px; margin-bottom: 15px;">浏览记录/Record</p>
			<table id="bottom">
			<tr>
				<td><form action="allrecord" method="post"><input type="submit" value="显示所有结果" /></form></td>
				<td align="center" width="17%"><input type="checkbox" id="all">全选</td>
				<td><button type="button" id="del">删除</button></td>
				<td align="center" width="20%">请输入搜索时间：</td>
				<form action="myrecord" method="get"><td width="16%"><input type="date" id="recorddate" name="recorddate" value="${requestScope.date}"/></td>
				<td width="10%"><input type="submit" /></td><form/>
				
			</tr>
			</table>		
			<table class="shop" cellspacing="10px" style="background-color:#D6D6D6;width:100%" rules="rows">
				<tr>
				<td style="width:40%;text-align: center;" colspan="3">商品</td>
				<td class="price">价格</td>
				<td class="time">浏览时间</td>
				</tr>
				<tr></tr>
				<c:forEach items="${pageInfo.list}" var="record" varStatus="status">
				<tr class="goods1" id="${record.record_id}">
				<td class="checksel"><input type="checkbox" class="check"></td>	
				<td class="photo"><a href="goods_details?goods_id=${record.goods_id}"><img src="${record.goodssinfo.image_path}" style="height:100px;width:100px"></a></td>
				<td class="name">${record.goodssinfo.goods_name}</td>
				<td class="price">${record.goodssinfo.rel_price}</td>
				<td class="recordtime">${record.record_time}</td>
				</tr>
				</c:forEach>
			</table>	
			</div>
			<div style="font-size:20px;">
		<span>共${pageInfo.total}条/共${pageInfo.pages}页
		<span style="margin-left:300px">第${pageInfo.pageNum}页</span>
		<a href="myrecord?pn=${pageInfo.navigateFirstPage}&recorddate=${requestScope.date}" style="margin-left:200px">首页</a>
		<c:if test="${pageInfo.hasPreviousPage}">
		<a href="myrecord?pn=${pageInfo.prePage}&recorddate=${requestScope.date}">上一页</a>
		</c:if>
		<c:forEach items="${pageInfo.navigatepageNums}" var ="pageNum">
		<a href="myrecord?pn=${pageNum}&recorddate=${requestScope.date}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageInfo.hasNextPage}">
		<a href="myrecord?pn=${pageInfo.nextPage}&recorddate=${requestScope.date}">下一页</a>
		</c:if>
		<a href="myrecord?pn=${pageInfo.navigateLastPage}&recorddate=${requestScope.date}">尾页</a>
		</span>
		</div>
			</div>
			</div>
			</div>
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