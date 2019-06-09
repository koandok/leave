<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<title>用户信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加课程信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/leave/action_leave_add.jsp">  
    <%Date t = new Date();

SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");

		int i=(int)(Math.random()*900)+100; 
		String leaveID = df.format(t)+String.valueOf(i);
		String stuID = (String)session.getAttribute("name");
   %>
      <div class="form-group">
        <div class="label">
          <label>请假编号:</label>
        </div>
        <div class="field">
          <input type="text" readOnly="true"class="input w50" value="<%=leaveID%>" name="leaveID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>课程编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="courseID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>请假事由：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="reason" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
      

                     
                     
        <div class="form-group">
        <div class="label">
          <label>请假天数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="daynum" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>学号：</label>
        </div>
        <div class="field">
          <input type="text" readOnly="true" class="input w50" value="<%=stuID%>" name="stuID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>请假时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="applytime" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
  

      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>
