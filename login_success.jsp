<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8" />
        <title>登录成功</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
    </head>
    <body>
    	<center>
    		<h1>登录操作</h1>
    		<hr>
    		<h2>登录成功</h2>
			<%request.setCharacterEncoding("GBK");%>
    		<h2>欢迎<font color="red"><%=request.getParameter("uname")%></font>光临</h2>
    	</center>
 	</body>
</html>