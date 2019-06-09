<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<!-- 删除用户处理过程 -->

<%
    //1.接受请求参数-request
    String instID=request.getParameter("instID");
    //2.处理请求
    //2.1 定义构造DELETE SQL语句 
    String sql="delete  from sys_instructor WHERE instID=?";
    //3 连接数据库对象conn
    Connection conn=getConn();
    //4.由给定的连接对象conn创建执行动态参数的SQL语句PreparedStatement对象pstmt
    PreparedStatement  pstmt=conn.prepareStatement(sql);
    //5.设置动态对应参数
    int parameterIndex=1;
    pstmt.setString(parameterIndex,instID);
    //6.pstmt执行SQL语句并返回执行结果
    int count=pstmt.executeUpdate();
    //2.5 关闭数据库资源，非销毁对象,注意关闭顺序ResultSet<Statement<Connection
    close(pstmt, conn);
    //3:跳转页面-重定向或者转发
    process(request, response, "fudao_list.jsp");

%>
  

