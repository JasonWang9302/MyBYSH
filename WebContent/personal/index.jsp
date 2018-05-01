<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入基路径设置(内包括layui) -->
<%@ include file="basepath.jsp" %>


    <title>个人中心</title>

</head>

<body>
    <div class="layui-layout layui-layout-admin kit-layout-admin">
        
        
<!--  最上面那一栏 -->
        <div class="layui-header">
            <div class="layui-logo">个人中心</div>
            <div class="layui-logo kit-logo-mobile">K</div>
            <ul class="layui-nav layui-layout-left kit-nav">
                <li class="layui-nav-item"><a href="index">首页</a></li>
                <li class="layui-nav-item"><a href="project-toPublish">发布项目</a></li>
            </ul>
            <ul class="layui-nav layui-layout-right kit-nav">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <!-- <img src="" class="layui-nav-img"> --> 当前用户：${session.currUser.userName}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">基本资料</a></dd>
                        <dd><a href="javascript:;">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="user-logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a></li>
            </ul>
        </div>





        <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><!-- <i class="fa fa-navicon" aria-hidden="true" >&#xe60f;</i> --><i class="layui-icon" style="font-size: 30px; color: #b3b4b7">&#xe65f;</i>  </div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                    
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span> 账号管理</span></a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" kit-target data-options="{url:'user-showMyInfo',icon:'&#xe658;',title:'我的信息',id:'12'}"><i class="layui-icon">&#xe658;</i><span>我的信息</span></a>
                            </dd>
                        </dl>
                    </li>
					
					
					<!-- 我的发布 -->
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>我的发布</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'project-showMyPublishDSH',icon:'&#xe658;',title:'待审核',id:'1'}"><i class="layui-icon">&#xe658;</i><span>待审核</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdfb-zbz.jsp',icon:'&#xe658;',title:'招标中',id:'2'}"><i class="layui-icon">&#xe658;</i><span>招标中</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdfb-dks.jsp',icon:'&#xe658;',title:'待开始',id:'3'}"><i class="layui-icon">&#xe658;</i><span>待开始</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdfb-jxz.jsp',icon:'&#xe658;',title:'进行中',id:'11'}"><i class="layui-icon">&#xe658;</i><span>进行中</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdfb-dys.jsp',icon:'&#xe658;',title:'待验收',id:'4'}"><i class="layui-icon">&#xe658;</i><span>待验收</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdfb-ywc.jsp',icon:'&#xe658;',title:'已完成',id:'5'}"><i class="layui-icon">&#xe658;</i><span>已完成</span></a></dd>
                        </dl>
                    </li>
					
					
					
			       <!-- 	我的任务 -->
					  <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>我的任务</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdrw-tbz.jsp',icon:'&#xe658;',title:'投标中',id:'6'}"><i class="layui-icon">&#xe658;</i><span>投标中</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdrw-dks.jsp',icon:'&#xe658;',title:'待开始',id:'7'}"><i class="layui-icon">&#xe658;</i><span>待开始</span></a></dd>
							<dd><a href="javascript:;" kit-target data-options="{url:'personal/wdrw-jxz.jsp',icon:'&#xe658;',title:'进行中',id:'8'}"><i class="layui-icon">&#xe658;</i><span>进行中</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdrw-djs.jsp',icon:'&#xe658;',title:'待结算',id:'9'}"><i class="layui-icon">&#xe658;</i><span>待结算</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'personal/wdrw-ywc.jsp',icon:'&#xe658;',title:'已完成',id:'10'}"><i class="layui-icon">&#xe658;</i><span>已完成</span></a></dd>
                        </dl>
                      </li>
                      
					  
					
					
					 <%-- <li class="layui-nav-item">
                         <a href="javascript:;" kit-target data-options="{url:'personal/ddd.jsp',icon:'&#xe658;',title:'Ddd',id:'111'}"><i class="layui-icon">&#xe658;</i><span>留言板</span></a>
				     </li> --%>
					
										
                  
                </ul>
            </div>
        </div>
        
        
        <div class="layui-body" id="container">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">主体内容加载中,请稍等...</div>
        </div>



        <div class="layui-footer">
            <!-- 底部固定区域 -->
            2018 &copy;
            <a href="">软件众包平台个人中心/</a> WPC license
        </div>
        
    </div>
    <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1264021086'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1264021086%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
    </script>
   
    <script>
        var message;
        layui.config({
            base: 'resource/build/js/'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
            $('#pay').on('click', function() {
                layer.open({
                    title: false,
                    type: 1,
                    content: '<img src="resource/build/images/pay.png" />',
                    area: ['500px', '250px'],
                    shadeClose: true
                });
            });
        });
    </script>
</body>

</html>