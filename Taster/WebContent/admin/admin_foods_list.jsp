<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Խ���</title>
<link rel="stylesheet" href="/Taster/qboard/css.css" type="text/css">
</head>

<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr>
         <td align="center"><h2>�Ĵ� ��� ����Ʈ</h2></td>
      </tr>
   </table>
   
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr align="center" bgcolor="#f3f3f3">
         <td width="50"><strong>�۹�ȣ</strong></td>
         <td width="50"><strong>�Ĵ��̸�</strong></td>
         <td width="350"><strong>��ȭ��ȣ</strong></td>
         <td width="70"><strong>���ݴ�</strong></td>
         <td width="80"><strong>����</strong></td>
         <td width="50"><strong>�ű�</strong></td>
         <td width="50"><strong>��ȸ��</strong></td>
         <td width="50"><strong>����</strong></td>
      </tr>

      <tr bgcolor="#777777">
         <td height="1" colspan="5"></td>
      </tr>

   <s:iterator value="list" status="stat">
   <!-- �󼼺��� ���� �׼� -->
      <s:url id="viewURL" action="AshoplistAction">
         <s:param name="shop_idx">
            <s:property value="shop_idx" />
         </s:param>
         <s:param name="currentPage">
            <s:property value="currentPage" />
         </s:param>
      </s:url>
   
      <tr>
         <!-- �� ��ȣ -->
         <td><s:property value="shop_idx" /></td>
         <td align="left">
         
            <!--  
            <s:if test="re_level != 0">
               <c:forEach var = "i" begin = "${re_level}" end = "0">&nbsp;</c:forEach>��
            </s:if>
            -->
            
            
         <!-- �Ĵ��̸� -->
             <s:a href="%{viewURL}"><s:property value="shop_name" /></s:a>
          </td>
         <td><s:property value="shop_price" /></td>
         <td><s:property value="shop_tel" /></td>
         <td><s:property value="shop_kind" /></td>
         <td><s:property value="shop_holiday" /></td>
         <td><s:property value="shop_new" /></td>
         <td><s:property value="shop_readCount" /></td>
      </tr>

      <tr bgcolor="#777777">
         <td height="1" colspan="8"></td>
      </tr>

   </s:iterator>

  

   <!-- �۾��� ��ư -->
   <tr align="right">
      <td colspan="5">
         <input name="list" type="button" value="�� �ø���" class="inputb" onClick="javascript:location.href='AshopWriteForm.action?currentPage=<s:property value="currentPage" />';" />
      </td>
   </tr>


  </table>
</body>
</html>