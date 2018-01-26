<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>


 




<link rel="stylesheet" type="text/css" href="resource/css/index.css" />
<script src="resource/plugins/layui/layui.js"></script>
 
<script>
layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	});
</script>






<script type="text/javascript" src="resource/js/js1.js" /></script>
<!--轮播js-->
<script type="text/javascript" src="resource/js/jquery.js" /></script>

</head>


<body>
<!-- 引入导航 -->
<%@ include file="comm-nav.jsp" %>

	<!--轮播代码	-->
	<div class="banner" id="banner">

		<a href="#" class="d1" id="img2"
			style="background: url(resource/img/Slides-3.jpg) center no-repeat #028DC3;"></a>
		<a href="#" class="d1" id="img3"
			style="background: url(resource/img/Slides-6.jpg) center no-repeat #0E99AE;"></a>
		<a href="#" class="d1" id="img1"
			style="background: url(resource/img/Slides-1.jpg) center no-repeat #4C2865;"></a>

		<div class="d2" id="banner_id">
			<!--点-->
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		banner()
	</script>



	<!--work-->
	<div class="workq">
		<div class="box1">
			<img id="tit" src="resource/img/worktit.png" />
			<ul class="work_img">
				<li><a href="anli.jsp"><img src="resource/img/workimg.jpg" /></a></li>
				<li><a href="anli.jsp"><img src="resource/img/working2.jpg" /></a></li>
				<li><a href="anli.jsp"><img src="resource/img/working4.jpg" /></a></li>
				<li><a href="anli.jsp"><img src="resource/img/working4.jpg" /></a></li>
			</ul>
		</div>
	</div>

	<!--about us-->
	<div class="as1">
		<div class="as2">
			<div class="as_left">
				<p>天忢工作室成立于2017年1月， 一直专注于互联网品牌建设，我们团队 的成员曾服务于国内优秀互联网公司，
					业务类型涉及WEB视觉、交互设计、程 序开发及电子消费类产品等。</p>
			</div>

			<div class="as_right">
				<a class="a1" href="server.jsp"><img id="as1"
					onMouseOver="nav(this)" onMouseOut="nav1(this)"
					src="resource/img/as_img11.png" /></a> <a class="a2" href="server.jsp"><img
					id="as2" onMouseOver="nav(this)" onMouseOut="nav1(this)"
					src="resource/img/as_img21.png" /></a> <a class="a2" href="server.jsp"><img
					id="as3" onMouseOver="nav(this)" onMouseOut="nav1(this)"
					src="resource/img/as_img31.png" /></a> <a class="a2" href="server.jsp"><img
					id="as4" onMouseOver="nav(this)" onMouseOut="nav1(this)"
					src="resource/img/as_img41.png" /></a>

			</div>

		</div>
	</div>

	<div class="xwq">
		<div class="xw">
			<img class="xw_img" src="resource/img/lb.gif" />
			<div class="xw1">
				<a href="xinwen.jsp">
					<div class="xw1_img">
						<img class="" src="resource/img/xw_img1.jpg" />
					</div>

					<div class="xw1_p">
						<p>网站整合</p>
						<p></p>
					</div>
				</a>
			</div>

			<div class="xw2">
				<a href="xinwenziyemian.jsp">
					<div class="xw1_img">
						<img class="" src="resource/img/working5.jpg" />
					</div>

					<div class="xw1_p">
						<p>在win10下配置sql2005允许远程访问</p>
						<p></p>
					</div>
				</a>
			</div>
		</div>
	</div>



	<!--底部开始-->
		<!-- 引入底部 -->
<%@ include file="comm-foot.jsp" %>
	<!--底部结束-->




</body>
</html>