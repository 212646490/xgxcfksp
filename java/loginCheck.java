import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginCheck extend HttpServlet{
	//定义数据库驱动
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	//数据库连接地址
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String DBUSER = "xgxc_jc";//数据库用户名
	public static final String DBPASS = "manager12";//数据库密码

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		this.doPost(request,response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html");//设置回应的MIME
		Connection conn = null;//声明数据库连接对象
		PreparedStatement pstmt = null;//声明数据库操作
		ResultSet rs = null;//声明数据库结果集
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		//JDBC操作会抛出异常，使用try...catch 处理
		try{
			Class.forName(DBDRIVER);//加载驱动程序
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);//取得数据库连接
			//编写要使用的 sql 语句，验证用户信息
			String sql = "select yhmc from dbxt_yh where yhbh = ? and yhkl = ?";
			pstmt = conn.prepareStatement(sql);//实例化数据库操作对象
			pstmt.setString(1,username);//设置 查询参数
			pstmt.setString(2,password);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getint(1)>0){
					out.print("true");
				}else{
					out.print("false");
				}
			}
			out.close();
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
	}
}