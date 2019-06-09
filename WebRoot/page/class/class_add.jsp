<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
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
<title>班级信息列表</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="shortcut icon" href="images/logo.jpg">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加班级信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/class/action_class_add.jsp">  
      <div class="form-group">
        <div class="label">
          <label>班号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="classID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>班名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="className" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>二级学院编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="depID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>专业：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="major" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>年级：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="grade" data-validate="required:数据必填项" />
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
