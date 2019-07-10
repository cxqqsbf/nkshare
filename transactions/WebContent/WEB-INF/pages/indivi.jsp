<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="css/intro.css" />
<link rel="stylesheet" href="css/headerOfAll.css" />
<link rel="stylesheet" href="css/foot.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
function Readonly()
{
	  $("input").attr("readonly","true");
	  $(".radioo").attr("disabled","true");
	  $("#searchWord").attr("readonly",false);
}; 
function Canchange()
{
	  $("input").attr("readonly",false);
	  $(".radioo").attr("disabled",false);
}
</script>
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
							<input type="text" name="searchWord" id="searchWord" autocomplete="off" value="${requestScope.goodssearch.searchWord }"  style="font-family:'楷体';">
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
			<div>
				<div class="huge" id="huge1">
				<div class="indivicenter">
					<p style="font-family: 'arial black'; font-size: 20px; margin-top: 15px; margin-bottom: 15px;">个人资料/personal information</p>
					<hr style="background-color:black">
					<div class="block">
						<form:form modelAttribute="user" action="indivi" method="post" style="margin-left: 100px;">
							<p class="kaiti">昵称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input type="text" id="nichen" class="text_" name="nickname" placeholder="nickname" path="nickname" /></p>
							<p class="kaiti">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:radiobutton name="radio1" path="gender" value="男" style="margin: auto;" class="radioo"/>男&nbsp;&nbsp;&nbsp;&nbsp;<form:radiobutton name="radio1" value="女" path="gender" class="radioo"/>女
							<p class="kaiti">电话&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="电话" name="telephone" style="margin-top:40px" class="text_" placeholder="telephone" path="telephone" value="${requestScope.user.telephone}"/></p>
							<p class="kaiti">生日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" style="width: 200px;height:35px;font-size:80%;background-img: url(img/showbackground.jpg);background-size: 200px 60px;" name="birthday" path="birthday" value="${requestScope.user.birthday}"/>
							<p class="kaiti">电子邮件&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="电子邮件" style="margin-top:40px" class="text_" placeholder="email" name="email" path="email" value="${requestScope.user.email}"/></p>
							<span style="margin-left: 300px;">
							<button type="button" class="btn btn-danger" onclick="Canchange()">开始修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-danger">保存修改</button></span>
						</form:form>
					</div>
				</div>
				</div>
				</div>
			</div>
			<script>Readonly()</script>
			<c:if test="${!empty mess}">
			<script>alert("修改错误");Canchange()</script>
			</c:if>
			<c:if test="${!empty right}">
			<script>alert("修改成功")</script>
			</c:if>
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