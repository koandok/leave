<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp"%>


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
    <form method="post" class="form-x" action="page/student/action_stu_add.jsp">  
      <div class="form-group">
        <div class="label">
          <label>学号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
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
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuName" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
      
      <div class="form-group">
             <div class="label">
          <label>性别：</label>
        </div>
     <div class="field" style="padding-top:5px;"> 
          			 男 <input id="sex_A"  type="radio" name="sex" value="男" checked="checked"/>
        			 女 <input id="sex_B"  type="radio" name="sex" value="女" />   
         			<div class="tips"></div>   
                    </div>
                    </div>

                     
                     
        <div class="form-group">
        <div class="label">
          <label>通讯地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="address" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>学生电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stuTel" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="contact" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
  
        <div class="form-group">
        <div class="label">
          <label>联系人电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="contactTel" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="password" data-validate="required:数据必填项" />
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

