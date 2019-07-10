<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/ingister.css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<title>登录</title>
</head>
<body background="img/library.jpg" style="background-size:cover">
		<div class="cxq">
			<div class="str">
				<div class="zc">
					<div class="deng_bai"  style="filter:(opactity=70);background:rgba(255,255,255,0.3);">
					<h1 style="margin-left: 100px;font-size: 25px;font-family: '楷体';">南开二手交易平台</h1>
					<img src="img/nk.png" alt="NK" height="50px"style="margin-left: 170px;">
						<h2 style="font-family: '楷体';">登录</h2>
						<form action="login" method="post">
							<p style="text-align: right; font-size: 20px;font-family: '楷体';margin-right: 40px">用户名：<input type="text" class="deng_txt name" name="username" id="username" placeholder="用户名"   /></p>
							<p style="text-align: right;font-size: 20px;font-family: '楷体';margin-right: 40px">密码：<input type="password" class="deng_txt password" name="password" id="password" placeholder="密码"/></p>
							<span style="color:red"><%=request.getAttribute("message")==null?"":request.getAttribute("message") %></span>
							<br></br>
							<div style="margin-left: 70px;">
								<input type="checkbox" style="" id="remember" name="remember" value="yes"/><span style="font-size: 15px;font-family:楷体;">记住我 </span>
								<a href="register" style="text-decoration: none; margin-left: 130px;"><span style="font-size: 15px;font-family: 楷体; color: blue;">没有账号？立即注册</span></a>
							</div>
							<br/>
							<div style="margin-left: 70px;">
								<input type="submit" class="btn_deng" value="登录" style="font-family: 楷体;">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
		(function ()
		{
			if($("#username").val()!="")
			$("#remember").attr("checked",true);	
		}());
		</script>
	</body>
</html>