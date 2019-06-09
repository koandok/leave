<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%


   				Connection conn = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				
			
	  //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
      //1:接收参数	  
      String className =request.getParameter("className");
      String depID  =request.getParameter("depID");
      String major =request.getParameter("major");
      String grade  =request.getParameter("grade");      
      String classID  =request.getParameter("classID");  
      String sql = "update sys_classes set  className=? , depID=?, major=?, grade=? WHERE classID='"+classID+"' ";
      try{
      //打开数据库
      conn = getConn();
      pstmt=conn.prepareStatement(sql);

    //依次设置动态参数对应的值
       int parameterIndex=1;
   	   
       pstmt.setString(parameterIndex++, className);
	   pstmt.setString(parameterIndex++, depID);
       pstmt.setString(parameterIndex++, major);   	   
       pstmt.setString(parameterIndex++, grade);
     
  //2.4:PrepareStatement类型的对象pstmt执行SQL语句并返回结果
       pstmt.execute();}//返回Boolean，表示有无ResultSet返回
       catch(SQLException e){
       process(request, response, "class_update.jsp");
       throw e;
       }finally{
       close(pstmt,conn);
       }
  
  //3:跳转到用户列表页面
	//process(request, response, "class_list.jsp");
	response.sendRedirect("class_list.jsp");
 %>