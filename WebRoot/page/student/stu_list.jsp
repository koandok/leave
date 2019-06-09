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
<title>学生信息列表</title>
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
        <li> <a class="button border-main icon-plus-square-o" href="page/student/stu_add.jsp"> 添加用户</a> </li>
        <li>搜索：</li>
       
       <form method="post" action="page/student/stu_list.jsp" id="icon-search">
          <li> <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         <input type="submit" value="搜索"name="搜索" class="button border-main icon-search" onclick="changesearch()" ></li></form>
     </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>学号</th>
				<th>班号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>通讯地址</th>
				<th>学生电话</th>
				<th>联系人</th>
				<th>联系人电话</th>
				<th>密码</th>
				<th>操作</th>
      </tr>
      

				
			<%--读取所有用户信息记录 --%>
			<%  //设置编码方式
			    request.setCharacterEncoding("utf-8");
			    //接收参数
                String keywords=request.getParameter("keywords");

				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				ResultSet rs = null;
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
				if(keywords != null){
				StringBuffer sqlBuff = new StringBuffer();
				sqlBuff.append("select * from sys_student where stuID like'%"+keywords+"%' or stuName like'%"+keywords+"%'");			
				String sql = sqlBuff.toString();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				rs = pstmt.executeQuery();}
				else{				StringBuffer sqlBuff = new StringBuffer();
				sqlBuff.append("select * from sys_student where 1=1");
				String sql = sqlBuff.toString();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				rs = pstmt.executeQuery();}
				//定义int序号变量
				int index = 1;
				while (rs.next()) {
					String stuID = rs.getString("stuID");
					String classID = rs.getString("classID");
					String stuName = rs.getString("stuName");
					String sex = rs.getString("sex");
					String address = rs.getString("address");
					String stuTel = rs.getString("stuTel");
					String contact = rs.getString("contact");
					String contactTel = rs.getString("contactTel");
					String password = rs.getString("password");
			%>

			<tr>
				<td><%=index++%></td>
				<td><%=stuID%></td>
				<td><%=classID%></td>
				<td><%=stuName%></td>
				<td><%=sex%></td>
				<td><%=address%></td>
				<td><%=stuTel%></td>
				<td><%=contact%></td>
				<td><%=contactTel%></td>
				<td><%=password%></td>
				<td>
				<div class="button-group"> <a class="button border-main" href="<%=path%>/page/student/stu_update.jsp?stuID=<%=stuID%>"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="<%=path%>/page/student/action_stu_del.jsp?stuID=<%=stuID%>" ><span class="icon-trash-o"></span> 删除</a> </div>
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
