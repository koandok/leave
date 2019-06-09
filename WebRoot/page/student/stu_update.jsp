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
               //设置编码方式
               request.setCharacterEncoding("utf-8");
			   //接收参数
			   // String name=(String)session.getAttribute("name");
				String stuID=request.getParameter("stuID");
				String sql = "select * from sys_student where stuID = '"+stuID+"'";
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
					stuID = rs.getString("stuID");					
					String classID = rs.getString("classID");
			        String stuName = rs.getString("stuName");
			        String sex = rs.getString("sex");
			        String address = rs.getString("address");
			        String stuTel = rs.getString("stuTel");
			        String contact = rs.getString("contact");
			        String contactTel = rs.getString("contactTel");
			        String password = rs.getString("password");
			        session.setAttribute("stuID",stuID);
					%>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>个人设置</strong></div>
  <div class="body-content" >
    <form action="page/student/action_stu_update.jsp" method="post" class="form-x" >  
    
      <div class="form-group">
        <div class="label">
          <label>学号：</label>
        </div>
        <div class="field" align="center">
          <input  type="text" class="input w50" value="<%=stuID%>" name="stuID" data-validate="required:请输入课程编号" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>班号：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=classID%>" name="classID" data-validate="required:请输入班号" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=stuName%>" name="stuName" data-validate="required:请输入课程名称" />
          <div class="tips"></div>
        </div>
      </div>
      
      <% if(sex.equals("男")){%>
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
        <%}else if(sex.equals("女")){%> 
        
       <div class="form-group">
       <div class="label">
       <label>性别：</label>
       </div>
       <div class="field" style="padding-top:5px;"> 
          			 男 <input id="sex_A"  type="radio" name="sex" value="男" />
        			 女 <input id="sex_B"  type="radio" name="sex" value="女" checked="checked"/>   
         			<div class="tips"></div>   
                    </div>
                    </div>           
              <%}%>
                    
      <div class="form-group">
        <div class="label">
          <label>通讯地址：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=address%>" name="address" data-validate="required:请输入学年" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学生电话：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=stuTel%>" name="stuTel" data-validate="required:请输入学期" />
          <div class="tips"></div>
        </div>
      </div>
      
            <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=contact%>" name="contact" data-validate="required:请输入学时" />
          <div class="tips"></div>
        </div>
      </div>
      
                  <div class="form-group">
        <div class="label">
          <label>联系人电话：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=contactTel%>" name="contactTel" data-validate="required:请输入学时" />
          <div class="tips"></div>
        </div>
      </div>
      
                  <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field" align="center">
          <input type="text" class="input w50" value="<%=password%>" name="password" data-validate="required:请输入学时" />
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

  </head>
  
 
</html>
