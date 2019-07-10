<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>登录页面</title>
         <script src="login_assets/js/jquery-1.11.1.min.js"></script>
        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="login_assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="login_assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="login_assets/css/form-elements.css">
        <link rel="stylesheet" href="login_assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="login_assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="login_assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="login_assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="login_assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="login_assets/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <script>
    $(function(){
    	$("#register").click(function(){
    		var form = document.getElementById("login");
    		form.method="get";
    		form.action="gotoregister";
    		form.submit();
    	});
    })
   
    </script>
    <body>

		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Bootstrap Registration Form Template</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<span class="li-text">
								欢迎来到nkshare
							</span> 
							<span class="li-text">
								后端管理系统
							</span> 
							<span class="li-social">
								<a href="#"><i class="fa fa-facegoods"></i></a> 
								<a href="#"><i class="fa fa-twitter"></i></a> 
								<a href="#"><i class="fa fa-envelope"></i></a> 
								<a href="#"><i class="fa fa-skype"></i></a>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>nkshare</strong> 后端管理系统</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录</h3>
                            		<p>子曰: 有朋自远方来，不亦乐乎?</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-pencil"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form"  class="registration-form" action="login" method="post" id="login">
			                    <div>${data} </div>
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">First name</label>
			                        	<input type="text" name="nickname" placeholder="请输入用户名" class="form-first-name form-control" id="form-first-name">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">Last name</label>
			                        	<input type="password" name="password" placeholder="请输入密码" class="form-last-name form-control" id="form-last-name">
			                        </div>
			                        <button type="submit" class="btn">登录!</button><button type="submit" class="btn" id="register">注册!</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="login_assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="login_assets/js/jquery.backstretch.min.js"></script>
        <script src="login_assets/js/retina-1.1.0.min.js"></script>
        <script src="login_assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="login_assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>