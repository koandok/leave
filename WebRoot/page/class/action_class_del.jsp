<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

<%--删除班级处理过程 --%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
 //参数传递方式:表单传值(form)和URL传值(<a href="url?param=xxx&param2=yyyy"></a>)
 //1:接收参数-request
  String classID=request.getParameter("classID");
 //2:处理请求-执行DELETE SQL语句
 //定义构造DELETE SQL语句的字符串变量sql
   String sql="delete from sys_classes where classID=?";
 //2.1连接数据库对象conn
 try{
   conn=getConn();
 //2.2由给定的连接对象conn创建执带行动态参数的SQL语句的PrepareStatement对象pstmt
   pstmt=conn.prepareStatement(sql);
 //2.3设定动态参数对应的值
  int parameterIndex=1;
  pstmt.setString(parameterIndex, classID);
 //2.4pstmt执行SQL语句并返回执行结果
  int count=pstmt.executeUpdate();}catch(SQLException e){
  throw e;
  }finally{
 //2.5 关闭数据库资源，非销毁对象,注意关闭顺序ResultSet<Statement<Connection
   close(pstmt, conn);}
 //3:跳转页面-重定向或者转发
 // process(request, response, "class_list.jsp");
  	response.sendRedirect("class_list.jsp");

%>
