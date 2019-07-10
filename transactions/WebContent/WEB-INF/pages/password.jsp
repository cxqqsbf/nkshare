<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="css/intro.css" />
<link rel="stylesheet" href="css/headerOfAll.css" />
<link rel="stylesheet" href="css/foot.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script src="bootstrap.js" type="text/javascript"></script>
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
		<p style="font-family: 'arial black'; font-size: 20px; margin-top: 15px; margin-bottom: 15px;">修改密码/Password</p>	
		<hr style="background-color:white">
		<div class="distan">
		<form action="changepwd" method="post" style="margin-left: 50px;margin-top: 180px;">
		<p style="margin-bottom: 60px;">原密码&nbsp;&nbsp;&nbsp;&nbsp;<span><input type="password" id="oldpass" name="oldpass" class="text_" placeholder="请输入原登录密码" /></p>
		<span style="color:red;margin-left:170px;margin-bottom: 50px;"><%=request.getAttribute("message")==null?"":request.getAttribute("message") %></span>
		<p style="margin-bottom: 5px;">新密码&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="newpass" name="newpass" class="text_" onkeyup="AuthPasswd()" placeholder="请输入新密码"  /></p>
		
		<div class="progress" style="margin-top: 0px; width: 300px; margin-left:245px">
  		<div class="progress-bar progress-bar-success" role="progressbar" id="foo" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%; margin-top: 0px; margin-bottom: 40px;">
  		</div>
		</div>
		<div style="margin-left:160px;">
		<span style="margin-right:15px;">密码强度&nbsp;</span><span style="margin-right:130px;">弱</span><span style="margin-right:130px;">中</span><span>强</span>
		<span style="color:red;" id="showpower"></span>
		</div>
		<p style="margin-top: 50px;" >确认密码&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" id="checkpass" name="checkpass" class="text_" placeholder="请再输一遍密码" /></p>
		<span style="color:red;margin-left:160px;"><%=request.getAttribute("message2")==null?"":request.getAttribute("message2") %></span>
		<br/>
		<span style="margin-left: 400px;"><button type="submit" class="btn btn-danger" id="submit" >保存修改</button></span>
		</form>
		</div>
		</div>
		</div>
		<c:if test="${!empty msg}">
		<script>alert("修改成功")</script>
		</c:if> 
		<script>
		window.onload=function()
		{
			var submit=document.getElementById("submit");
			submit.onclick=function(event){
				if($("#foo").attr("aria-valuenow")=="0") {$("#showpower").text("密码强度太弱");return false;}
				return true;
			}
		};
function AuthPasswd() {
	
	var string=document.getElementById("newpass").value;
 if(string.length >=6) 
 {
 if(/[a-zA-Z]+/.test(string) && /[0-9]+/.test(string) && /\W+\D+/.test(string)) 
 {
  noticeAssign(1);
 }
 else if(/[a-zA-Z]+/.test(string) || /[0-9]+/.test(string) || /\W+\D+/.test(string)) 
 {
  if(/[a-zA-Z]+/.test(string) && /[0-9]+/.test(string)) {
  noticeAssign(-1);
  }else if(/\[a-zA-Z]+/.test(string) && /\W+\D+/.test(string)) {
  noticeAssign(-1);
  }else if(/[0-9]+/.test(string) && /\W+\D+/.test(string)) {
  noticeAssign(-1);
  }else{
  noticeAssign(0);
  }
 }
 }else{
 noticeAssign(-2); 
 }
}
function noticeAssign(num) 
{
 if(num == 1)
 {
 $("#foo").css("width","100%");
 $("#foo").attr("aria-valuenow","100");
 
 }else if(num == -1)
 {
 $("#foo").css("width", "50%");
 $("#foo").attr("aria-valuenow","50");
 }else if(num ==0) 
 {
 $('#foo').css("width","10%");
  $('#foo').attr("aria-valuenow","10");
 }
 else if(num ==-2) 
 {
 $('#foo').css("width","0%");
  $('#foo').attr("aria-valuenow","0");
 }
}	
</script>
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