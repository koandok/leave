<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp"%>

<%
//1.取出请求参数值之前设置请求编码方式
 request.setCharacterEncoding("utf-8");
 //2.接受参数
 String userid=request.getParameter("userid");
 String fullname=request.getParameter("fullname");
 String password=request.getParameter("password");
 String telephone=request.getParameter("telephone");
 //3.插入构造SQL
 //String sql="insert into sys_user(userid,password,fullname,telephone) values(?,?,?,?)"
 String sql="Update sys_user set fullname=?, password=? ,telephone=? WHERE userid=?";
 //4.保存到数据库
 //4.1 加载驱动
 Connection conn=null;
 Statement state=null;
 ResultSet rs=null;
 PreparedStatement pstmt=null;
 conn=getConn();
 pstmt=conn.prepareStatement(sql);
 //5，依次设置动态参数对应的值
 int ParameterIndex=1;

 pstmt.setString(ParameterIndex++,fullname);
 pstmt.setString(ParameterIndex++,password);
 pstmt.setString(ParameterIndex++,telephone);
  pstmt.setString(ParameterIndex++,userid);
 //6.PreparedStatement类型的对象pstmt执行sql语句并返回结果
pstmt.execute();
 //7.关闭数据资源，注意关闭顺序pstmt<conn
 if(pstmt!=null){
 pstmt.close();
 }
 if(conn!=null){
 conn.close();
 }
 //8.跳转到用户列表界面
 response.sendRedirect(path+"/denglu.jsp");
 
 

 
 
 %>