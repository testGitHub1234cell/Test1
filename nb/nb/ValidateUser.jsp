<%@page import="monfox.toolkit.snmp.agent.modules.SnmpV2Mib.SysOREntry"%>
<%@  page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

   String name=request.getParameter("uname");
   String pass=request.getParameter("password");
    
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("connected>>>>>..............");
	System.out.println("inside user validate");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "oracle";
	Connection con;
	con=DriverManager.getConnection(url,user, password);
 	PreparedStatement ps=con.prepareStatement("select * from login_nb where user_name=? AND password=?");
	ps.setString(1,name);
	ps.setString(2,pass);
	ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			System.out.println("user is vaild and value is taken from table");
			String tusername=rs.getString(1);
			String tpassword= rs.getString(2);
			int id=rs.getInt(3);
			 if(tusername.equals(name) && tpassword.equals(pass))
				
			 {	
					%>
					<jsp:useBean id="Bean" class="pac.LoginBean" scope="session"/>
					<jsp:setProperty name="Bean" property="custId" value="<%= id%>"/>
					<jsp:setProperty name="Bean" property="username" value="<%= tusername%>"/>
					<jsp:setProperty name="Bean" property="password" value="<%= tpassword%>"/>
					
					<%
		         	session =request.getSession(true);
					session.setAttribute("loginbean",Bean);
					request.getRequestDispatcher("UserHome.jsp").forward(request, response);
			}
					
		}
					
		else
		{
			
          String msg= "PLEASE ENTER CORRECT USERNAME OR PASSWORD";
        		  request.setAttribute("ERRORMSG",msg);	 
        		  request.getRequestDispatcher("login.jsp").forward(request,response);
		
		}%>
			 
</body>
</html>