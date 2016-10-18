<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2"><tiles:insertAttribute name="top"/></td>
</tr>

<tr>
	<td valign="top"><tiles:insertAttribute name="body"/></td>
</tr>

<tr>
	<td colspan="2"><tiles:insertAttribute name="bottom"/></td>
</tr>

</table>

</body>
</html>