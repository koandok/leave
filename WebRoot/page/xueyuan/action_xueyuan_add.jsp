<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include  file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

<%--添加学院的过程 --%>

<%
//1.取出请求参数之前设置请求的编码方式
request.setCharacterEncoding("utf-8");
//2.接受参数
String depID=request.getParameter("depID");
String depName=request.getParameter("depName");
//3.构造插入SQL
String sql="insert into sys_department(depID,depName) values(?,?)";
//4.保存到数据库
//4.1 加载驱动(连接数据库)
Connection conn=null;
Statement statem=null;
ResultSet rs=null;
PreparedStatement pstmt=null;
conn=getConn();
pstmt=conn.prepareStatement(sql);
//4.2 依次设置动态参数对应
int ParameterIndex =1;
pstmt.setString(ParameterIndex++,depID);
pstmt.setString(ParameterIndex++,depName);
//4.3 Preparestatement类型的对象pstmt执行SQL语句并返回结果
int c=pstmt.executeUpdate();
//4.4 关闭数据库，注意关闭顺序pstmt<conn
if(pstmt!=null)

{
pstmt.close();}
if(conn!=null)
{
conn.close();}

//5:跳转到用户列表页面(user_list.jsp)
	    //process(request, response, "/page/xueyuan_list.jsp");
  	  	response.sendRedirect("xueyuan_list.jsp");
%>

