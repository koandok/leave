<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp"%>
<%--添加用户的过程 --%>

 <%  //1:取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
     //2:接收参数
      String stuID =request.getParameter("stuID");
      String classID  =request.getParameter("classID");
      String stuName =request.getParameter("stuName");
      String sex  =request.getParameter("sex");
      String address =request.getParameter("address");
      String stuTel  =request.getParameter("stuTel");
      String contact  =request.getParameter("contact");
      String contactTel =request.getParameter("contactTel");
      String password  =request.getParameter("password");
     //3:构造插入SQL
     String sql="insert into sys_student(stuID,classID,stuName,sex,address,stuTel,contact,contactTel,password)values(?,?,?,?,?,?,?,?,?)";
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
       pstmt.setString(parameterIndex++, stuID);
       pstmt.setString(parameterIndex++, classID);
       pstmt.setString(parameterIndex++, stuName);
       pstmt.setString(parameterIndex++, sex);
       pstmt.setString(parameterIndex++, address);
       pstmt.setString(parameterIndex++, stuTel);
       pstmt.setString(parameterIndex++, contact);
       pstmt.setString(parameterIndex++, contactTel);
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
  //3:跳转到用户列表页面(user_list.jsp)
	//process(request, response, "course_list.jsp");
  	response.sendRedirect("stu_list.jsp");
%>
