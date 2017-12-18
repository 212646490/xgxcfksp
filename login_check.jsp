<%@page language="java" import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="utf-8" />
        <title>登录验证</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
    </head>
    <body>
    	<%!
	    	//定义数据库驱动
	    	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	    	//数据库连接地址
	    	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	    	public static final String DBUSER = "xgxc_jc";//数据库用户名
	    	public static final String DBPASS = "manager12";//数据库密码
    	%>
    	<%
    		Connection conn = null;//声明数据库连接对象
    		PreparedStatement pstmt = null;//声明数据库操作
    		ResultSet rs = null;//声明数据库结果集
    		boolean flag = false;//定义标志位
    		String name = null;//接收用户的真实姓名
    	%>
    	<%
    		//JDBC操作会抛出异常，使用try...catch 处理
    		try{
    			Class.forName(DBDRIVER);//加载驱动程序
    			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);//取得数据库连接
    			//编写要使用的 sql 语句，验证用户信息
    			String sql = "select yhmc from dbxt_yh where yhbh = ? and yhkl = ?";
    			pstmt = conn.prepareStatement(sql);//实例化数据库操作对象
    			pstmt.setString(1,request.getParameter("username"));//设置 查询参数
    			pstmt.setString(2,request.getParameter("password"));
    			rs = pstmt.executeQuery();
    			if(rs.next()){
    				name = rs.getString(1);

    				flag = true;
    			}
    		}catch(Exception e){
    			System.out.println(e);
    		}finally{
    			try{
    				rs.close();//关闭查询对象
    				pstmt.close();//关闭操作对象
    				conn.close();//关闭数据库连接
    			}catch(Exception e){
    			}
    		}
    	%>
    	<%
    		if(!flag){//登陆成功，跳转到成功页
    			PrintWriter out1 = response.getWriter();
				out1.print("error");
			}
    	%>

 	</body>
</html>