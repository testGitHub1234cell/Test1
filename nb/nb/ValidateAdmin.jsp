<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	System.out.println("inside validate admin>>>>>>>>>>>>>>>>>");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "oracle";
	Connection con;
	con=DriverManager.getConnection(url,user, password);
 	PreparedStatement ps=con.prepareStatement("select * from ADMIN_NB where username=? AND password=? ");
	ps.setString(1,name);
	ps.setString(2,pass);
	ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			int id=rs.getInt(1);
			String tusername=rs.getString(2);
			String tpassword= rs.getString(3);
			
			if(tusername.equals(name) && tpassword.equals(pass))
		    {
				session =request.getSession(true);
				session.setAttribute("Aname",tusername);
				session.setAttribute("Apassword", tpassword);
				request.getRequestDispatcher("AdminHome.jsp").forward(request,response);
			}
			
		
		}
		else
		{
			
          String msg= "PLEASE ENTER CORRECT USERNAME OR PASSWORD";
        		  request.setAttribute("ERRORMSG",msg);	 
        		  request.getRequestDispatcher("AdminLogin.jsp").forward(request,response);
		
		}%>

</body>
</html>