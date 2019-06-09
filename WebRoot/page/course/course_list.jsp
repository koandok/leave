<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>课程信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 用户列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="page/course/course_add.jsp"> 添加用户</a> </li>
        <li>搜索：</li>
       
       <form method="post" action="page/course/course_list.jsp" id="icon-search">
          <li> <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         <input type="submit" value="搜索"name="搜索" class="button border-main icon-search" onclick="changesearch()" ></li></form>
     </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>课程编号</th>
				<th>班号</th>
				<th>课程名称</th>
				<th>学年</th>
				<th>学期</th>
				<th>学时</th>
				<th>操作</th>
      </tr>
       <%--读取所有用户信息记录 --%>
       <%
       //1.设置编码方式
       request.setCharacterEncoding("utf-8");
       //2.接受参数
       String keywords=request.getParameter("keywords");
       //3.查询数据库记录
      //3.1 加载驱动 
      Connection conn=getConn();
      ResultSet rs=null;
      PreparedStatement pstmt=null;
      //3.2 由给定Connection类型的对象conn执行SQL指令PreparedStatement类型的对象pstmt
      if(keywords!=null){
	  String sql="select * from sys_course where courseID like '%"+keywords+"%' or courseName like '%"+keywords+"%' ";

      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery();
      }
      else{
      String sql="select * from sys_course where 1=1";
      pstmt=conn.prepareStatement(sql);
      //3.3 preparedstatement类型的对象pstmt执行SQL语句并返回结果
      rs=pstmt.executeQuery();
      }
      //4.定义序号变量
      int index=1;
      while(rs.next()){
      String courseID=rs.getString("courseID");
      String classID=rs.getString("classID");
      String courseName=rs.getString("courseName");
      String year=rs.getString("year");
      String term=rs.getString("term");
      String hour=rs.getString("hour");
      
      
        %>	
        	<tr>
				<td><%=index++%></td>
				<td><%=courseID%></td>
				<td><%=classID%></td>
				<td><%=courseName%></td>
				<td><%=year%></td>
				<td><%=term%></td>
				<td><%=hour%></td>
				<td>
				<div class="button-group"> <a class="button border-main" href="<%=path%>/page/course/course_update.jsp?courseID=<%=courseID%>"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="<%=path%>/page/course/action_course_del.jsp?courseID=<%=courseID%>" ><span class="icon-trash-o"></span> 删除</a> </div>
				</td>
			</tr>
			<%
				}
			%>
    </table>
  </div>
  <div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div>
</form>
</body>
</html>
        
        

