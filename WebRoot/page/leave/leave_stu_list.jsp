<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>请假信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 请假列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="page\leave\leave_add.jsp"> 添加用户</a> </li>
        <li>搜索：</li>
       
       <form method="most" action="/page/leave/leave_stu_list.jsp" id="icon-search">
          <li> <input type="text"  placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         <input type="submit" value="搜索" class="button border-main icon-search"  ></li></form>
     </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
       <th>序号</th>
				<th>请假编号</th>
				<th>课程编号</th>
				<th>请假事由</th>
				<th>天数</th>
				<th>学号</th>
				<th>请假时间</th>
				<th>状态</th>
				<th>审核时间</th>
				<th>审核意见</th>
				<th>操作</th>
      </tr>
      
      <%--读取所有用户信息记录 --%>
      <% 
      //1.设置编码方式
      request.setCharacterEncoding("utf-8");
      //2.接受参数
       String keywords=request.getParameter("keywords");
	   String stuID1 = (String)session.getAttribute("name");
	  //3.查询数据库记录
	  //3.1 加载驱动
	  Connection conn=getConn();
	  ResultSet rs=null;
	  //3.2 由给定Connection类型的对象conn执行SQL指令的PreparedStatement类型的对象pstmt
	  if(keywords==null||(keywords.trim().equals(""))){
	  StringBuffer sqlBuff = new StringBuffer();
	  sqlBuff.append("select * from sys_leave where stuID='"+stuID1+"'");
	  String sql = sqlBuff.toString();
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  //3.3 PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
	  rs = pstmt.executeQuery();
	  }
	   else if(keywords != null){
				StringBuffer sqlBuff = new StringBuffer();
				sqlBuff.append("select * from sys_leave where stuID like'"+keywords+"' or leaveID like'"+keywords+"'");			
				String sql = sqlBuff.toString();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				//3.3PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				rs = pstmt.executeQuery();}
	 //4.定义int序号变量
	 int index=1;
	 while (rs.next()) {
					String leaveID = rs.getString("leaveID");
					String courseID = rs.getString("courseID");
					String reason = rs.getString("reason");
					int daynum = rs.getInt("daynum");
					String stuID = rs.getString("stuID");
					Date applytime = rs.getDate("applytime");
					String status = rs.getString("status");
					Date audittime = rs.getDate("audittime");
					String opinion = rs.getString("opinion");
					if(status.equals("0")){
					status = "未审核";}else if(status.equals("1")){
					status = "同意";}else if(status.equals("2")){
					status = "不同意";}
	 
				
      
      
       %>
      

			<tr>
				<td><%=index++%></td>
				<td><%=leaveID%></td>
				<td><%=courseID%></td>
				<td><%=reason%></td>
				<td><%=daynum%></td>
				<td><%=stuID%></td>
				<td><%=applytime%></td>
				<td><%=status%></td>
				<td><%=audittime%></td>
				<td><%=opinion%></td>
				<td>
				<div class="button-group"><a class="button border-red" href="<%=path%>/page/leave/action_leave_del.jsp?leaveID=<%=leaveID%>" ><span class="icon-trash-o"></span>删除</a> </div>
				
				</td>
			</tr>
	 		  			<%
				}
			%>

			

    </table>
 

  <div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div>
</form>
</body>
</html>
				
