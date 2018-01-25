<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--底部开始-->
<div class="footer">
	<div class="footer_content">
		
		<div class="footConLeft"> 
		  <div class="lxfs">
		  	<img src="resource/img/footer_03.gif"/><br />
           <span id="">您可以通过以下方式联系我们，或在页面右侧给我们留言	
           </span>
           <img src="resource/img/sjh.jpg"/> <br />
           <span id="">
           	我们的工作时间 : 08:00-20:00 <br />
                        邮箱 :<a href="mailto:1475893925@qq.com">1475893925@qq.com </a><br />
                        网址 : http://www.tianwu.com
           </span>
		  </div>
		
		<div class="ewm">
			<img src="resource/img/ewm.png"/>
		</div>
		
		</div>
<!--	改变                                                                                                                                                              上线-->
		<div class="footConRight"> 
		<form class="form1">
			<input type="text" name="" id="xm" onfocus="xmyz1(xm);" onblur="xmyz(xm);" id="mingzi"  class="name1 input" value="您的姓名" />
			<input type="text" name="" id="dh" onfocus="dhyz1(dh);" onblur="dhyz(dh);" class="phone1 input" value="您的电话" /><br>
			<input type="text" name="" id="yx" onfocus="yzyx1(yx)" onblur="yzyx(yx);" class="mail1 input" value="您的邮箱" /><br>
			<textarea name="" id="xq"  onfocus="if(this.value=='您的需求'){this.value=''}" onblur="if(this.value==''){this.value='您的需求'}"  class="textarea" />您的需求</textarea><br>
		
		<span id="we"></span>
		<input id="tj" type="button" onclick="tjyz();" class="tjan" value="提交需求"/>
		</form>
		</div>
	</div>
</div>
<!--	改变                                                                                                                                                                    下线-->
<!--底部结束-->


</body>
</html>