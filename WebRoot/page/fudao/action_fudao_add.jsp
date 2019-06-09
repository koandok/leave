<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
 <% 
 //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
  //1:接收参数
      String instID =request.getParameter("instID");
      String instName  =request.getParameter("instName");
      String depID =request.getParameter("depID");
      String telephone  =request.getParameter("telephone");
      String password  =request.getParameter("password");
  //构造插入SQL

   String sql="insert into sys_instructor(instID,instName,depID,telephone,password)values(?,?,?,?,?)";
  //2:保存到数据库
  //2.1 加载驱动
 				Connection conn = null;
				Statement statem = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			conn = getConn();
				pstmt=conn.prepareStatement(sql);
    //依次设置动态参数对应的值
       int parameterIndex=1;
       pstmt.setString(parameterIndex++, instID);
       pstmt.setString(parameterIndex++, instName);
 	   pstmt.setString(parameterIndex++, depID);
       pstmt.setString(parameterIndex++, telephone);
       pstmt.setString(parameterIndex++, password);
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
	//process(request, response, "/page/fudao/fudao_list.jsp");
	response.sendRedirect("fudao_list.jsp");
  

%>