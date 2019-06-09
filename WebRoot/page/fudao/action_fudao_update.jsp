<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

<% 
//1.取出请求参数值之前设置请求的编码方式
request.setCharacterEncoding("utf-8");
//2.接受参数
String instID1=(String)session.getAttribute("instID");
String depID=request.getParameter("depID");
String instName=request.getParameter("instName");
String instID=request.getParameter("instID");
String telephone=request.getParameter("telephone");
String password=request.getParameter("password");
//3.构造插入SQL
String sql="update sys_instructor set instID=?,instName=?,depID=?,telephone=?,password=? WHERE instID='"+instID1+"' ";
//4.保存到数据库
//4.1 加载驱动
Connection conn=null;
Statement statem=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
conn=getConn();
pstmt=conn.prepareStatement(sql);
//4.2 设置动态参数对应的值
int parameterIndex=1;
pstmt.setString(parameterIndex++,instID);
pstmt.setString(parameterIndex++,instName);
pstmt.setString(parameterIndex++,depID);
pstmt.setString(parameterIndex++,telephone);
pstmt.setString(parameterIndex++,password);
//4.3 preparedStatement类型的对象pstmt执行SQL语句并返回结果
pstmt.execute();
//5.关闭数据资源，注意关闭顺序pstmt<conn;
if(pstmt!=null){
pstmt.close();
}
if(pstmt!=null){
conn.close();
}
//6.跳转到用户列表界面
//process(request,response,"fudao_list.jsp");
response.sendRedirect("fudao_list.jsp");
%>




