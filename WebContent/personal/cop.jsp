<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Navbar组件</title>
    <link rel="stylesheet" href="./resource/plugins/layui/css/layui.css" media="all">
</head>

<body style="margin:15px;">
    <a href="javascript:;" class="layui-btn" data-title="编辑一" data-url="edit1.html" data-icon="fa-edit" data-id="1"><i class="fa fa-edit" aria-hidden="true"></i> 编辑一</a>
    <a href="javascript:;" class="layui-btn" data-title="编辑二" data-url="edit2.html" data-icon="fa-edit" data-id="2"><i class="fa fa-edit" aria-hidden="true"></i> 编辑二</a>

    <script src="./resource/plugins/layui/layui.js"></script>
    <script>
        layui.use(['layer'], function() {
            var layer = layui.layer,
                $ = layui.jquery;

            var tab = parent.tab;

            $('a').off('click').on('click', function() {
                var _that = $(this),
                    _data = {
                        title: _that.data('title'),
                        icon: _that.data('icon'),
                        id: _that.data('id'),
                        url: _that.data('url')
                    };
                tab.tabAdd(_data);
            });
        });
    </script>
</body>

</html>