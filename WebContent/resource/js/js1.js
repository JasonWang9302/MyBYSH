	function banner(){	
	var bn_id = 0;
	var bn_id2= 1;
	var speed33=3500;
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
	
	
	
	
	
	function nav(imgid){
		switch(imgid){
//			导航
			case navimg1: imgid.src="resource/img/navimg_12.png";
			           break;
		    case navimg2: imgid.src="resource/img/navimg_22.png";
			           break;
		    case navimg3: imgid.src="resource/img/navimg_32.png";
			           break;
		    case navimg4: imgid.src="resource/img/navimg_42.png";
			           break;
			case navimg5: imgid.src="resource/img/navimg_52.png";
			           break;
		    case navimg6: imgid.src="resource/img/navimg_62.png";
			           break;	
			           
			           
//			 首页as原图片链接
            case as1: imgid.src="resource/img/as_img12.png";
			           break;
		    case as2: imgid.src="resource/img/as_img22.png";
			           break;
		    case as3: imgid.src="resource/img/as_img32.png";
			           break;
		    case as4: imgid.src="resource/img/as_img42.png";
			           break;
			
					
			/* ser页*/
			
			  case s1: imgid.src="resource/img/8.png";
			           break;
			case s2: imgid.src="resource/img/8.png";
			           break;
		    case s3: imgid.src="resource/img/8.png";
			           break;
		  case s4: imgid.src="resource/img/8.png";
			           break;
			
			
			
			           
		}
	
	}
	
	function nav1(imgid){
		switch(imgid){
			case navimg1: imgid.src="resource/img/navimg_11.png";
			           break;
		    case navimg2: imgid.src="resource/img/navimg_21.png";
			           break;
		    case navimg3: imgid.src="resource/img/navimg_31.png";
			           break;
		    case navimg4: imgid.src="resource/img/navimg_41.png";
			           break;
			case navimg5: imgid.src="resource/img/navimg_51.png";
			           break;
		    case navimg6: imgid.src="resource/img/navimg_61.png";
			           break;
			           
			           
			//			 首页as原图片链接
            case as1: imgid.src="resource/img/as_img11.png";
			           break;
		    case as2: imgid.src="resource/img/as_img21.png";
			           break;
		    case as3: imgid.src="resource/img/as_img31.png";
			           break;
		    case as4: imgid.src="resource/img/as_img41.png";
			           break;       
			           
			//ser页           
	      	case s1: imgid.src="resource/img/9.JPG";
			           break;
			 case s2: imgid.src="resource/img/9.JPG";
			           break;
		     case s3: imgid.src="resource/img/9.JPG";
			           break;
		     case s4: imgid.src="resource/img/9.JPG";
			           break;	           
			           
		}
	
	}
	function nav2(){
		navimg1.src="resource/img/navimg_12.png";
	}
	function nav3(){
		navimg1.src="resource/img/navimg_11.png";
			           
	}
	




function xmyz1(xm){
	var ts=document.getElementById('we');
	   if(xm.value=="您的姓名"){
	   	xm.value="";
	   }
    else if(ts.innerHTML=="请输入您的中文名"||ts.innerHTML=="您的名字有点长"||ts.innerHTML=="您的名字有点短"){
	    	 ts.innerHTML='';
	    	 xm.value="";
	    }
	
}

	
	//验证姓名 
    function xmyz(xm){
    	var ts=document.getElementById('we');
		 if(xm.value=='')
		 {xm.value='您的姓名'}
		  else{
		      var re=/^[\u4e00-\u9fa5]+$/;
		       if(!re.test(xm.value))
		       {  
		 	    ts.innerHTML="请输入您的中文名";  
		      }
	         else if(xm.value.length>4){
	       	   ts.innerHTML="您的名字有点长";  
	          }
	         else if(xm.value.length==1){
		  	 ts.innerHTML="您的名字有点短";  
		       }
		       
	}
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
	var ts=document.getElementById('we');
	
	if(ts.innerHTML==""){
	alert("验证通过，"+xm+"您好,您填写的手机是："+dh+",邮箱是："+yx+",随后我们的工作人员将与您取得联系");	
	}
	else{
		alert("请先修正您的信息");	
	}
}