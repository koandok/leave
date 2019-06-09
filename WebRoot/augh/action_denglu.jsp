<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/database.jsp"%>
<%@ include file="/base/base.jsp" %>

<%
//texxttttt
   //取出请求参数值之前设置请求的编码方式
       request.setCharacterEncoding("utf-8");
       
   //得到request参数
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String user = request.getParameter("xq");
	
	//在request对象中加入名为name的属性并附值为刚刚得到request参数的name
	session.setAttribute("name",name);
	
	//定义SQL语句
	String sqluser = "select * from sys_user where userid='"+name+"' and password='"+password+"'";//查询管理员表的ID和密码
	String sqlstuedent = "select * from sys_student where stuID='"+name+"' and password='"+password+"'";//查询学生表的ID和密码
	String sqlinstructor = "select * from sys_instructor where instID='"+name+"' and password='"+password+"'";//查询辅导员表的ID和密码
	
	//声明对象
    Connection conn = null;        //声明Connection对象conn
	ResultSet rs = null;           //声明ResultSet对象rs
	PreparedStatement pstmt = null;//声明PreparedStatement对象pstmt
	
	try{
	//打开数据库链接
    conn = getConn();
    
    //判断用户权限
	if(user.equals("A")){
	pstmt = conn.prepareStatement(sqlstuedent);
	rs=pstmt.executeQuery(sqlstuedent);//使用executeQuery()方法执行SELECT语句，该方法返回值为ResultSet类型
	if(rs.next()){//遍历结果集。
	process(request, response, "/index_stu.jsp");
   	}else{
   	process(request, response, "/denglu.jsp");
 	}
	}
	
	
	else if(user.equals("B")){
	pstmt = conn.prepareStatement(sqlinstructor);
	rs=pstmt.executeQuery(sqlinstructor);
	if(rs.next()){
		process(request, response, "/index_fudao.jsp");
   	}else{
   	process(request, response, "/denglu.jsp");
 	}
	}
	
	
	else if(user.equals("C")){
	pstmt = conn.prepareStatement(sqluser);
	rs=pstmt.executeQuery(sqluser);
	if(rs.next()){
		process(request, response, "/index_user.jsp");
   	}else{
   	process(request, response, "/denglu.jsp");
 	}
	}
	
	
	}catch(SQLException e){
	throw e;
	}finally{
	close(rs,pstmt,conn);
	}

	
	

%>
