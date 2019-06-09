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
<script type="text/javascript">
function alertValue()
  {
  var a = document.getElementById('opinion').value;
   return a;
  }
</script>

</head>

<body>
<%  //设置编码方式
			    request.setCharacterEncoding("utf-8");
			    //接收参数
				String leaveID = request.getParameter("leaveID");

				//2:查询数据库记录
				//2.1 加载驱动
				Connection conn = getConn();
				ResultSet rs = null;
				//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
							
				StringBuffer sqlBuff = new StringBuffer();
				sqlBuff.append("select * from sys_leave where leaveID='"+leaveID+"'");
				String sql = sqlBuff.toString();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
				rs = pstmt.executeQuery();
				
				
				//定义int序号变量
				int index = 1;
				while (rs.next()) {
					leaveID = rs.getString("leaveID");	
					String courseID = rs.getString("courseID");
					String reason = rs.getString("reason");
					int daynum = rs.getInt("daynum");
					String stuID = rs.getString("stuID");
					Date applytime = rs.getDate("applytime");
					String status = rs.getString("status");
					//Date audittime = rs.getDate("audittime");
					String opinion = rs.getString("opinion");
			%>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>审核请假单</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="page/leave/action_leave_instcheck.jsp">  

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
          <input type="text" readOnly="true"class="input w50" value="<%=courseID%>" name="courseID" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>请假事由：</label>
        </div>
        <div class="field">
          <textarea rows="5" cols="49" name="reason" readOnly="true"><%=reason%></textarea>
          
          <div class="tips"></div>
        </div>
      </div>
      
      

                     
                     
        <div class="form-group">
        <div class="label">
          <label>天数：</label>
        </div>
        <div class="field">
         
          <input type="text" readOnly="true"class="input w50" value="<%=daynum%>" name="daynum" data-validate="required:数据必填项" />
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
          <input type="text"readOnly="true" class="input w50" value="<%=applytime%>" name="applytime" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      <%if(status.equals("0")){
					status = "未审核";}else if(status.equals("1")){
					status = "同意";}else if(status.equals("2")){
					status = "不同意";}
       %>
              <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field">
          <input type="text" readOnly="true"class="input w50" value="<%=status%>" name="status" data-validate="required:数据必填项" />
          <div class="tips"></div>
        </div>
      </div>
      

              <div class="form-group">
        <div class="label">
		<label>审核意见：</label>
        </div>
        <div class="field">
        <input type="text" class="input w50"style="height:100px;" value="<%=opinion%>" name="opinion"  maxlength="150"/>
          <div class="tips"></div>
        </div>
      </div>

      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div> 
         <div class="button-group">  <input class="button border-main" type="submit" name="submit1" value="同意" />
         						    <input class="button border-red"  type="submit" name="submit2"  value="不同意"  />
         						    <input class="button border-green"   type="submit" name="submit3" value="取消" />
         						    </div>
      </div>
</form>
  </div>
</div>
<%}%>

</body>
</html>
