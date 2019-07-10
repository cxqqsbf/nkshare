<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hans">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta content="width=1020" name="viewport">
		<meta name="renderer" content="webkit">
		<title>nkshare：Java</title>
		<meta name="description" content="南开二手交易平台">
 		<meta name="keywords" content="南开二手交易,数码家电,书籍,服装,运动,日常用品,美妆洗护,生鲜零食">
		<link rel="stylesheet" href="css/book_search.css" />
		<script type="text/javascript" src="js/jquery-1.11.3.js" ></script>
	</head>

	<body style="background:url(img/library.jpg);
background-attachment:fixed;
background-size:cover;">
		<div class="main-box" >
			<!--顶部通栏开始-->
			<div id="navHeader" class="nav-header-box">
				
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
							<a href="" class="info-link" target="_blank" rel="nofollow">
								<span class="info-text">我的订单</span>
							</a>
						</div>
						<div class="item-info">
							<a href="indivi" class="info-link" target="_blank" rel="nofollow">
								<span class="info-text">个人中心</span>
							</a>
							<!-- <div class="info-win">
								<div class="personal-center">
									<div class="info-domain">
										<div class="title">
										</div>
										<a href="" class="item" target="_blank" rel="nofollow">我的订单</a>
									</div>
								</div>
							</div> -->
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
			     <c:set var="user" value="${sessionScope.user}"/>
			     <c:set var="changeHeader" value="${user.user_id }" scope="page"/>
			     <c:if test="${!empty user.nickname}">
			       <c:set var="changeHeader" value="${user.nickname }" scope="page"/>
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
			<div class="header-search clearfix">
				<a href="homepage" class="logo-text">
					<img src="img/nkushare.png" alt="NKshare" height="60px" width="400px">
				</a>
				<img src="img/nk.png" alt="NK" style="width: 50px;height:50px">
				<div class="search-box clearfix">
					<form ModelAttribute="goodssearch" id="searchForm" class="search-con" action="goodssearch" method="post">
						<select id="goodsType" name="goodsType" style="float: left;width: 80px;height:36px;font-size: 16px;text-align: center;">
							<option value="s_all">全部项</option>
							<option value="s_user">卖家</option>
							<option value="s_goodsName">商品名</option>
							<option value="s_category">类别</option>
						</select>
						<div class="search-put">
							<input type="text" name="searchWord" autocomplete="off" value="${requestScope.goodssearch.searchWord }">
							<div id="searchSugBox" class="sug-box"></div>
						</div>
						<input type="hidden" id="sortName" name="sortName" value="">
						<input type="hidden" id="sortWay" name="sortWay" value="">
						<button id="searchBtn" class="btn" type="submit">搜索</button>
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
			
			
			<!--顶部搜索结束-->
			<!--tab开始-->
			<div class="header-tab clearfix">
				<a href="javascript:;" class="item-tab first active">所有商品</a>
			</div>
			<!--tab结束-->
			<!--搜索结果展示开始-->
			<div class="search-wrap">

				<!--面包屑开始-->
				<div id="crumbsBar" class="crumbs-bar">
					<div class="crumbs-nav">
						<div class="crumbs-nav-main clearfix">
							<div class="crumbs-nav-start">
								<span class="">${pageInfo.total }</span>
								<span class="">条结果</span>
								<span class="gray split-text">|</span>
								<span class="red bold">${requestScope.goodssearch.searchWord }</span>
							</div>
						</div>
					</div>
				</div>
				<!--面包屑结束-->
				<!--搜索结果主区域开始-->
				<div id="searchMain" class="search-main clearfix">
					<!--左侧搜索结果信息开始-->
					
					<div class="search-main-result clearfix">
						<!--搜索主区域开始-->
						<div class="result-content">
							<div id="resultMainBox" class="result-main  ">
								<!--搜索结果列表开始-->
								<div id="listBox" class="result-list">
									<c:forEach items="${pageInfo.list }" var="goods" varStatus="status">
									<div class="item clearfix" book_id="${goods.goods_id }" userid="160014">
										<div class="item-img">
											<a class="img-box" href="showgoods?goods_id=${goods.goods_id}" target="_blank">
												<img src="${goods.image_path }" alt="<b>${goods.goods_name }</b>">
											</a>
											<%-- <div class="big-img-box">
												<img class="big-img loading" src="${book.image_path }">
											</div> --%>
										</div>
										<div class="item-info clearfix">
											<div class="title">
												<a href="showbook?book_id=${goods.goods_id}" target="_blank" class="link"><b>${goods.goods_name }</b></a>
											</div>
											<div class="zl-normal-info clearfix">
												<div class="f_left">
													<div class="normal-item clearfix">
														<span class="normal-title">卖家<span>:&nbsp;</span></span>
														<span class="normal-text">
														${goods.user_id }
														</span>
													</div>
													<div class="normal-item clearfix">
														<span class="normal-text">
														<c:forEach items="${goods.categoriesList }" var="category" varStatus="status">
														${category.category_name }
														</c:forEach></span>
														</span>
													</div>
													<div class="f_right red price">
														<span class="pre_price">￥${goods.pre_price } </span>
														<span class="rel_price">￥${goods.rel_price }</span>
													</div>
													<div class="book-scores">
														<span>评分:</span>
														<span>${goods.scores }</span>
													</div>
												</div>
												<div class="sales">
													<span class="normal-title">&nbsp;销量<span>:&nbsp;</span></span>
													<span class="normal-text">${goods.sales}</span>
												</div>
												<%-- <span class="book-details" style="width: 400px;height: 90px;border: black;white-space:normal;display:block;margin-left:270px;">
													图书简介:<br>${book.details_path }
												</span> --%>
											</div>
										</div>
									</div>
									</c:forEach>
									  
								</div>
								<!--搜索结果列表结束-->
								<!--分页开始-->
								<div class="pager">
									<div id="pagerBox" class="pager-box clearfix">
										<a href="goodssearch?pn=1&type=${requestScope.goodssearch.goodsType}&word=${requestScope.goodssearch.searchWord}">首页</a>
										<a href="goodssearch?pn=${pageInfo.prePage}&type=${requestScope.goodssearch.goodsType}&word="${requestScope.goodssearch.searchWord}" class="item-page">上一页</a>
										<%-- <a href='javascript:;' class='item-page active' page='1'>1</a>
										<a href='javascript:;' class='item-page' page='2'>2</a>
										<c:forEach items="${pageInfo.navigatepageNums}" var ="pageNum">
											<a href="selectAll?pn=${pageNum}" class="item-page">${pageNum}</a>
										</c:forEach> --%>
										<a href="goodssearch?pn=${pageInfo.nextPage}&type=${requestScope.goodssearch.goodsType}&word=${requestScope.goodssearch.searchWord}" class="next-btn">下一页</a>
										<span class="go-page-box">
                                    <span>到第</span>
										<input type="text" class="go-num">
										<span>页</span>
										<span class="go-btn">确定</span>
										</span>
									</div>
								</div>
								<!--分页结束-->
							</div>
							<div id="resultNoneBox" class="result-none hide">
								<div class="text">没有找到符合条件的商品</div>
								<div class="text">
									<a href="javascript:history.go(-1)">返回上一步</a>
								</div>
							</div>
						</div>
						<!--右侧广告信息开始-->
						<div class="search-main-ad">

						</div>
						<!--右侧广告信息结束-->
						<!--搜索主区域结束-->
					</div>
					
					<!--左侧搜索结果信息结束-->
				</div>
				<!--搜索结果主区域结束-->
			</div>
			<!--搜索结果展示结束-->
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
		<!--底部结束-->

		<!--模板开始-->
		<!--顶部搜索框下拉模板-->
		<script id="status-tpl" type="text/x-dot-template">
			<div class="cur-status {{= it.curStatus.type != 'key'?'striking':''}}" type="{{= it.curStatus.type}}">
				<span>{{= it.curStatus.text}}</span>
				<span class="iconfont icon-xiala"></span>
				<span class="iconfont icon-shangshou"></span>
			</div>
			<div class="status-other">
				{{~ it.otherStatusList :item:index}} {{? item.type != it.curStatus.type}}
				<div class="item" type="{{= item.type}}">{{= item.text}}</div>
				{{?}} {{~}}
			</div>
		</script>
		<!--搜索建议模板-->
		<script id="search-sug-tpl" type="text/x-dot-template">
			{{~it.sugWords :item:index}}
			<div class="sug-item">{{= item}}</div>
			{{~}}
		</script>
		<!--搜索历史记录模板-->
		<script id="history-of-search-tpl" type="text/x-dot-template">
			<div class="title">搜索历史</div>
			{{~it.list :item:index}}
			<div class="sug-item blue">
				<span class="clear-btn">删除</span>
				<span class="text">{{= item}}</span>
			</div>
			{{~}}
		</script>
		<!--筛选项模板-->
		<script id="filter-tpl" type="text/x-dot-template">
			<div class="title">筛选:&nbsp;</div>
			{{~it.filterList :item:index}} {{? !(it.status == '1' && item.name == 'shopname')}}
			<div class="filter-item normal-filter">
				<a href="javascript:;" class="one-level-polymerization bold cursor-default">{{! item.title }}</a>
				{{? item.backStatus == '1'}}
				<a href="javascript:;" class="one-level-polymerization shrink back-link" name="{{! item.name}}" type="back">
					<span class="iconfont icon-zuo"></span>
					<span>所有</span>
				</a>
				{{~item.parent :parentItem:parentIndex}}
				<a href="javascript:;" class="one-level-polymerization shrink back-link" title="{{! parentItem.name }}" name="{{= item.name}}" type="link" code="{{= parentItem.code}}">
					<span class="iconfont icon-zuo"></span> {{? item.name == 'years'}} {{? /民国\d/g.test(parentItem.name)}}
					<span>{{! parentItem.name}}</span> {{??}}
					<span>{{! parentItem.name.replace(/\([^\(]*\)$/g,'')}}</span> {{?}} {{??}}
					<span>{{! parentItem.name}}</span> {{?}}
				</a>
				{{~}} {{? item.self.hasLeaf && item.self.hasLeaf > 0}}
				<a href="javascript:;" class="one-level-polymerization shrink bold cursor-default" title="{{! item.self.name }}">
					{{? item.name == 'years'}} {{? /民国\d/g.test(item.self.name)}}
					<span>{{! item.self.name}}</span> {{??}}
					<span>{{! item.self.name.replace(/\([^\(]*\)$/g,'')}}</span> {{?}} {{??}}
					<span>{{! item.self.name }}</span> {{?}}
				</a>
				{{?}} {{?}} {{~item.value :valueItem:valueIndex}} {{? valueItem.active == '1'}}
				<a href="javascript:;" class="two-level-polymerization show bold cursor-default" title="{{! valueItem.name }}">
					{{? item.name == 'years'}} {{? /民国\d/g.test(valueItem.name)}}
					<span>{{! valueItem.name}}</span> {{??}}
					<span>{{! valueItem.name.replace(/\([^\(]*\)$/g,'')}}</span> {{?}} {{??}}
					<span>{{! valueItem.name }}</span> {{?}}
				</a>
				{{??}}
				<a href="javascript:;" class="two-level-polymerization show" title="{{! valueItem.name }}" name="{{= item.name}}" type="link" code="{{= valueItem.code}}">
					{{? item.name == 'years'}} {{? /民国\d/g.test(valueItem.name)}}
					<span>{{! valueItem.name}}</span> {{??}}
					<span>{{! valueItem.name.replace(/\([^\(]*\)$/g,'')}}</span> {{?}} {{??}}
					<span>{{! valueItem.name }}</span> {{?}}
					<span class="text-block num">(<span>{{= valueItem.num }}</span>)</span>
				</a>
				{{?}} {{~}} {{? item.more}}
				<a href="{{! window.document.location.href+'&lookMore='+item.more }}" target="_blank" class="two-level-polymerization more show">
					<span class="ico-plus">+</span>
					<span>查看更多</span>
				</a>
				{{?}} {{? (item.name == 'years' || item.name == 'pubdate') && item.userDefined == '1'}}
				<div id="timeBox" class="time-input-box">
					<div class="time-input-group">
						<div class="f_left">
							<input type="text" class="input-year-txt grayb" name="startYear" maxlength="4" autocomplete="off" value="年" title="如：1912">
						</div>
						<div class="f_left">
							<input type="text" class="input-month-txt grayb" name="startMonth" maxlength="2" autocomplete="off" value="月" title="如：01，1，12">
						</div>
						<div class="input-split">-</div>
						<div class="f_left">
							<input type="text" class="input-year-txt grayb" name="endYear" maxlength="4" autocomplete="off" value="年" title="如：1912">
						</div>
						<div class="f_left">
							<input type="text" class="input-month-txt grayb" name="endMonth" maxlength="2" autocomplete="off" value="月" title="如：01，1，12">
						</div>
					</div>
					<div class="time-input-btn">
						<div class="btn">精确筛选</div>
					</div>
				</div>
				{{?}} {{? item.name == 'quality' && item.userDefined == '1'}}
				<div id="qualityBox" class="quality-select-box">
					<div class="quality-select-group clearfix">
						<div class="select-box" name="startQuality">
							<div class="cur-select">
								<div class="name default" quality="normal">品相</div>
								<span class="iconfont icon-xiala"></span>
								<span class="iconfont icon-shangshou"></span>
							</div>
							<div class="select-list">
								<div class="item" quality="40">四品</div>
								<div class="item" quality="50">五品</div>
								<div class="item" quality="60">六品</div>
								<div class="item" quality="70">七品</div>
								<div class="item" quality="80">八品</div>
								<div class="item" quality="90">九品</div>
								<div class="item" quality="95">九五品</div>
							</div>
						</div>
						<div class="select-split">-</div>
						<div class="select-box" name="endQuality">
							<div class="cur-select">
								<div class="name default" quality="normal">品相</div>
								<span class="iconfont icon-xiala"></span>
								<span class="iconfont icon-shangshou"></span>
							</div>
							<div class="select-list">
								<div class="item" quality="40">四品</div>
								<div class="item" quality="50">五品</div>
								<div class="item" quality="60">六品</div>
								<div class="item" quality="70">七品</div>
								<div class="item" quality="80">八品</div>
								<div class="item" quality="90">九品</div>
								<div class="item" quality="95">九五品</div>
							</div>
						</div>
					</div>
					<div class="quality-select-btn">
						<div class="btn">精确筛选</div>
					</div>
				</div>
				{{?}}
			</div>
			{{?}} {{~}}
		</script>
		<!--isbn模板-->
		<script id="isbn-tpl" type="text/x-dot-template">
			{{~ it.data.itemList :item:index}}
			<div class="item">
				<a class="link-box" href="{{= it.site.item + 'goods/' + item.goodsid + '.html'}}" target="_blank">
					{{? item.bookname}}
					<span class="text link">{{! item.goodsname}}{{! item.subtitle?':&nbsp;' + item.subtitle:''}}</span> {{?}} {{? item.author}}
					<span class="text">
            <span>{{! item.author}}</span>
					</span>
					{{?}} {{? item.press}}
					<span class="text">
            {{? item.author}}
            <span class="text-split">/</span> {{?}}
					<span>{{! item.press}}</span>
					</span>
					{{?}} {{? item.pubdate}}
					<span class="text">
            {{? item.author || item.press}}
            <span class="text-split">/</span> {{?}}
					<span>{{! item.pubdate}}</span>
					</span>
					{{?}} {{? item.binding}}
					<span class="text">
            {{? item.author || item.press || item.binding}}
            <span class="text-split">/</span> {{?}}
					<span>{{! item.binding}}</span>
					</span>
					{{?}} {{? item.prodnum}}
					<span class="text">
            <span>({{! item.prodnum}})</span>
					</span>
					{{?}}
				</a>
			</div>
			{{~}}
			<div class="item more">
				<a class="link-box" href="/item_result/{{= it.more }}">
					<span class="text link">查看全部<span>{{= it.other.total_found}}</span>个条目</span>
				</a>
			</div>
		</script>
		<!--列表单项模板-->
		<script id="list-tpl" type="text/x-dot-template">
			{{~it.itemList :item:index }}
			<div class="item clearfix" shopid="{{= item.shopid}}" itemid="{{= item.itemid}}" userid="{{= item.userid}}">
				<div class="item-img">
					{{? item.smallimgurl}}
					<a class="img-box" href="{{= it.site.book + item.shopid + '/' + item.itemid + '/' }}" target="_blank">
						<img src="{{! item.smallimgurl}}" alt="{{! item.itemname_snippet}}" error="0">
					</a>
					<div class="big-img-box">
						<img class="big-img loading" src="/searchfront/img/kfz-loading.gif" _src="{{! item.bigimgurl}}" error="0">
					</div>
					{{??}}
					<a class="img-box" href="{{= it.site.book + item.shopid + '/' + item.itemid + '/' }}" target="_blank">
						<img src="/searchfront/img/error.jpg" error="1">
					</a>
					{{?}}
				</div>
				<div class="item-info">
					<div class="title">
						<a class="link" href="{{= it.site.book + item.shopid + '/' + item.itemid + '/' }}" target="_blank">{{= item.itemname_snippet}}
						</a>
					</div>
					{{? item.importantdesc_snippet }}
					<div class="recommend">{{= item.importantdesc_snippet}}</div>
					{{?}} {{? item.isrelatedisbn == "1" }}
					<div class="zl-isbn-info">
						{{? item.author_snippet}}
						<span class="text">{{= item.author_snippet}}</span> {{??}}
						<span class="text">不详</span> {{?}} {{? item.press_snippet}}
						<span class="text">/ {{= item.press_snippet}} </span> {{?}} {{? item.pubdate}}
						<span class="text">/ {{! item.pubdate}} </span> {{?}} {{? item.bindingname}}
						<span class="text">/ {{! item.bindingname}} </span> {{?}}
					</div>
					{{??}}
					<div class="zl-normal-info clearfix">
						<div class="f_left">
							{{~item.zl1 :item_zl1:index_zl1 }}
							<div class="normal-item clearfix">
								<span class="normal-title">{{! item_zl1.name}}<span>:&nbsp;</span></span>
								<span class="normal-text">{{= item_zl1.value}}</span>
							</div>
							{{~}}
						</div>
						<div class="f_right">
							{{~item.zl2 :item_zl2:index_zl2 }}
							<div class="normal-item clearfix">
								<span class="normal-title">{{! item_zl2.name}}<span>:&nbsp;</span></span>
								<span class="normal-text">{{= item_zl2.value}}</span>
							</div>
							{{~}}
						</div>
					</div>
					{{?}}
					<div class="info-bottom-box">
						{{? it.status != '1'}}
						<div class="user-info">
							<div class="text">
								{{? item.biztype == 1}}
								<a class="user-info-link" href="{{=  it.site.shop + item.shopid}}" target="_blank">
									<span>{{! item.shopname}}</span>
								</a>
								{{??}}
								<a class="user-info-link" href="{{=  it.site.shop + item.shopid}}" target="_blank">
									<span class="iconfont icon-shutan"></span>
									<span>{{! item.shopname}}</span>
								</a>
								{{?}}
								<a href="{{=  it.site.xinyu + 'seller/' + item.userid + '/'}}" target="_blank" class="lv{{= item.class}}"></a>
							</div>
							{{? item.areaname}}
							<div class="text user-place">{{! item.areaname}}</div>
							{{?}}
							<div class="text">
								<a class="user-info-link" href="{{= it.site.user + item.userid}}" target="_blank">{{! item.nickname}}
								</a>
								<span class="iconfont icon-jiaotanliuyan imNotice-message off-line" type="talk" userid="{{= item.userid}}"></span>
							</div>
						</div>
						{{?}}
						<div class="holiday-info-box"></div>
						<div class="warn-info-box"></div>
					</div>
				</div>
				<div class="item-other-info">
					<div class="first-info clearfix">
						{{? item.qualityname == '全新'}}
						<div class="quality new">{{! item.qualityname}}</div>
						{{??}}
						<div class="quality gray3">{{! item.qualityname}}</div>
						{{?}}
						<div class="f_right red price"><span>￥</span><span class="bold">{{= item.price}}</span></div>
					</div>
					{{? it.status == '1'}}
					<div class="ship-fee-box">
						<div class="ship-fee gray6">
							{{? item.updatetime}}
							<span>{{= item.updatetime}} 已售</span> {{??}}
							<span>早于2007年 已售</span> {{?}}
						</div>
					</div>
					{{??}}
					<div class="ship-fee-box"></div>
					{{? false && item.promise != '0'}}
					<div class="activity" style="display:block;">
						{{? item.promise == '1'}}
						<span class="text" name="卖家保真" title="卖家保真">卖家保真</span> {{?}} {{? item.promise == '2'}}
						<span class="text" name="买家自鉴" title="买家自鉴">买家自鉴</span> {{?}} {{? item.promise == '3'}}
						<span class="text" name="近代仿品" title="近代仿品">近代仿品</span> {{?}} {{? item.promise == '4'}}
						<span class="text" name="工艺品" title="工艺品">工艺品</span> {{?}}
					</div>
					{{??}}
					<div class="activity"></div>
					{{?}} {{? item.addtime }}
					<div class="add-time-box">
						<span>{{= item.addtime }}</span>
						<span>上书</span>
					</div>
					{{?}} {{?}}
				</div>
				{{? it.status != '1'}}
				<div class="btns-group clearfix" shopid="{{= item.shopid }}" itemid="{{= item.itemid }}">
					<div class="add-cart-btn">加入购物车</div>
					<div class="collection-btn">
						<span>收藏</span>
					</div>
					<div class="suc-tip">
						<span class="iconfont icon-chenggong1"></span>
						<span class="suc-text"></span>
					</div>
					<div class="err-tip">
						<span class="err-text"></span>
					</div>
				</div>
				{{?}}
			</div>
			{{~}}
		</script>
		<!--holiday模板-->
		<script id="holiday-tpl" type="text/x-dot-template">
			<div class="holiday-info">
				<span class="iconfont icon-maijiaqingjia"></span>
				<span class="text">{{= it.name }}</span>
			</div>
		</script>
		<!--warn模板-->
		<script id="warn-tpl" type="text/x-dot-template">
			<div class="warn-info">
				<span class="iconfont icon-jinggao"></span>
				<span class="text">{{= it.name }}</span>
			</div>
		</script>
		<!--活动文字模板-->
		<script id="activity-text-tpl" type="text/x-dot-template">
			<span class="text" name="{{= it.name }}" title="{{= it.title }}">{{= it.nameText }}</span>
		</script>
		<!--活动图标模板-->
		<script id="activity-icon-tpl" type="text/x-dot-template">
			<span class="iconfont {{= it.icon}}" name="{{= it.name }}" title="{{= it.title }}"></span>
		</script>
		<!--分页模板-->
		<script id="pager-tpl" type="text/x-dot-template">
			{{? it.countpage > 1 }} {{? it.countpage > 2 }} {{? it.curpage == 1 }}
			<!--    <a href="javascript:;" class="prev-btn disabled">上一页</a>-->
			{{??}}
			<a href="javascript:;" class="prev-btn">上一页</a>
			{{?}} {{?}} {{~it.pagerItems :item:index }} {{? item.type == 'page'}} {{? item.active == '1'}}
			<a href="javascript:;" class="item-page active" page="{{= item.text}}">{{= item.text}}</a>
			{{??}}
			<a href="javascript:;" class="item-page" page="{{= item.text}}">{{= item.text}}</a>
			{{?}} {{?}} {{? item.type == 'ellipsis'}}
			<a href="javascript:;" class="page-ellipsis" page="{{= item.text}}">{{= item.text}}</a>
			{{?}} {{~}} {{? it.countpage > 2 }} {{? it.curpage == it.countpage }}
			<!--    <a href="javascript:;" class="next-btn disabled">下一页</a>-->
			{{??}}
			<a href="javascript:;" class="next-btn">下一页</a>
			{{?}} {{? it.hasEllipsis }}
			<span class="go-page-box">
        <span>到第</span>
			<input type="text" class="go-num">
			<span>页</span>
			<span class="go-btn">确定</span>
			</span>
			{{?}} {{?}} {{?}}
		</script>
		<!--模板结束-->

		<script>
			window.KFZ || (window.KFZ = {});
			window.KFZ.ajaxFlag = {
				"promotionShippingFee": 1,
				"holiday": 1,
				"lastLoginStatus": 1
			};
			if(typeof JSON !== 'object') {
				JSON = {};
			}
			(function() {
				'use strict';

				function f(n) {
					// Format integers to have at least two digits.
					return n < 10 ? '0' + n : n;
				}

				if(typeof Date.prototype.toJSON !== 'function') {
					Date.prototype.toJSON = function() {
						return isFinite(this.valueOf()) ?
							this.getUTCFullYear() + '-' +
							f(this.getUTCMonth() + 1) + '-' +
							f(this.getUTCDate()) + 'T' +
							f(this.getUTCHours()) + ':' +
							f(this.getUTCMinutes()) + ':' +
							f(this.getUTCSeconds()) + 'Z' :
							null;
					};
					String.prototype.toJSON =
						Number.prototype.toJSON =
						Boolean.prototype.toJSON = function() {
							return this.valueOf();
						};
				}

				var cx,
					escapable,
					gap,
					indent,
					meta,
					rep;

				function quote(string) {
					escapable.lastIndex = 0;
					return escapable.test(string) ? '"' + string.replace(escapable, function(a) {
						var c = meta[a];
						return typeof c === 'string' ?
							c :
							'\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
					}) + '"' : '"' + string + '"';
				}

				function str(key, holder) {
					var i, // The loop counter.
						k, // The member key.
						v, // The member value.
						length,
						mind = gap,
						partial,
						value = holder[key];
					if(value && typeof value === 'object' &&
						typeof value.toJSON === 'function') {
						value = value.toJSON(key);
					}
					if(typeof rep === 'function') {
						value = rep.call(holder, key, value);
					}
					switch(typeof value) {
						case 'string':
							return quote(value);
						case 'number':
							return isFinite(value) ? String(value) : 'null';
						case 'boolean':
						case 'null':
							return String(value);
						case 'object':
							if(!value) {
								return 'null';
							}
							gap += indent;
							partial = [];
							if(Object.prototype.toString.apply(value) === '[object Array]') {
								length = value.length;
								for(i = 0; i < length; i += 1) {
									partial[i] = str(i, value) || 'null';
								}
								v = partial.length === 0 ?
									'[]' :
									gap ?
									'[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' :
									'[' + partial.join(',') + ']';
								gap = mind;
								return v;
							}
							if(rep && typeof rep === 'object') {
								length = rep.length;
								for(i = 0; i < length; i += 1) {
									if(typeof rep[i] === 'string') {
										k = rep[i];
										v = str(k, value);
										if(v) {
											partial.push(quote(k) + (gap ? ': ' : ':') + v);
										}
									}
								}
							} else {
								for(k in value) {
									if(Object.prototype.hasOwnProperty.call(value, k)) {
										v = str(k, value);
										if(v) {
											partial.push(quote(k) + (gap ? ': ' : ':') + v);
										}
									}
								}
							}
							v = partial.length === 0 ?
								'{}' :
								gap ?
								'{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' :
								'{' + partial.join(',') + '}';
							gap = mind;
							return v;
					}
				}

				if(typeof JSON.stringify !== 'function') {
					escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
					meta = { // table of character substitutions
						'\b': '\\b',
						'\t': '\\t',
						'\n': '\\n',
						'\f': '\\f',
						'\r': '\\r',
						'"': '\\"',
						'\\': '\\\\'
					};
					JSON.stringify = function(value, replacer, space) {
						var i;
						gap = '';
						indent = '';
						if(typeof space === 'number') {
							for(i = 0; i < space; i += 1) {
								indent += ' ';
							}
						} else if(typeof space === 'string') {
							indent = space;
						}
						rep = replacer;
						if(replacer && typeof replacer !== 'function' &&
							(typeof replacer !== 'object' ||
								typeof replacer.length !== 'number')) {
							throw new Error('JSON.stringify');
						}
						return str('', {
							'': value
						});
					};
				}
				if(typeof JSON.parse !== 'function') {
					cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
					JSON.parse = function(text, reviver) {
						var j;

						function walk(holder, key) {
							var k, v, value = holder[key];
							if(value && typeof value === 'object') {
								for(k in value) {
									if(Object.prototype.hasOwnProperty.call(value, k)) {
										v = walk(value, k);
										if(v !== undefined) {
											value[k] = v;
										} else {
											delete value[k];
										}
									}
								}
							}
							return reviver.call(holder, key, value);
						}

						text = String(text);
						cx.lastIndex = 0;
						if(cx.test(text)) {
							text = text.replace(cx, function(a) {
								return '\\u' +
									('0000' + a.charCodeAt(0).toString(16)).slice(-4);
							});
						}
						if(/^[\],:{}\s]*$/
							.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
								.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
								.replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
							j = eval('(' + text + ')');
							return typeof reviver === 'function' ?
								walk({
									'': j
								}, '') :
								j;
						}
						throw new SyntaxError('JSON.parse');
					};
				}
			}());
		</script>
		<script src="js/book_search.js"></script>
	</body>

</html>