<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的评论</title>
<link rel="stylesheet" type="text/css" href="css/intro.css" />
<link rel="stylesheet" href="css/headerOfAll.css" />
<link rel="stylesheet" href="css/foot.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
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
				<p style="font-size: 20px; margin-top: 15px; margin-bottom: 15px;">我的评价/Comment</p>
				<div class="centop">
				<span class="comments">所有评价</span>
				</div>
			<table class="shop" cellspacing="10px" style="background-color:#D6D6D6;width:100%" rules="rows">
				<tr>
				<td style="width:35%;text-align: center;" colspan="2">商品</td>
				<td class="commenttext">评价内容</td>
				<td class="time">评价时间</td>
				<td class="scores">评分</td>
				</tr>
				<c:forEach items="${pageInfo.list}" var="comment" varStatus="status">
				<tr id="${comment.comment_id}">
				<td class="photo"><img src="${comment.goodssinfo.image_path}"></td>
				<td class="name">${comment.goodssinfo.goods_name}</td>
				<td class="commenttext">${comment.content}</td>
				<td class="time">${comment.comment_time}</td>
				<td class="scores">${comment.score}</td>
				</tr>
				</c:forEach>
			</table>
			<div style="font-size:20px;">
	<span>共${pageInfo.total}条/共${pageInfo.pages}页
	<span style="margin-left:300px">第${pageInfo.pageNum}页</span>
		<a href="mycomment?pn=${pageInfo.navigateFirstPage}" style="margin-left:400px">首页</a>
		<c:if test="${pageInfo.hasPreviousPage}">
		<a href="mycomment?pn=${pageInfo.prePage}">上一页</a>
		</c:if>
		<c:forEach items="${pageInfo.navigatepageNums}" var ="pageNum">
		<a href="mycomment?pn=${pageNum}">${pageNum}</a>
		</c:forEach>
		<c:if test="${pageInfo.hasNextPage}">
		<a href="mycomment?pn=${pageInfo.nextPage}">下一页</a>
		</c:if>
		<a href="mycomment?pn=${pageInfo.navigateLastPage}">尾页</a>
		</span>
		</div>
			</div>
			</div>
			<script>
			function del(id){
				  if(confirm("您确定要删除吗?")){
					 var url = "mycomment";
						$.ajax({
							url : url,
							type : "post",
							data : {
								"comment_id" :id
							},
							success : function(result) {
								if (result==1) {
								    var tr = document.getElementById(id);
								    tr.parentNode.removeChild(tr);
								    alert("删除成功");
								}else {
									alert("删除失败，请重试!");
								}
							}
						});
				   }  
			}
			</script>
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