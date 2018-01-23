<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="./resource/plugins/layui/css/layui.css" media="all">
</head>

<body style="margin:15px;">
    <h3>先看着代码哇，文档后面有时间再写(或者，谁愿意帮我写？)..</h3>
    <pre class="layui-code">
            //处理顶部一级菜单
            var onelevel = layui.onelevel;
            if (onelevel.hasElem()) {
                onelevel.set({
                    remote: {
                        url: '/datas/onelevel1.json' //远程地址
                    },
                    onClicked: function(id) {
                        switch (id) {
                        case 1:
                            navbar.set({
                                remote:
                                {
                                    url:
                                    '/datas/navbar1.json'
                                }
                            }).render(function(data) {
                                tab.tabAdd(data);
                            });
                            break;
                        case 2:
                            navbar.set({
                                remote:
                                {
                                    url:
                                    '/datas/navbar2.json'
                                }
                            }).render(function(data) {
                                tab.tabAdd(data);
                            });
                            break;
                        default:
                            navbar.set({
                                data:
                                [{
                                    id:
                                    "1",
                                    title: "基本元素",
                                    icon: "fa-cubes",
                                    spread: true,
                                    children: [{
                                        id: "7",
                                        title: "表格",
                                        icon: "&#xe6c6;",
                                        url: "test.jsp"
                                    },
                                    {
                                        id: "8",
                                        title: "表单",
                                        icon: "&#xe63c;",
                                        url: "form.jsp"
                                    }]
                                },
                                {
                                    id: "5",
                                    title: "这是一级导航",
                                    icon: "fa-stop-circle",
                                    url: "https://www.baidu.com",
                                    spread: false
                                }]
                            }).render(function(data) {
                                tab.tabAdd(data);
                            });
                            break;
                        }
                    }
                }).render();
            }</pre>
</body>

</html>