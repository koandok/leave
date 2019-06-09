<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%--添加课程过程处理--%>
<%
   //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
   //2:接收参数
      String classID =request.getParameter("classID");
      String className =request.getParameter("className");
      String depID =request.getParameter("depID");
      String major  =request.getParameter("major");
      String grade=request.getParameter("grade");
       //3.构造插入SQL
      String sql="insert into sys_classes(classID,className,depID,major,grade)values(?,?,?,?,?)";
  //4.加载驱动
 				Connection conn = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			
    			try{
    			conn = getConn();
				pstmt=conn.prepareStatement(sql);
    //依次设置动态参数对应的值
       int parameterIndex=1;
       pstmt.setString(parameterIndex++, classID);
       pstmt.setString(parameterIndex++, className);
       pstmt.setString(parameterIndex++, depID);
       pstmt.setString(parameterIndex++, major);
       pstmt.setString(parameterIndex++, grade);
      
  //2.4:PrepareStatement类型的对象pstmt执行SQL语句并返回结果
       int c=pstmt.executeUpdate();}//返回int类型，表示执行了sql语句后被影响到的行数
       catch(SQLException e){
       process(request, response, "class_add.jsp");
       throw e;
       }finally{
       close(rs,pstmt,conn);
       }
  //3:跳转到用户列表页面
	//process(request, response, "class_list.jsp");
  	response.sendRedirect("class_list.jsp");


%>