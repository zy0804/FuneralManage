<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'registerReeferRemainsSend.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/json2.js"></script>
<script src="js/AjaxJson.js" type="text/javascript" charset="utf-8"></script>
<script src="js/Setting.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-1.8.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/My97DatePicker/WdatePicker.js">
	//这是一个时间控件
</script>
<script type="text/javascript" src="js/deadReefer/registerReeferRemainsSend.js"></script>
<style type="text/css">
    body,td,th {
    	font-size: 20px;
    }
</style>
</head>

<body>
	<form id="form1" name="form1" onsubmit="return saveInformationOfRemainsSend();">
		<table style="cellspacing:20px;">
			<tr>
				<td id="reefer" colspan="4"></td>
			</tr>
			<tr>
				<td>冰柜号：</td>
				<td><input type="text" id="reeferNo" name="reeferNo"
					readonly="readonly" disabled="true" style="width:80%;" /></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>送运车牌号：</td>
				<td><select id="carNumber" name="reeferRemainsSend.carNumber"
					style="width:75%; margin-right:50px;" required="required"
					onchange="driverDetailInfo();"></select></td>
				<td>司机姓名：</td>
				<td><input type="text" id="driverName" name="driverName"
					readonly="readonly" disabled="true" /></td>
			</tr>
			<tr>
				<td>司机手机：</td>
				<td><input type="text" id="driverPhone" name="driverPhone"
					readonly="readonly" disabled="true" style="margin-right:50px;" /></td>
				<td>送运地点：</td>
				<td><input type="text" id="address"
					name="reeferRemainsSend.address" required="required" /></td>
			</tr>
			<tr>
				<td>联系人姓名：</td>
				<td><input type="text" id="contactName"
					name="reeferRemainsSend.contactName" required="required"
					style="margin-right:50px;" /></td>
				<td>联系人手机：</td>
				<td><input type="text" id="contactMobile" required="required"
					name="reeferRemainsSend.contactMobile" /></td>
			</tr>
			<tr>
				<td>是否本馆车辆：</td>
				<td><select id="bInternalCar"
					name="reeferRemainsSend.bInternalCar"
					style="width:75%; margin-right:50px;"><option value="1">是</option>
						<option value="0">否</option></select></td>
				<td>预收费用：</td>
				<td><input type="text" id="carBeCost"
					name="reeferRemainsSend.carBeCost" required="required" value="350" /></td>
			</tr>
			<tr>
				<td>送运时间：</td>
				<td><input type="text" id="sendTime"
					name="reeferRemainsSend.sendTime" required="required"
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',readOnly:true,minDate:'%y-%M-{%d}'})" /></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="submit" id="save"
					value="保存"> <input type="button" id="btnPrint"
					disabled="disabled" value="打印" onclick="printReeferCarryBill();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
