<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body background="Hydrangeas.jpg">

<%
int status=1;
Object msg= request.getAttribute("ERRORMSG");
if ( msg != null )
{
	status=0;
	out.print(msg);

} 
if(status==1 || status==0)
{
%>
<table align="center">
<tr><td><b><i>Hello please enter user name and password</i></b><tr><td>
</table>

<form action="Controller">
<input type=hidden name=type value=3>
<table align="center" bgcolor="skyblue" bordercolor="purple">
<tr>
<td>UserName</td>
<td><input type=text name=uname></td>
</tr>
<tr>
<td>Password</td>
<td><input type=text name=password></td>
</tr>
<tr>
<td><input type="submit" value="click"></td>
</tr>
</table>
</form>
</body>
<%
}
%>
</html>