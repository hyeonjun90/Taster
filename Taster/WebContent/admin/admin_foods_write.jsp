<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ� ��� �Խ���</title>
<script language="javascript">

function openZipcode(){
	var url="AdminShopSearchZipcode.action";
	open(url, "","toolbar=no,location=no,"
			+"status=no,menubar=no,"
			+"scrollbars=yes,resizable=no,"
			+"width=410,height=400");
}

</script>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="right"><h2>�Ĵ��� �Խ���</h2></td>
		</tr>
</table>


<form action="AshopWriteAction.action" method="post" enctype="multipart/form-data" name="joinForm">
<input type="hidden" name="r_shop_addr" value=""/>
<input type="hidden" name="r_shop_addr1" value="" />
<input type="hidden" name="r_shop_addr2" value="" />
<input type="hidden" name="r_shop_addr3" value="" />

<table width="600" border="0" cellspacing="0" cellpadding="2">

		<tr>
			<td align="center" width="100">
				<font color="#FF0000">*</font> �Ĵ��̸�:<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}" cssStyle="width:370px"/>
			</td>                                                                
			
		</tr> 
		
       <tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> ��ȭ��ȣ:
				<s:textfield name="shop_tel" theme="simple"  value="%{resultClass.shop_tel}" cssStyle="width:370px" />
			</td>
			
		</tr>
		
		<tr>
		<td align="center"  width="100">
				<font color="#FF0000">*</font> �� �� ��:
				&nbsp;<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}"   cssStyle="width:370px"  />
			</td>
			
		</tr>
		 
	  
		<tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> �ּ�:
		</td>
		</tr>
		
		<tr>
		<td align="right" width="100">
		<input  align="right" type="button" value="�ּҰ˻�" class="inputb" onclick="openZipcode();">
		
		<input type="text" name="shop_addr4" id="shop_addr4" class="zipcode" size="50" onclick="openZipcode();"/>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="r_shop_addr4" theme="simple" cssStyle="width:370px"/>
		
		</td>
		</tr>
		
		
		
		<tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> ��   ��:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="shop_holiday" theme="simple" value="%{resultClass.shop_holiday}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		
	
		<tr>
		<td  align="center" width="100">
				<font color="#FF0000">*</font> �� ȸ ��:
				&nbsp;<s:textfield name="shop_readCount" theme="simple" value="%{resultClass.shop_readCount}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		
		<tr>
			<td align="left" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="radio" name="shop_kind" value="�ѽ�"> �ѽ� 
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="�߽�"> �߽�
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="���"> ��� 
		    &nbsp;
		    
		    <input type="radio" name="shop_kind" value="�Ͻ�"> �Ͻ� 
		    &nbsp;
		    
		    <input type="radio" name="shop_kind" value="�н�"> �н� 
		    &nbsp;
			<br>
			</td>
		</tr>
		
		<tr>
		
          <td align="right" bgcolor="#F4F4F4">  ÷������ </td>
          
          <td bgcolor="#FFFFFF">
              <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
			<s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
		
			</s:if>
	<br>
		<input type="submit" value="���"/>
		</td>
		
		</tr>
	</table>
		</form>
	
	 
</body>
</html>