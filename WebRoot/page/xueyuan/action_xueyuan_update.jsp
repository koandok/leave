<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"  %>
<%@ include file="/base/database.jsp" %>

<%--修改处理过程 --%>>
<%
  //1.取出请求参数之前的编码方式设置请求的编码方式
  request.setCharacterEncoding("utf-8");  
  //2.接受参数
  
  String depID1=(String)session.getAttribute("depID");
  String depID =request.getParameter("depID");
  String depName=request.getParameter("depName");
  
  //3.插入构造SQL
  String sql="update sys_department set depID=?,depName=? WHERE depID='"+depID1+"'";
  
  //4.保存到数据库
  //4.1 加载驱动（连接数据库）
  Connection conn=null;
  Statement statem=null;
  ResultSet rs=null;
  PreparedStatement pstmt=null;
  conn=getConn();
  pstmt=conn.prepareStatement(sql);
  //4.2依次设置动态参数对应的值
  int parameterIntex=1;
  pstmt.setString(parameterIntex++,depID);
  pstmt.setString(parameterIntex++,depName);
  //4.3 PreparedStatement类型的对象pstmt执行SQL语句并返回结果
  pstmt.execute();
  //4.4 关闭数据资源，注意关闭顺序pstmt<conn;
  if(pstmt!=null){
  pstmt.close();
  }
  if(conn!=null){
  conn.close();
  }
  
  //跳转到用户列表页面
  //process(request,respone,"xueyuan_list.jsp")
 response.sendRedirect("xueyuan_list.jsp");
  
  

%>

