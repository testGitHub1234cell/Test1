<%@  page import="java.sql.*" %>
<%@page import="pac.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="Bean" class="pac.LoginBean" scope="session"/>

<jsp:useBean id="CustBean" class="pac.CustomerBean" scope="session"/>
<%
int customer_id =Bean.getCustId();

 int tbenId;
 String tbenName;
 long tbenAccountNo;
 long tbenContact;
 int tbenCustId;
Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("connected>>>>>..............");
System.out.println("inside validate admin>>>>>>>>>>>>>>>>>");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String password = "oracle";
Connection con;
con=DriverManager.getConnection(url,user, password);
	PreparedStatement ps=con.prepareStatement("select * from BENIFICIARY_NB where cust_id=? ");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		 tbenId =rs.getInt(1);
		 tbenName =rs.getString(2);
		 tbenAccountNo =rs.getLong(3);
		 tbenContact=rs.getLong(4);
		 tbenCustId=rs.getInt(5);
	}
%>
<jsp:useBean id="benBean" class="pac.BenificiaryBean" scope="session"/>
<jsp:setProperty property="benId" name="benBean" value=<%= tbenId %>/>
<jsp:setProperty property="benName" name="benBean" value=<%= tbenName %>/>
<jsp:setProperty property="benAccountNo" name="benBean" value=<%= tbenAccountNo %>/>
<jsp:setProperty property="benContact" name="benBean" value=<%= tbenContact %>/>
<jsp:setProperty property="cc" name="benBean" value=<%= tbenCustId %>/>
<B><I>This Is The List Of The Benificiers </I></B>
<table>
<tr><td><b><i>Name</i></b></td><td><jsp:getProperty property="benName" name="benBean"/></td>
<td><form action="trans.jsp"><input type="submit" value="transfer"></form></td></tr>
</table>







</body>
</html>