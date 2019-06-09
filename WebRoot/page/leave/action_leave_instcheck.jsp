<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%

  //构造插入SQL
   //String sql = "insert into sys_user(userid,fullname,password,telephone)values(?,?,?,?)";   

  //2:保存到数据库
  //2.1 加载驱动
   				Connection conn = null;
				Statement statem = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			conn = getConn();
			
				   //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
  //1:接收参数
  

  	  String status = null ;
	  String leaveID  =request.getParameter("leaveID");
      String opinion  =request.getParameter("opinion");
	  String submit1  =request.getParameter("submit1");
	  String submit2  =request.getParameter("submit2");
	  String submit3  =request.getParameter("submit3");

	  Date t = new Date();
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");


		String audittime = df.format(t);     
	  if("同意".equals(submit1)){
	   status = "1";	  
	  }else if("不同意".equals(submit2)){
	   status = "2";
	  }else if("取消".equals(submit3)){
	   status = "0";
	  }
	  out.print(submit1);
	  out.print(submit2);
	  out.print(submit3);
	  out.print(status);
     String sql = "update sys_leave set status=?, opinion=? ,audittime=? WHERE leaveID='"+leaveID+"' ";
      pstmt=conn.prepareStatement(sql);

    //依次设置动态参数对应的值
    int parameterIndex=1; 	   
       pstmt.setString(parameterIndex++, status);
       pstmt.setString(parameterIndex++, opinion);
       pstmt.setString(parameterIndex++, audittime);
  //2.4:PrepareStatement类型的对象pstmt执行SQL语句并返回结果
       pstmt.execute();
  //2.5:关闭数据资源,注意关闭的顺序pstmt<conn
       if(pstmt!=null){
         pstmt.close();
        }
       if(conn!=null){
         conn.close();
        }
  //3:跳转到用户列表页面(user_list.jsp)
	process(request, response, "leave_instcheck_list.jsp");
	
 %>
