<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加用户过程--%>
<%
   //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
   //2:接收参数
      String courseID =request.getParameter("courseID");
      String classID  =request.getParameter("classID");
      String courseName =request.getParameter("courseName");
      String year  =request.getParameter("year");
      String term =request.getParameter("term");
      String hour  =request.getParameter("hour");
  //3.构造插入SQL
      String sql="insert into sys_course(courseID,classID,courseName,year,term,hour)values(?,?,?,?,?,?)";
  //4:保存到数据库
  //4.1 加载驱动
 				Connection conn = null;
				Statement statem = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			conn = getConn();
				pstmt=conn.prepareStatement(sql);
    //依次设置动态参数对应的值
       int parameterIndex=1;
       pstmt.setString(parameterIndex++, courseID);
       pstmt.setString(parameterIndex++, classID);
       pstmt.setString(parameterIndex++, courseName);
       pstmt.setString(parameterIndex++, year);
       pstmt.setString(parameterIndex++, term);
       pstmt.setString(parameterIndex++, hour);
  //2.4:PrepareStatement类型的对象pstmt执行SQL语句并返回结果
       int c=pstmt.executeUpdate();
  //2.5:关闭数据资源,注意关闭的顺序pstmt<conn
       if(pstmt!=null){
         pstmt.close();
        }
       if(conn!=null){
         conn.close();
        }
  //3:跳转到用户列表页面
	//process(request, response, "course_list.jsp");
  	response.sendRedirect("course_list.jsp");

%>