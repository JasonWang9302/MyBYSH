<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link rel="stylesheet" type="text/css" href="css/anli2.css"/>

  <!--轮播js-->
<script type="text/javascript" src="js/jquery.js"/></script>
<script type="text/javascript">
function banner(){	
	var bn_id = 0;
	var bn_id2= 1;
	var speed33=2376;
	var qhjg = 1;
    var MyMar33;
	$("#banner .d1").hide();
	$("#banner .d1").eq(0).fadeIn("slow");
	if($("#banner .d1").length>1)
	{
		$("#banner_id li").eq(0).addClass("nuw");
		function Marquee33(){
			bn_id2 = bn_id+1;
			if(bn_id2>$("#banner .d1").length-1)
			{
				bn_id2 = 0;
			}
			$("#banner .d1").eq(bn_id).css("z-index","2");
			$("#banner .d1").eq(bn_id2).css("z-index","1");
			$("#banner .d1").eq(bn_id2).show();
			$("#banner .d1").eq(bn_id).fadeOut("slow");
			$("#banner_id li").removeClass("nuw");
			$("#banner_id li").eq(bn_id2).addClass("nuw");
			bn_id=bn_id2;
		};
	
		MyMar33=setInterval(Marquee33,speed33);
		
		$("#banner_id li").click(function(){
			var bn_id3 = $("#banner_id li").index(this);
			if(bn_id3!=bn_id&&qhjg==1)
			{
				qhjg = 0;
				$("#banner .d1").eq(bn_id).css("z-index","2");
				$("#banner .d1").eq(bn_id3).css("z-index","1");
				$("#banner .d1").eq(bn_id3).show();
				$("#banner .d1").eq(bn_id).fadeOut("slow",function(){qhjg = 1;});
				$("#banner_id li").removeClass("nuw");
				$("#banner_id li").eq(bn_id3).addClass("nuw");
				bn_id=bn_id3;
			}
		})
		$("#banner_id").hover(
			function(){
				clearInterval(MyMar33);
			}
			,
			function(){
				MyMar33=setInterval(Marquee33,speed33);
			}
		)	
	}
	else
	{
		$("#banner_id").hide();
	}
}
</script>


<!--轮播区样式-->
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

/* banner */
.banner{height:600px;width:100%;overflow:hidden;}
/*.banner .d1{width:100%;height:600px;display:block;top:80px;}*/
.banner .d1{width:100%;height:600px;display:block;position:absolute;left:0px;top:80px;}
/*点的div*/


.banner .d2{width:100%;height:30px;clear:both;position:absolute;z-index:100;left:630px;top:640px;}
.banner .d2 ul{margin:0 auto;display:inline;}
.banner .d2 li{width:17px;height:15px;overflow:hidden;cursor:pointer;background:url(img/img1.png) no-repeat center;float:left;margin:0 3px;display:inline;}
.banner .d2 li.nuw{background:url(img/img1_1.png) no-repeat center;}
</style>








<!--/*新加*/-->
<script type="text/javascript">


//姓名的验证
//
//function xmyz1(xm){
//	 var ts=document.getElementById('we');
//	   if(xm.value=="您的姓名"){
//	   	xm.value="";
//	   }
//	    if(ts.innerHTML=="请输入您的中文名"||ts.innerHTML=='您的名字有点长'||ts.innerHTML=='您的名字有点短';){
//	    	 ts.innerHTML='';
//	    	 xm.value="";
//	    }
//	
//}

 function xmyz(xm){
// 	 if(xm.value=='') {xm.value='您的姓名'}
//		  else if{
// 	         if(!(/^[\u4e00-\u9fa5]{2,4}$/).test(xm.value)){  
//           if(!/^[\u4e00-\u9fa5]+$/.test(xm.value)){
//	             ts.innerHTML='请输入您的中文名';
//              }
//            if(xm.value.length>4){  
//        	   ts.innerHTML='您的名字有点长';
//              }
//             if(xm.value.length<2){  
//        	    ts.innerHTML='您的名字有点短';
//      }
//     }
// }
//		else 
//	return true;
//
}


