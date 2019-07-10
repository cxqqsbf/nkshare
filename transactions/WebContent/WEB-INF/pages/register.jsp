<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.util.*"%>
         <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" href="css/ingister.css">
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script>
	function checkUser(){$.ajax({
		type:"post",
		url:"register?action=checkUser",
		data:{"username":$("#username").val()},//要传递的参数 
		success:function(data) {
			$("#msg").text(data); 
		}
		})};
		function checkTel(){$.ajax({
			type:"post",
			url:"register?action=checkTel",
			data:{"tel":$("#telephone").val()},//要传递的参数 
			success:function(data) {
				$("#msg1").text(data); 
			}
			})};
			function checkEma(){$.ajax({
				type:"post",
				url:"register?action=checkEma",
				data:{"email":$("#email").val()},//要传递的参数 
				success:function(data) {
					$("#msg2").text(data); 
				}
				})};
				function checkPwd(){$.ajax({
					type:"post",
					url:"register?action=checkPwd",
					data:{"password":$("#password").val()},//要传递的参数 
					success:function(data) {
						$("#msg3").text(data); 
					}
					})};
	</script>
</head>
<body background="img/library.jpg" style="background-size: cover"> 
		<div class="cxq">
			<div class="str">
				<div class="zc">
					<div class="bj_bai" style="filter:(opactity=70);background:rgba(255,255,255,0.3); padding-right: 40px;">
					<h1 style="margin-left: 120px;;font-size: 30px;font-family: '楷体';">南开二手交易平台</h1>
					<img src="img/nk.png" alt="NK" height="50px"style="margin-left: 200px;">
						<br/>
						<br/>
						<form  action="register?action=log" method="post" >
							<p class="kaiti" style="font-family:'楷体'">用户名：<input type="text" class="kuang_txt name" id="username"  name="username" placeholder="用户名" onkeyup="checkUser()" style="margin-bottom: 5px;font-family:'楷体'" /></p>
							<span  id="msg" name="msg" style="margin-bottom: 50px;margin-left: 85px;color: red;"></span>
							<p class="kaiti" style="font-family:'楷体'">手机号：<input type="text" class="kuang_txt phone" style="margin-top: 25px;margin-bottom: 5px;font-family:'楷体';"  onkeyup="checkTel()" id="telephone"  name="telephone" placeholder="手机号" /></p>
							<span  id="msg1" name="msg" style="margin-bottom: 50px;margin-left: 85px;color: red;"></span>
							<p class="kaiti" style="font-family:'楷体'">邮箱：<input type="text" class="kuang_txt email" style="margin-top: 25px;margin-bottom: 5px;font-family:'楷体';" id="email" name="email" onkeyup="checkEma()" placeholder="邮箱" /></p>
							<span  id="msg2" name="msg" style="margin-bottom: 50px;margin-left: 85px;color: red;"></span>
							<p class="kaiti" style="font-family:'楷体'">密码：<input type="password" class="kuang_txt password" style="margin-top: 25px;margin-bottom: 5px;font-family:'楷体';" id="password" name="password" onkeyup="checkPwd()" placeholder="密码"  /></p>
							<span  id="msg3" name="msg" style="margin-bottom: 50px;margin-left: 85px;color: red;"></span>
							<p class="kaiti" style="font-family:'楷体'">确认密码：<input type="password" class="kuang_txt password" style="margin-top: 25px;margin-bottom: 5px;font-family:'楷体';" id="checkpwd" placeholder="确认密码" /></p>
							<div style="margin-left: 30px;margin-top: 10px">
								<input name="remember" id="remember" type="checkbox" value="" /><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《XXXXX使用协议》</span></a><a href="login" target="_blank" style="margin-left:40px"><span class="lan">已有账号？直接登录</span></a>
								</span>
								<input type="submit" class="btn_zhuce"  id="submit" value="注册" style="margin-left: 80px"></input>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
		window.onload=function()
		{
			var submit=document.getElementById("submit");
			submit.onclick=function(event){
				if($("#msg").text()!="用户名可用"||$("#msg1").text()!="正确"||$("#msg2").text()!="正确"||$("#msg3").text()!="正确"||$("#remember").prop("checked")!=true)  {return false;}
				else if($("#password").val()!=$("#checkpwd").val()) { alert("确认密码输入错误");return false;}
				alert("注册成功");
				return true;
			}
		};
		</script>

</body>
</html>