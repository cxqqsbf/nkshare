<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<style>
body{
background:url(img/library.jpg);
background-attachment:fixed;
background-size:cover;
font-family:"楷体";
font-size:20px;
}

#overall{margin-top: 130px;position:absolute;top:2%;width:60%;left:20%;height:60%;background: rgba(255,255,255,0.3);}
#list{width:100%;text-align:left;vertical-align:middle;}
.check,#all{width:20px;height:20px}
.jia,.jian{width:28px;height:35px;font-size:18px}
.num{width:57px;height:30px;text-align:center;font-size:18px}
#settlement{width:90px;height:45px;font-size:29px;font-family:"楷体";font-weight:bolder}
#del{width:80px;height:36px;font-size:22px;font-weight:normal}
#bottom{
text-align:center;
vertical-align:middle;
font-size:21px;
height:8.5%;
background-color:rgba(0,0,0,0.1);
position:fixed;
bottom:1.1%;
width:60%;
left:20%;
z-index:99;
}
.book td:first-child{width:8%;text-align:right}
.photo{width:18%;height:160px;text-align:center}
.book img{width:150px;height:150px}
.name{width:43%}
.price{width:15%;text-align:center}
</style>
<link rel="stylesheet" href="css/headerOfAll.css" />
<link rel="stylesheet" href="css/foot.css" />
<script src="js/jquery-1.11.3.js"></script>

</head>
<body>
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
<div id="shoppongcart">
<!--顶部通栏开始-->
	<div id="overall">
		<table id="list">
		<tr>
			<td></td><td></td><td>商品详情</td><td>&nbsp;&nbsp;&nbsp;商品价格</td><td>&nbsp;&nbsp;商品数量</td>
		</tr>
		<c:forEach items="${pageInfo.list}" var="cart" varStatus="status">
		<c:forEach items="${cart.goodssList}" var="goods" varStatus="status">
			<tr class="book" id="${goods.goods_id}">
				<td><input type="checkbox" class="check"></td>
				<td class="photo"><a href="showgoods?goods_id=${goods.goods_id}"><img src="${goods.image_path}"></a></td>
				<td class="name"><a href="showgoods?goods_id=${goods.goods_id}"><font color="black">${goods.goods_name}</font></a><br>
				<span>卖家:&nbsp;</span>
					${goods.user_id }
				<br>
				<c:forEach items="${cart.categoriesList }" var="category" varStatus="status">类别：
				${category.category_name }
				</c:forEach>
				<td>￥<span class="price">${goods.rel_price}</span></td>
				<td>
					<button type="button" class="jian">-</button>
					<!--只能输入数字-->
					<input onkeyup="value=value.replace(/[^\d]/g,'')" class="num" type="text" value="${cart.goods_num}">
					<button type="button" class="jia">+</button>
				</td>
			</tr>
			</c:forEach>
		</c:forEach>
		</table>
	</div>
		<div id="bottom">
			<table>
				<tr>
					<td align="center" width="20%"><input type="checkbox" id="all">全选</td>
					<td><button type="button" id="del">删除</button></td>
					<td align="right" width="20%">已选<span id="count">0</span>件</td>
					<td align="center" width="30%">合计：<span id="total">0</span></td>
					<td width="30%"><button id="settlement" type="button">结算</button></td>
				</tr>
			</table>
		</div>
</div>
		<script type="text/javascript">
$(document).ready(function(){
	function total(){
		var count=0;
		var total=0;
		$(".book").each(function(){
			if($(this).find(".check").prop("checked")){
				count++;
				var price=$(this).find(".price").text();
				var num=$(this).find(".num").val();
				total=total+parseFloat(price)*parseInt(num);
			}
		});
		$("#count").text(count);
		$("#total").text(total);
	}
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
		total();
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
	$(".jian").click(function(){
		if($(this).next().val()>1){
			var num=$(this).next().val()-1;
			$(this).next().val(num);
			total();
			var data1 = $(this).parent().parent().attr("id");
			var data2 = num;
			$.ajax({
			    url : 'updateGoods_num', 
			    type : 'post', 
			    data : {'goods_id':data1,'goods_num':data2}, 
			    dataType : 'json',  
			    async : false,  
			    cache : false ,  
			    success:function(){ 
			    }
			});
		}
	});
	$(".jia").click(function(){
		//(*1)把字符串转换为数字
		var num=$(this).prev().val()*1+1;
		$(this).prev().val(num);
		total();
		/* location.href="updateBook_num.action?book_id="+$(this).parent().parent().attr("id")+"&book_num="+num; */
		var data1 = $(this).parent().parent().attr("id");
		var data2 = num;
		$.ajax({
		    url : 'updateGoods_num', 
		    type : 'post', 
		    data : {'goods_id':data1,'goods_num':data2}, 
		    dataType : 'json',  
		    async : false,  
		    cache : false ,  
		    success:function(){ 
		    }
		});
	});
	$(".num").keyup(function(){
		if($(this).val()==0){
			$(this).val(1);
		}
		total();
		var data1 = $(this).parent().parent().attr("id");
		var data2 = $(this).val();
		$.ajax({
		    url : 'updateGoods_num', 
		    type : 'post', 
		    data : {'goods_id':data1,'goods_num':data2}, 
		    dataType : 'json',  
		    async : false,  
		    cache : false ,  
		    success:function(){ 
		    }
		});
	});
	$("#del").click(function(){
		var goodss_id=new Array();
		$(".book").each(function(){
			if($(this).find(".check").prop("checked")){
				goodss_id.push($(this).attr("id"));
				$(this).remove();
			}
		});
		$("#total").text(0);
		location.href="deleteShoppingcart.action?goodss_id="+goodss_id;
	});
	$("#settlement").click(function(){
		var goodss_id=new Array();
		var goodss_num=new Array();
		$(".book").each(function(){
			if($(this).find(".check").prop("checked")){
				goodss_id.push($(this).attr("id"));
				goodss_num.push($(this).find(".num").val().toString());
			}
		});
		location.href="showshoppingcart?goodss_id="+goodss_id+"&goodss_num="+goodss_num;
	});
	$(".book").hover(
		function(){
			$(this).attr("style","background-color:rgba(166,174,176,0.6)");
		},
		function(){
			$(this).attr("style","background-color:rgba()");
		}
	)
});
</script>
</body>
</html>