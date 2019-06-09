<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>课堂考勤系统</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="shortcut icon" href="images/logo.jpg">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/logo.jpg" class="radius-circle rotate-hover" height="50" alt="" />请假管理系统</h1>
  </div><%
  //获取用户ID赋值给user
  	String user = (String)session.getAttribute("name"); 
    %>
  <div class="head-l" ><a href="" target="_blank" style="color:#FFF" ><span class="icon-user"></span> 欢迎 <%=user %></a>&nbsp;&nbsp;<a class="button button-little bg-green" href="denglu.jsp" target="_blank" ><span class="icon-home"></span> 首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="denglu.jsp"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  
  
<li> <h2><a href="page\class\class_list.jsp" target="right"><span class="icon-user"></span>班级管理</a></h2></li>
   
<li><h2><a href="page\course\course_list.jsp" target="right"><span class="icon-user"></span>课程管理</a></h2></li>
 
<li> <h2><a href="page\student\stu_list.jsp" target="right"><span class="icon-user"></span>学生信息管理</a></h2></li>
    
  <h2><span class="icon-user"></span>请假信息管理</h2>
  <ul>
    <li><a href="page\leave\leave_instcheck_list.jsp" target="right"><span class="icon-caret-right"></span>审核请假申请</a></li>
    <li><a href="page\leave\leave_instout.jsp" target="right"><span class="icon-caret-right"></span>导出请假名单</a></li>      
  </ul>
  
 
  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="denglu.jsp"  class="icon-home"> 首页</a></li>
  <li><a href="denglu.jsp" id="a_leader_txt">欢迎界面</a></li>
  <li><b>当前语言：</b><span style="color:red;">中文</php></span>
 </li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="welcome.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>

</html>
