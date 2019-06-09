<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

<%--删除处理过程 --%>
  
<%/*//参数传递方式：表单传值(form)和URL传值（<a href="url?param=xxx&param=yyy"></a>）
     //1. 接受参数-request
     String depID=request.getParameter("depID");
   
     //2.处理请求-执行DELETE SQL语句
         //定义构造DELETE SQL语句的字符串变量sql

     String sql="delete from sys_department where depID=?";
     
     //3.连接数据库对象conn
     Connection conn=getConn();
     
     //4.由给定的数据库conn创建 执行动态参数的SQL语句的PrepareStatement 对象pstmt
     PreparedStatement pstmt=conn.prepareStatement(sql);
     
     //5.设置动态参数对应的值
     int prepareIntex=1;
     pstmt.setString(prepareIntex,depID);
      
      //6.pstmt 执行SQL语句并返回执行结果
      int c = pstmt.executeUpdate();
      
      //7.关闭数据库资源，并销毁对象，注意关闭顺序ResultSet<PreparedStatement<Connection;
      close(pstmt,conn);
      
      //8.跳转页面-重定向或者转发
         //proccess(request,respone,"xueyuan_list.jsp")
      response.sendRedirect("xueyuan_list.jsp");*/


 //参数传递方式:表单传值(form)和URL传值(<a href="url?param=xxx&param2=yyyy"></a>)
 //1:接收参数-request
  String depID=request.getParameter("depID");
 //2:处理请求-执行DELETE SQL语句
 //定义构造DELETE SQL语句的字符串变量sql
   String sql="delete from sys_department where depID=?";
 //2.1连接数据库对象conn
   Connection conn=getConn();
 //2.2由给定的连接对象conn创建执带行动态参数的SQL语句的PrepareStatement对象pstmt
   PreparedStatement pstmt=conn.prepareStatement(sql);
 //2.3设定动态参数对应的值
  int parameterIndex=1;
  pstmt.setString(parameterIndex, depID);
 //2.4pstmt执行SQL语句并返回执行结果
  int count=pstmt.executeUpdate();
 //2.5 关闭数据库资源，非销毁对象,注意关闭顺序ResultSet<Statement<Connection
   close(pstmt, conn);
 //3:跳转页面-重定向或者转发
 // process(request, response, "dep_list.jsp");
  	  	response.sendRedirect("xueyuan_list.jsp");

%>
      


