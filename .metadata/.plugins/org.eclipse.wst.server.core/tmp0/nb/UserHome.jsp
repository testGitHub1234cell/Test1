<%@page import="com.sun.xml.txw2.Document"%>
<%@page import="monfox.toolkit.snmp.agent.modules.SnmpV2Mib.SysOREntry"%>
<%@  page import="java.sql.*" %>
<%@page import="pac.LoginBean"%>

<html>
<body>
<head></head>
<%
int id;
String name;
String password1;
session=request.getSession(true);
System.out.println("inside home");
 %>
 	<jsp:useBean id="Bean" class="pac.LoginBean" scope="session"/> 
 	<%-- <jsp:getProperty name="Bean" property="custId" />
	<jsp:getProperty name="Bean" property="username"/>
	<jsp:getProperty name="Bean" property="password"/> --%>
<%
id=Bean.getCustId();
name=Bean.getPassword();
password1=Bean.getUsername();
 
String tcustName;
String tcustAddress;
long tphoneNo;
String temail;
String  taccountType;
long taccountNo;
int tbalance;

Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("connected>>>>>..............");
System.out.println("inside user home");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";
String password = "oracle";
Connection con;
con=DriverManager.getConnection(url,user, password);
	PreparedStatement ps=con.prepareStatement("select * from account_nb where cust_id=? ");
	ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		taccountNo=rs.getLong(1);
		taccountType=rs.getString(2);
		tbalance=rs.getInt(4);
	
	rs.close();
	ps.close();
    ps=con.prepareStatement("select * from customer_nb where cust_id=? ");
    ps.setInt(1,id);
    rs=ps.executeQuery();
    if(rs.next())
    {
    	tcustName=rs.getString(2);
    	tcustAddress=rs.getString(3);
    	tphoneNo=rs.getLong(4);
    	temail=rs.getString(5);
    	
    	%>
    	
    	 <jsp:useBean id="CustBean" class="pac.CustomerBean" scope="session"/>
    	 <jsp:setProperty name="CustBean" property="custName" value="<%= tcustName%>"/>
    	 <jsp:setProperty name="CustBean" property="custAddress" value="<%= tcustAddress%>"/>
    	 <jsp:setProperty name="CustBean" property="phoneNo" value="<%= tphoneNo%>"/> 
    	 <jsp:setProperty name="CustBean" property="email" value="<%= temail%>"/>
    	 <jsp:setProperty name="CustBean" property="accountType" value="<%= taccountType%>"/>
    	 <jsp:setProperty name="CustBean" property="accountNo" value="<%=taccountNo%>"/> 
    	 <jsp:setProperty name="CustBean" property="balance" value="<%= tbalance%>"/> 
    	 
    	 <%
    }
   }
 %>
 <table align="center"  bgcolor="lightpink" bordercolor="purple">
 <tr>
 <form action="Controller">
<input type=hidden name=type value=4>
 <td>View Details</td><td> <input type="submit" value="click"></td>
 </form>
 </tr>
 <tr>
 <form action="Controller">
 <input type=hidden name=type value=5>
 <td>View Benificiary Details</td><td><input type="submit" value="click"><td>
 </form>
</tr>
<tr> 
 <form action="Controller">
 <input type=hidden name=type value=6>
 <td>Raise Request</td><td><input type="submit" value="Click"></td>
 </form>
 </tr>
 </table>
 
 
 </body>
 </html>
 
	



<%--
	1)view balance
	2)add/active/deactivate/delete/transfer amount
	3)DD request
	4)check book request
	5)benificiery details
	6)change password request to admin
	7)tranaction reports monthly ,quartly,
	8)shedule tranaction  by date 
 --%>

