<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightpink">
<jsp:useBean id="CustBean" class="pac.CustomerBean" scope="session"/>
<table>
<tr>
<td><b><i>Name</i></b></td><td><jsp:getProperty  property="custName" name="CustBean" /></td>
</tr>
<tr>
<td><b><i>Balance</i></b></td><td><jsp:getProperty  property="balance" name="CustBean" /></td>
</tr>
<tr>
<td><b><i>Account Number</i></b></td><td><jsp:getProperty  property="accountNo" name="CustBean" /></td>
<tr>
<td><b><i>Phone Number</i></b></td><td><jsp:getProperty  property="phoneNo" name="CustBean" /></td>
</tr>
<tr>
<td><b><i>Email</i></b></td><td><jsp:getProperty  property="email" name="CustBean" /></td>
</tr>
</table>


</body>
</html>