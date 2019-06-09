<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<%  		   
              //1.设置编码方式
                   request.setCharacterEncoding("utf-8");
			  //2.接收参数
			  // String name=(String)session.getAttribute("name");
				String classID=request.getParameter("classID");
				String sql = "select * from sys_classes where classID = '"+classID+"'";
			 //3:查询数据库记录
			 //3.1 加载驱动
    			Connection conn = null;
				Statement statem = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			conn = getConn();
    			pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery(sql);
					while(rs.next()) {
										
					 classID = rs.getString("classID");
			        String className = rs.getString("className");
			        String depID = rs.getString("depID");
			        String major = rs.getString("major");
			        String grade = rs.getString("grade");
					%>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>个人设置</strong></div>
  <div class="body-content" >
    <form action="page/class/action_class_update.jsp" method="post" class="form-x" >  
    
      <div class="form-group">
        <div class="label">
          <label>班号：</label>
        </div>
        <div class="field" align="center">
          <input  type="text" class="input w50" value="<%=classID%>" name="classID" data-validate="required:请输入课程编号"readonly="ture" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>班名：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=className%>" name="className" data-validate="required:请输入班号" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>二级学院编号：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=depID%>" name="depID" data-validate="required:请输入课程名称" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>专业：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=major%>" name="major" data-validate="required:请输入学年" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>年级：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=grade%>" name="grade" data-validate="required:请输入学期" />
          <div class="tips"></div>
        </div>
      </div>
      
            
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field" >
          <button class="button bg-main icon-check-square-o" type="submit"> 修改</button>
        </div>
      </div>
     <%} %> 
    </form>
  </div>
</div>
			
</body>
</html>