//手机号
	function dhyz1(dh){	
//	    var ts=document.getElementById('we');
//	    if(ts.innerHTML!=null||dh=='您的电话'){
//	    	dh.value='';
//	    	ts.innerHTML=''; 

  var ts=document.getElementById('we');
	   if(dh.value=="您的电话"){
	   	dh.value="";
	   }
	    if(ts.innerHTML=="请输入正确的手机号"){
	    	 ts.innerHTML='';
	    	 	dh.value="";
	    }

//	}
}

	function dhyz(dh){
		 if(dh.value=='')
		 {dh.value='您的电话'}
		  else{
		  var re=/^(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/ ;   
		 if(!re.test(dh.value))
		 {  var ts=document.getElementById('we');
		 	ts.innerHTML="请输入正确的手机号";  
		 	return false;   
		 }
	}
	}
	
	
	
//验证邮箱
function yzyx1(yx){	
	    var ts=document.getElementById('we');
	   if(yx.value=="您的邮箱"){
	   	yx.value="";
	   }
	    if(ts.innerHTML=="您输入的邮箱格式不正确"){
	    	 ts.innerHTML='';
	    	 	yx.value="";
	    }
	}
	
function yzyx(yx){
     if(yx.value=='')
		 {
		 	yx.value='您的邮箱';
		 }
     else{
		  var re=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;   
		 if(!re.test(yx.value))
		 {  var ts=document.getElementById('we');
		 	ts.innerHTML="您输入的邮箱格式不正确";  
		 }
} 
}
	

//提交验证
function tjyz(){
	var xm=document.getElementById('xm').value;
	var dh=document.getElementById('dh').value;
	var yx=document.getElementById('yx').value;
	var xq=document.getElementById('xq').value;
	alert("验证通过，您填写的手机是："+dh+"，邮箱是："+yx);	
}
</script>
<style type="text/css">

     .divimg{
     width: 1000px;
     margin: 20px auto;
     
     }


   	
</style>

<script type="text/javascript">
	function nav(imgid){
		switch(imgid){
			case navimg1: imgid.src="img/navimg_12.png";
			           break;
		    case navimg2: imgid.src="img/navimg_22.png";
			           break;
		    case navimg3: imgid.src="img/navimg_32.png";
			           break;
		    case navimg4: imgid.src="img/navimg_42.png";
			           break;
			case navimg5: imgid.src="img/navimg_52.png";
			           break;
		    case navimg6: imgid.src="img/navimg_62.png";
			           break;
			
		}
		
		
		
	}
	
	function nav1(imgid){
		switch(imgid){
			case navimg1: imgid.src="img/navimg_12.png";
			           break;
		    case navimg2: imgid.src="img/navimg_21.png";
			           break;
		    case navimg3: imgid.src="img/navimg_31.png";
			           break;
		    case navimg4: imgid.src="img/navimg_41.png";
			           break;
			case navimg5: imgid.src="img/navimg_51.png";
			           break;
		    case navimg6: imgid.src="img/navimg_61.png";
			           break;
			
		}
	
	}
	function nav2(){
		navimg1.src="img/navimg_12.png";
			           
	}
	function nav3(){
		navimg1.src="img/navimg_11.png";
			           
	}
	
</script>

</head>




<body>
<!-- 引入导航 -->
<%@ include file="comm-nav.jsp" %>
	
	
<!--	content开始-->
<div id ="div1"></div>


<div class="anli_conten">

<div id="div2" class="news" >
	<img src="img/anli_tu1.jpg"/>
     <p class="myclass" >&nbsp;&nbsp;斯坦达特国际货运代理有限公司</p></br>
     <p ><font  color="#727272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日期：2017-01-09 </p></font>
     <p><font  color="#727272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;标签：公司 </p></font>
     <p><font  color="#727272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;阅读：3 </p></font></br>
     <font  color="#727272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;地址：http://www.xklgmj.com</font></br >
     <font  color="#727272">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;公司标语: &nbsp;&nbsp;高瞻远瞩&nbsp;&nbsp; &nbsp;领航未来&nbsp;&nbsp;与时俱进&nbsp;&nbsp;争创一流</font>
</div>



<div class="divimg"><img src="img/anlitu2.jpg"/></div>

<div class="divimg"><img src="img/anlitu3.png"/> </div>


<div class="divimg">
	
    <form>
      <a class="forma" href="anli.html"><input type="button" value="上一篇" ></a> 
     <a  class="forma" href=""><input type="button" value="下一篇" ></a> 
    </form>
    </div>

</div>
<!--	content结束-->






<!--底部开始-->
	<!-- 引入底部 -->
<%@ include file="comm-foot.jsp" %>
<!--底部结束-->




</body>
</html>