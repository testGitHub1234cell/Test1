<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightblue">

<h1>Hello please enter user name and password</h1>

<form action="Controller">
<input type=hidden name=type value=1/>
<table align="center" bgcolor="lightpink" bordercolor="purple">
<tr>
<td>UserName</td>
<td><input type=text name=uname></td>
</tr>
<tr>
<td>Password</td>
<td><input type=text name=password></td>
</tr>
<tr>
<td><input type="submit" value="click">
<!-- <td><input type="submit" value="register"> -->
</table>
<a href="register.html">Click Here To Register</a>
</body>
</html>