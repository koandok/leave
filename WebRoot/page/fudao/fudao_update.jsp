<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>

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
<%  		    //设置编码方式
                request.setCharacterEncoding("utf-8");
			    //接收参数
			    // String name=(String)session.getAttribute("name");
				String instID=request.getParameter("instID");
				String sql = "select * from sys_instructor where instID = '"+instID+"'";
				//2:查询数据库记录
				//2.1 加载驱动
    			Connection conn = null;
				Statement statem = null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
    			conn = getConn();
    			pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery(sql);
					while(rs.next()) {
					instID = rs.getString("instID");					
					String instName = rs.getString("instName");
			        String depID = rs.getString("depID");
			        String telephone = rs.getString("telephone");
			        String password = rs.getString("password");
			        session.setAttribute("instID",instID);
					%>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>个人设置</strong></div>
  <div class="body-content" >
    <form action="page/fudao/action_fudao_update.jsp" method="post" class="form-x" >  
    
      <div class="form-group">
        <div class="label">
          <label>工号：</label>
        </div>
        <div class="field" align="center">
          <input  type="text" class="input w50" value="<%=instID%>" name="instID" data-validate="required:请输入工号" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=instName%>" name="instName" data-validate="required:请输入姓名" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>二级学院编号：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=depID%>" name="depID" data-validate="required:请输入二级学院编号" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=telephone%>" name="telephone" data-validate="required:请输入联系电话" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=password%>" name="password" data-validate="required:请输入密码" />
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