<%@ page language="java" contentType="text/html;charset=gb18030"
	pageEncoding="GB18030"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb18030">
<title>欢迎使用殡葬智能化系统</title>
<script src="js/My97DatePicker/WdatePicker.js">
 </script>
 <script type="text/javascript" src="js/yuyue.js" charset="UTF-8">
</script>
<script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
<style type="text/css">
body,td,th {
	font-size: 24px;
}
</style>
<script>
    	window.onload=initialization;
    	
	    function initialization()
	    {
	       
	       
	       var url = location.search; //获取url中"?"符后的字串
	      
	       if(url.indexOf("?")!=-1){
	       		var str=url.substr(1);         
	       		var first = url.indexOf("=");
	       		var second = url.indexOf("&");
	       		var last = url.lastIndexOf("=");
	       		var deadId=url.substring(first+1, second);
	       		var index = url.substring(last+1);
	       		
	       		if(index!="1"){	       		
	       		document.getElementById("printDeadInfoPage").click();
	       		document.form3.deadId.value=deadId;
	       		document.form3.deadId.onchange();
	       		
	       		}
	       		
	       		    		
	       }
	        http_request=createHttpRequest();
			http_request.onreadystatechange=showAllFuneralGoodsCallBack;
			http_request.open('POST',"RegisterServiceAction!showAllFuneralGoods",false);
			http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			http_request.send(null);
			
			http_request=createHttpRequest();
			http_request.onreadystatechange=showUrnCallBack;
			http_request.open('POST',"RegisterServiceAction!showUrn",false);
			http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			http_request.send(null);
			
			http_request=createHttpRequest();
			http_request.onreadystatechange=getLeaveRoomCallBack;
			http_request.open('POST',"RegisterServiceAction!getLeaveRoom",false);
			http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			http_request.send(null);
			
			http_request=createHttpRequest();
			http_request.onreadystatechange=getSetServiceCallBack;
			http_request.open('POST',"RegisterServiceAction!getSetService",false);
			http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			http_request.send(null);
			return false;
	      
	    }
    </script>
</head>
<body>
<object id="LODOP" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
<embed id="LODOP_EM" type="application/x-print-lodop" witdh=0 heigth=0></embed>
</object>
<OBJECT id=CVR_IDCard height=0 width=0 classid=clsid:10946843-7507-44FE-ACE8-2B3483D179B7 name=CVR_IDCard></OBJECT>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">登记预约信息</li>
    <li class="TabbedPanelsTab" tabindex="0">预约遗体挂号</li>
    <li class="TabbedPanelsTab" tabindex="0" id="printDeadInfoPage">打印遗体信息</li>
     <li class="TabbedPanelsTab" tabindex="0" id="serviceRegisterPage">完善业务信息</li>
     <!--  li class="TabbedPanelsTab" tabindex="0">打印费用清单</li>-->
  </ul>
  <!--—————————————————————————————————————1.登记预约信息———————————————————————————————————-->
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
      <form name="form1" onSubmit="return validateFormyuhuo(this)"> 
        <p>
          <label for="deadId">逝者身份证号码：</label>
          <input type="text" name="orderInfo.deadId" id="deadId">
          <input type="button" name="ReadCard" id="ReadCard" value="读取身份证号码" onClick="return ReadIDCard()" style="width: 125px; ">&nbsp;&nbsp;
          <label for="deadName">逝者姓名：</label>
          <input type="text" name="orderInfo.deadName" id="deadName">
        </p>
        <p>
          <label for="contactMobile">联系人手机号码：</label>
          <input type="text" name="orderInfo.contactMobile" id="contactMobile">
          <label for="contactName">联系人姓名：</label>
          <input type="text" name="orderInfo.contactName" id="contactName">
        </p>
        <p>
          <label for="estimatedTime">遗体预计进馆时间：</label>
          <input type="text" name="orderInfo.estimatedTime" id="estimatedTime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
          <label>预约时间：</label>
          <input type="text" name="orderInfo.orderTime" id="orderTime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
          <hr>
        </p>
        <p>
          <input type="checkbox" id="cremation01" onClick="addCremation(document.forms[0])">
          <label for="CremationType">预约火化业务：</label>
          <select name="orderInfo.chooseCremationType" id="CremationType" " disabled="true">
          	<option >—请选择—</option>
          	<option>普通炉</option>
          	<option>捡灰炉</option>
          	<option>VIP区</option>
          </select><span style="width:50px;"></span><br>
		      <input type="checkbox" id="bodyBeauty01" onclick="addBodyBeauty(document.forms[0])">
          <label for="bodyBeautyType">预约美容业务：</label>
          <select name="orderInfo.bodyBeauty" id="bodyBeautyType" disabled="true">
            <option>—请选择—</option>
          	<option>整容</option>
          </select><span style="width:50px;"></span><br>
		      <input type="checkbox" id="farewareHall01" onclick="addFarewareHall(document.forms[0])">
          <label for="farewareHallType">预约告别业务：</label>
          <select name="orderInfo.farewareHall" id="farewareHallType"  disabled="true">
          	<option>—请选择—</option>
          </select><span style="width:50px;"></span>
        </p>
        <hr>
        <p>
          <input type="button" name="SaveSubmit1" id="SaveSubmit1" value="保存" style="width: 120px; " onClick="return validateFormyuhuo()" >
          <!-- <input type="submit" name="PrintSubmit1" id="PrintSubmit1" value="打印预约信息"> -->
        </p>
      </form>
      <p>&nbsp;</p>
    </div>
  <!--———————————————————————————————2.预约遗体挂号—————————————————————————————————————————————————-->
	<div class="TabbedPanelsContent">
          <form name="form2" onSubmit="return validateForm2(this);">
            <p>
              <label for="deadId">逝者身份证号码：</label>
              <input type="text" name="deadInfo.deadId" id="deadId">
              <input type="button" name="ReadCard" id="ReadCard" value="读卡" onClick="return ReadIDCard2()" style="width: 60px; ">
              <input type="button" name="confirm" id="DeadIdConfirm" value="查询" style="width: 60px;" onClick="form2Data(document.forms[1])">
            </p>
            <p>
            
              <label for="deadName">逝者姓名：</label>
              <input type="text" name="deadInfo.deadName" id="deadName" disabled="true" />
              <label for="deadAge">预约时间：</label>
              <input type="text" name="deadInfo.orderTime" id="orderTime"disabled="true" />
              <label for="deadAge">预约单号：</label>
              <input type="text" name="deadInfo.orderNumber" id="orderNumber"disabled="true" />
              </p>
            <p>
              <label for="contactMobile">联系人手机号码：</label>
              <input type="text" name="orderInfo.contactMobile" id="contactMobile" disabled="true" />
              <label for="contactName">联系人姓名：</label>
              <input type="text" name="orderInfo.contactName" id="contactName" disabled="true" /></p>
			  <!-- label for="makeBeautyGrade">美容类型：</label>
              <input type="text" name="orderInfo.makeBeautyGrade" id="makeBeautyGrade" disabled="true"/>
            
			  <label for="leaveRoomGrade">告别厅类型：</label>
              <input type="text" name="orderInfo.leaveRoomGrade" id="leaveRoomGrade" disabled="true"/>
			
			
			  <label for="cremationGrade">火化炉类型：</label>
              <input type="text" name="orderInfo.cremationGrade" id="cremationGrade" disabled="true"/>-->
			
            <hr>
            <p>
              <label for="inTime">进馆时间：</label>
              <input type="text" name="deadInfo.inTime" id="inTime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})">
              <label for="deadSax">逝者性别：</label>
              <select name="deadInfo.deadSex" id="deadSex2">
				<option>男</option>
				<option>女</option>
			  </select>
			  </p>
			  <p>
              
              <label for="deadNumber">逝者年龄：</label>
              <input type="text" name="deadInfo.deadAge" id="deadAge">
              <label for="deadAddress">居住地址：</label>
              <input type="text" name="deadInfo.deadAddress" id="deadAddress">
            <!--   <label for="deadKind">死亡类型：</label>
              <select name="deadInfo.deadKind" id="deadKind">
				<option>正常</option>
				<option>非正常</option>
			  </select>
			  </p>
			  <p>
              
              
               <label for="deadReason">死亡原因：</label>
                <select name="deadInfo.deadReason" id="deadReason" >
                  <option selected>请选择</option>
                  <option>自然死亡</option>
                  <option>病故</option>
                  <option>事故</option>
                  <option>车祸</option>
                  <option>他杀</option>
                  <option>自杀</option>
                  <option>溺水</option>
                  <option>中毒</option>
                  <option>自然灾害</option>
                  <option>其他</option>
                </select>
			  <p>
              
              <label for="memberMobile">丧属手机号码：</label>
              <input type="text" name="deadInfo.memberMobile" id="memberMobile" >
              <label for="deadTime">死亡时间：</label>
              <input type="text" name="deadInfo.deadTime" id="deadTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})"></p>
			  <p>
              <label for="deadProveUnit">死亡证明出具单位：</label>
              <input type="text" name="deadInfo.deadProveUnit" id="deadProveUnit"></p>
			  <p>
			  -->
            </p>
            <p>
              <input type="submit" name="Submit5" id="Submit5" value="提交">
              <input type="button" name="toReturnCoffin" id="toReturnCoffin" value="进入还馆" onclick="return goToReturnCoffin();">
            </p>
            <p>&nbsp;</p>
          </form>
          </div>
          <!--———————————————————————————3.打印遗体信息———————————————————————————————————-->
       
	<div class="TabbedPanelsContent">
	<form name="form3" method="post" id="form3" action="">
             <p>
              <label for="deadId">逝者身份证号码：</label>
              <input type="text" name="deadId" id="deadId" onChange="return updateData()">&nbsp;&nbsp;&nbsp;
              <input type="button" name="ReadCard" id="ReadCard" value="读取身份证号码" onClick="return ReadIDCardForQRCode()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
            </p>
            <p>
              <label for="deadName">逝者姓名：</label>
              <input type="text" name="deadName" id="deadName" disabled="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label for="deadNumber">遗体编号：</label>
              <input type="text" name="deadNumber" id="deadNumber" disabled="true">
            </p>
            <p>
           <!--    <label for="memberMobile">丧属手机号码：</label>
              <input type="text" name="memberMobile" id="memberMobile" disabled="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--> 
              <label for="inTime">遗体进馆时间：</label>
              <input type="text" name="inTime" id="inTime" disabled="true">&nbsp;&nbsp;&nbsp;
            </p>
            <p>
              &nbsp;&nbsp;
              <input type="button" name="printQRCode" id="printQRCode" value="打印遗体二维码" onClick="return printCode()" style="width: 128px; ">&nbsp;&nbsp;
              &nbsp;&nbsp;
              <input type="button" name="printFamilyCode" id="printFamilyCode" value="打印家属二维码" onclick="return familyOutPut()" style="width: 124px; ">&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="gotoRegisterService" id="gotoRegisterService" value="进入业务登记" onclick="return gotoRegisterServicePage()" style="width: 124px; ">
            </p>
            <!--startprint-->
            <div id="codePrintArea">
              <img name="QRCode" id="QRCode" src="Images/code.png" width="100" height="100" alt="该二维码无法显示">
              <table width="250" height="150" id="deadInfoPrint">
              	<tr>
              		<td id="deadNumberShow"></td>
              		<td id="deadNamePrint"></td>
              	</tr>
              	<tr>
              		<td id="deadSexPrint"></td>
              		<td id="deadAgePrint"></td>
              	</tr>
              	<tr>
              		<td id="deadAddressPrint" colspan="2"></td>
              	</tr>
              </table>
            </div>
            <!--endprint-->
            
          </form>
    </div>
     <!--———————————————————————————4.完善火化服务—————————————  ——————————————————-->         
      <div class="TabbedPanelsContent">
          <form name="form4" method="post" id="form4" action="">
          <!--startprint1-->
            <p>
              <label for="deadId">逝者身份证号码：</label>
              <input type="text" name="deadInfo.deadId" id="deadId" onchange="return showData()">
              <input type="button" name="ReadCard" id="ReadCard" value="读取身份证号码" onclick="return ReadIDCardForService()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <label for="deadName">逝者姓名：</label>
              <input type="text" name="deadInfo.deadName" id="deadName" >
            </p>
            <p>
              <label for="inTime">遗体进馆时间：</label>
              <input type="text" name="inTime" id="inTime" disabled="true"/>
              <label for="deadNumber">遗体编号：</label>
              <input type="text" name="deadNumber" id="deadNumber" disabled="true"/>
              <label for="deadResidence">户籍所在地：</label>
              <select name="deadInfo.deadResidence" id="deadResidence">
                <option selected>请选择...</option>
                <option>盐城市东台市溱东镇</option>
                <option>盐城市东台市时堰镇</option>
                <option>盐城市东台市五烈镇</option>
                <option>盐城市东台市梁垛镇</option>
                <option>盐城市东台市安丰镇</option>
                <option>盐城市东台市南沈灶镇</option>
                <option>盐城市东台市富安镇</option>
                <option>盐城市东台市唐洋镇</option>
                <option>盐城市东台市新街镇</option>
                <option>盐城市东台市许河镇</option>
                <option>盐城市东台市三仓镇</option>
                <option>盐城市东台市头灶镇</option>
                <option>盐城市东台市弶港镇</option>
                <option>盐城市东台市东台镇</option>
                <option>盐城市东台市开发区</option>
                <option>盐城市大丰区</option>
                <option>泰州市兴化市</option>
              </select>
            </p>
            <p>
              <label for="deadSex">逝者性别：</label>
              <input name="deadInfo.deadSex" id="deadSex" />
              <label for="deadAge">逝者年龄：</label>
              <input name="deadInfo.deadAge" id="deadAge" />
              <label for="relationship">与经办人关系：</label>
              <select name="deadInfo.operatorRelation" id="operatorRelation">
                <option>请选择...</option>
                <option>配偶</option>
                <option>子/婿</option>
                <option>女/媳</option>
                <option>（外）孙子女</option>
                <option>父母/岳父母/公婆</option>
                <option>（外）祖父母</option>
                <option>兄弟姐妹</option>
                <option>其他</option>
              </select>
            </p>
            <hr>
            <p>
              <label for="dealerId">经办人身份证号码：</label>
              <input type="text" name="deadInfo.dealerId" id="dealerId">
              <input type="button" name="ReadDealerCard" id="ReadDealerCard" value="读取身份证号码" onclick="return ReadForm4DealerCard()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <label for="dealerName">经办人姓名：</label>
              <input type="text" name="deadInfo.dealerName" id="dealerName">&nbsp;&nbsp;&nbsp;
            </p>
            <p>
              <label for="directorName">承办人姓名：</label>
              <input type="text" name="deadInfo.directorName" id="directorName">&nbsp;&nbsp;&nbsp;
              <label for="dealerAddress">经办人住址：</label>
              <input type="text" name="deadInfo.dealerAddress" id="dealerAddress" style="width: 311px; ">&nbsp;&nbsp;&nbsp;
            </p>
            <hr>
            <p>
                <label for="deadTime">死亡时间：</label>
                <input type="text" name="deadInfo.deadTime" id="deadTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})">&nbsp;&nbsp;&nbsp;
                <label for="deadKind">死亡类型：</label>
                <select name="deadInfo.deadKind" id="deadKind">
                  <option selected>正常</option>
                  <option>非正常</option>
                </select>&nbsp;&nbsp;&nbsp;
                <label for="deadReason">死亡原因：</label>
                <select name="deadInfo.deadReason" id="deadReason" onChange="return getPathogenyDetail()">
                  <option selected>请选择</option>
                  <option>自然死亡</option>
                  <option>病故</option>
                  <option>事故</option>
                  <option>车祸</option>
                  <option>他杀</option>
                  <option>自杀</option>
                  <option>溺水</option>
                  <option>中毒</option>
                  <option>自然灾害</option>
                  <option>其他</option>
                </select>
                <select name="deadInfo.pathogeny" id="pathogeny" style="display:none">
              	  <option selected>传染病</option>
              	  <option>肿瘤</option>
              	  <option>血液病</option>
              	  <option>呼吸/消化系统疾病</option>
              	  <option>皮肤病</option>
              	  <option>神经病</option>
              	  <option>心脑血管疾病</option>
              	  <option>骨骼/肌肉系统疾病</option>
                  <option>免疫系统疾病</option>
              	  <option>泌尿生殖系统疾病</option>
                  <option>其他</option>
                </select>
              </p>
              <p>
                <label for="deadAddress">逝者家庭地址：</label>
                <input type="text" name="deadInfo.deadAddress" id="deadAddress">&nbsp;&nbsp;&nbsp;
                <label for="area">死者所属区域：</label>
                <select name="deadInfo.area" id="area">
                  <option selected>请选择...</option>
                  <option>城东新区</option>
                  <option>开发区</option>
                  <option>五烈镇</option>
                  <option>东台镇</option>
                  <option>西溪景区</option>
                  <option>梁垛镇</option>
                  <option>三仓镇</option>
                  <option>头灶镇</option>
                  <option>富安镇</option>
                  <option>安丰镇</option>
                  <option>溱东镇</option>
                  <option>时堰镇</option>
                  <option>许河镇</option>
                  <option>唐洋镇</option>
                  <option>弶港镇</option>
                  <option>大丰市</option>
                  <option>兴化市</option>
                  <option>其他</option>
                </select>&nbsp;&nbsp;
                <label for="memberMobile">丧属手机号码：</label>
                <input type="text" name="deadInfo.memberMobile" id="memberMobile">
              </p>
              <p>
                <label for="deadProveUnit">死亡证明出具单位：</label>
                <input type="text" name="deadInfo.deadProveUnit" id="deadProveUnit">&nbsp;&nbsp;&nbsp;
                <label for="deadExtraInfo">备注：</label>
                <input type="text" name="deadInfo.deadExtraInfo" id="deadExtraInfo">&nbsp;&nbsp;&nbsp;
                <label for="ashesDisposition">骨灰去向：</label>
              	<select name="deadInfo.ashesDisposition" id="ashesDisposition">
                  <option>请选择...</option>
                  <option>撒散[撒海、撒江、可降解]</option>
                  <option>经营性公墓[骨灰堂]</option>
                  <option>公益性公墓[骨灰堂]</option>
                  <option>家中存放</option>
                  <option>回原籍</option>
                  <option>其他</option>
             	</select>
              </p>
            <hr>
            <p>
              <label for="invoiceNo"><b>发票号码：</b></label>
              <input type="text" name="invoiceNo" id="invoiceNo" style="width: 133px; ">&nbsp;&nbsp;
              <label for="subsidyNo"><b>惠民补贴凭证号码：</b></label>
              <input type="text" name="subsidyNo" id="subsidyNo" style="width: 133px; ">&nbsp;&nbsp;
              </p>
              <p>
              <label for="subsidyMoney"><b>惠民补贴金额：</b></label>
              <input type="text" name="subsidyMoney" id="subsidyMoney" style="width: 80px; ">&nbsp;&nbsp;
              <label for="benefitTime"><b>惠民补贴办理日期：</b></label>
              <input type="text" name="benefitTime" id="benefitTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})" >&nbsp;&nbsp;
              <input type="button" value="确认信息" id="decideInvoiceAndSubsidy" onclick="return decideInvoice()">
            </p>
            <hr>
            <p>
              <label for="remainsCarryBeCost">代收车费应收费用：</label>
              <input type="input" id="remainsCarryBeCost" value="0" style="width: 87px; " readonly/>元&nbsp;&nbsp;
              <label for="remainsCarryRealCost">代收车费实收费用：</label>
              <input type="input" id="remainsCarryRealCost" value="0" style="width:87px;" onchange="return remainsCarryChangeWholeCost();">元
              <input type="hidden" id="lastRemainsCarryRealCost" value="0"><br>
              
              <label for="rentCrystalBeCost">租用冰棺应收费用：</label>
              <input type="input" id="rentCrystalBeCost" value="0" style="width: 87px; " readonly/>元&nbsp;&nbsp;
              <label for="rentCrystalRealCost">租用冰棺实收费用：</label>
              <input type="input" id="rentCrystalRealCost" value="0" style="width:87px;" onchange="return rentCrystalChangeWholeCost();">元
              <input type="hidden" id="lastRentCrystalRealCost" value="0"><br>
              
              <label for="rentCrystalCarBeCost">送棺费应收费用：</label>
              <input type="input" id="rentCrystalCarBeCost" value="0" style="width: 87px; " readonly/>元&nbsp;&nbsp;
              <label for="rentCrystalCarRealCost">送棺费实收费用：</label>
              <input type="input" id="rentCrystalCarRealCost" value="0" style="width:87px;" onchange="return rentCrystalCarChangeWholeCost();">元
              <input type="hidden" id="lastRentCrystalCarRealCost" value="0"><br>
              
              <label for="watchSpiritVillaBeCost">守灵别墅应收费用：</label>
              <input type="input" id="watchSpiritVillaBeCost" value="0" style="width: 87px; " readonly/>元&nbsp;&nbsp;
              <label for="watchSpiritVillaRealCost">守灵别墅实收费用：</label>
              <input type="input" id="watchSpiritVillaRealCost" value="0" style="width:87px;" onchange="return watchSpiritVillaChangeWholeCost();">元
              <input type="hidden" id="lastWatchSpiritVillaRealCost" value="0"><br>
              
              <label for="watchSpiritCoffinBeCost">别墅用棺应收费用：</label>
              <input type="input" id="watchSpiritCoffinBeCost" value="0" style="width: 87px; " readonly/>元&nbsp;&nbsp;
              <label for="watchSpiritCoffinRealCost">别墅用棺实收费用：</label>
              <input type="input" id="watchSpiritCoffinRealCost" value="0" style="width:87px;" onchange="return watchSpiritCoffinChangeWholeCost();">元
              <input type="hidden" id="lastWatchSpiritCoffinRealCost" value="0">&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" id="decideMixedCost" value="确认以上服务收费信息" style="width: 176px;" onclick="return decideMixedServiceCost();">
            </p>
            <hr>
            <p>
              <input type="checkbox" id="setServiceCheckBox" onchange="return chooseSetService()">
              <label for="setService">套餐类型：</label>
			  <select name="setService" id="setService" disabled="true" onchange="return showSetServiceDetail()">
				<option>-请选择-</option>
			  </select>&nbsp;&nbsp;
			  <input type="hidden" id="setServiceDetailContent" style="width: 40%; ">
			  <input type="hidden" id="setServiceAllCost" value="0">
            </p>
            <p>
              <input type="checkbox" id="urnChooseBox" checked="checked" onchange="return cancelUrnCost()">
              <label for="urnChoose">骨灰盒类型：</label>
			  <select name="urnChoose" id="urnChoose" onchange="return getUrnBeCost()">
				<option>-请选择-</option>
			  </select>&nbsp;&nbsp;
			  <label for="urnBeCost">应收费用：</label>
        	  <input type="text" name="urnBeCost" id="urnBeCost" value="0" style="width: 99px;" onchange="return changeUrnBeCost()"/>元&nbsp;&nbsp;
        	  <label for="urnRealCost">备注：</label>
        	  <input type="text" name="urnRealCost" id="urnRealCost" value="0" style="width: 95px; " onchange="return changeUrnRealCost()">元
        	  <input name="preUrnBeCost" id="preUrnBeCost" type="hidden" value="0"/>
        	  <input name="preUrnRealCost" id="preUrnRealCost" type="hidden" value="0"/>
            </p>
            <p>
              <input type="checkbox" id="makeBeautyBox" checked="checked" onchange="return cancelBeautyCost()">
			  <label for="makeBeautyGrade">整容类型：</label>
			  <select name="makeBeautyGrade" id="makeBeautyGrade" onChange="return getMakeBeautyBeCost()">
				<option>-请选择-</option>
				<option value="00">整容</option>
			  </select>&nbsp;&nbsp;
        	  <label for="makeBeautyBeCost">应收费用：</label>
        	  <input type="text" name="makeBeautyBeCost" id="makeBeautyBeCost" value="0" style="width: 92px;" onchange="return changeBeautyBeCost()"/>元&nbsp;&nbsp;
        	  <label for="makeBeautyRealCost">备注：</label>
        	  <input type="text" name="makeBeautyRealCost" id="makeBeautyRealCost" value="0" onchange="return changeBeautyRealCost()" style="width: 86px; ">元
        	  <input name="preMakeBeautyBeCost" id="preMakeBeautyBeCost" type="hidden" value="0"/>
        	  <input name="preMakeBeautyRealCost" id="preMakeBeautyRealCost" type="hidden" value="0"/>
            </p>
            <p>
              <input type="checkbox" id="leaveRoomBox" checked="checked" onchange="return cancelLeaveRoomCost()">
			  <label for="leaveRoomGrade">告别厅类型：</label>
			  <select name="leaveRoomGrade" id="leaveRoomGrade" onChange="return getLeaveRoomBeCost()">
				<option>-请选择-</option>
			  </select>&nbsp;&nbsp;
			  <label for="leaveRoomBeCost">应收费用：</label>
        	  <input type="text" name="leaveRoomBeCost" id="leaveRoomBeCost" value="0" style="width: 92px;" onchange="return changeLeaveRoomBeCost()"/>元&nbsp;&nbsp;
        	  <label for="leaveRoomRealCost">备注：</label>
        	  <input type="text" name="leaveRoomRealCost" id="leaveRoomRealCost" value="0" onchange="return changeLeaveRoomRealCost()" style="width: 86px; ">元
        	  <input name="preLeaveRoomBeCost" id="preLeaveRoomBeCost" type="hidden" value="0"/>
        	  <input name="preLeaveRoomRealCost" id="preLeaveRoomRealCost" type="hidden" value="0"/>
        	  <input name="preSetFarewellBeCost" id="preSetFarewellBeCost" type="hidden" value="0"/>
			</p>
			<p>
              <input type="checkbox" id="cremationBox" checked="checked" onchange="return cancelCremationCost()">
			  <label for="cremationGrade">火化炉类型：</label>
			  <select name="cremationGrade" id="cremationGrade" onChange="return getCremationBeCost()">
				<option>-请选择-</option>
				<option value="00">普通炉</option>
				<option value="01">捡灰炉</option>
				<option value="02">VIP区</option>
			  </select>&nbsp;&nbsp;
			  <label for="cremationBeCost">应收费用：</label>
        	  <input type="text" name="cremationBeCost" id="cremationBeCost" value="0" style="width: 92px;" onchange="return changeCremationBeCost()"/>元&nbsp;&nbsp;
        	  <label for="cremationRealCost">备注：</label>
        	  <input type="text" name="cremationRealCost" id="cremationRealCost" value="0" onchange="return changeCremationRealCost()" style="width: 86px; ">元
        	  <input name="preCremationBeCost" id="preCremationBeCost" type="hidden" value="0"/>
        	  <input name="preCremationRealCost" id="preCremationRealCost" type="hidden" value="0"/>
        	  <input name="preSetFurnaceBeCost" id="preSetFurnaceBeCost" type="hidden" value="0"/>
			</p>
			<p>
            <div id="funeralGoodsPart">
              <table border="1" width="95%" id="allFuneralGoods" align="center">
              	<tr>
              		<td align="center" colspan="13">
              			<label for="funeralGoods"><b>丧葬物品及其他小商品选择</b></label>
              		</td>
              	</tr>
              	<tr align="center">
              		<td><b>丧葬物品名称</b></td>
              		<td><b>应收金额</b></td>
              		<td><b>备注</b></td>
              		<td><b>库存</b></td>
              		<td><b>添加</b></td>
              		<td><b></b></td>
              		<td><b>&nbsp;</b></td>
              		<td><b></b></td>
              		<td><b>丧葬物品名称</b></td>
              		<td><b>应收金额</b></td>
              		<td><b>备注</b></td>
              		<td><b>库存</b></td>
              		<td><b>添加</b></td>
              	</tr>
              </table>
            </div>
            </p>
            <hr>
            <p>
              <label for="allBeCost"><b>火化服务费用应收：</b></label>
              <input type="text" name="allBeCost" id="allBeCost" value="0" style="width: 100px;" readonly/>元&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="hidden" id="allBeCostHidden" value="0">
              <label for="allRealCost"><b>火化服务费用备注：</b></label>
              <input type="text" name="allRealCost" id="allRealCost" value="0" style="width: 100px;" readonly/>元
            </p>
            <p>
              <label for="theWholeCost"><b>总费用：</b></label>
              <input type="text" name="theWholeCost" id="theWholeCost" value="0" style="width: 100px;" readonly/>元
              <input type="hidden" id="lastWholeCost" value="0">
            </p>
            <p>
              
              <input type="button" value="核算" style="margin-left:10px" onclick="return sumCost()">
              <label for="sumBeCost" style="margin-left:50px"><b>总应收：</b></label>
			  <input type="text" name="sumBeCost" id="sumBeCost" value="0" style="width: 100px;" readonly/>元
			  <label for="sumRealCost" style="margin-left:170px"><b>总备注：</b></label>
			  <input type="text" name="sumRealCost" id="sumRealCost" value="0" style="width: 100px;" readonly/>元
            </p>
            <hr>
            </p>
            <!--endprint1-->
            <p>
              <input type="button" name="printServiceList" id="printServiceList" value="生成服务详单" onclick="return outPutServiceList()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <input type="button" name="printServiceList" id="printServiceList" value="打印服务详单" onclick="return outPrintServiceList()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <input type="button" name="createSetOrder" id="createSetOrder" value="生成套餐单据" disabled="true" onclick="return outPutSetServiceOrder()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <input type="button" name="printSetServiceList" id="printSetServiceList" value="打印套餐单据" disabled="true" onclick="return outPrintSetServiceList()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <input type="button" name="ensureChoose" id="ensureChoose" value="确认服务" onclick="return decideYourChoose()" style="width: 125px; ">&nbsp;&nbsp;&nbsp;
              <br>
            </p>
            <hr>
              &nbsp;<a href="javascript:;" style="text-decoration:none;color:black;" onclick="javascript:CreatePrintPage();LODOP.PREVIEW();">税票打印</a>&nbsp;&nbsp;&nbsp;
			  <a href="javascript:;" style="text-decoration:none;color:black;" onclick="javascript:CreateCremationPrint();LODOP.PREVIEW();">火化证打印</a>&nbsp;&nbsp;&nbsp;
              <a href="javascript:;" style="text-decoration:none;color:black;" onclick="javascript:CreateSubsidyPrintPage();LODOP.PREVIEW();">惠民补助打印</a>&nbsp;&nbsp;&nbsp;
              <a href="javascript:;" style="text-decoration:none;color:black;" onclick="javascript:setDetailPrint();LODOP.PREVIEW();">套餐详情打印</a>
            <hr>
            <p>
            <!--- style="display:none"----------------------------------------------------------------------------- 打印单据 ---------------------------------------------------------------------------------------------->
            <div id="goodsPartList">
            <table  border="0" width="95%" id="basicInfo" style="font-size:12px;border-collapse:collapse;border:0px solid #000;margin-left:30;">
            	
            	<tr>
              		<td align="center" colspan="12">
              			<label for="funeralGoods"><b><font style="font-size:22px">东台市殡仪馆服务收费单</font></b></label>(东台分馆)
              		</td>
              	</tr>
              	<tr>
              		<td><b>当日序号：</b></td>
	              	<td id="currentDateTh2"></td>
	              	<td colspan="1"><b>No:</b></td>
	              	<td id="no" colspan="2"></td>
	              	<td colspan="1"><b>日期:</b></td>
	              	<td id="taxDate" colspan="6"></td>
              	</tr>
              	<tr>
	              	<td colspan="1"><b>姓名:</b></td>
	              	<td colspan="1" id="name"></td>
	              	<td colspan="1"><b>性别:</b></td>
	              	<td colspan="1" id="sex"></td>
	              	<td colspan="1"><b>年龄:</b></td>
	              	<td colspan="1" id="age"></td>
	              	<td colspan="1"><b>住址:</b></td>
	              	<td colspan="5" id="address"></td>
              	</tr>
            	
            </table>
            <table  border="2" width="95%" id="allGoods" style="font-size:12px;border-collapse:collapse;border:1px solid #000;margin-left:30;">
              	<tr align="left">
              		<td><b><font style="font-size:16px">名称</font></b></td>
              		<td><b><font style="font-size:16px">摘要</font></b></td>
              		<td><b><font style="font-size:16px">应收</font></b></td>
              		<td><b><font style="font-size:16px">备注</font></b></td>
              		
              		<td><b><font style="font-size:16px">名称</font></b></td>
              		<td><b><font style="font-size:16px">摘要</font></b></td>
              		<td><b><font style="font-size:16px">应收</font></b></td>
              		<td><b><font style="font-size:16px">备注</font></b></td>
              		
              		<td><b><font style="font-size:16px">名称</font></b></td>
              		<td><b><font style="font-size:16px">摘要</font></b></td>
              		<td><b><font style="font-size:16px">应收</font></b></td>
              		<td><b><font style="font-size:16px">备注</font></b></td>
              	</tr>
              	<tr>
              	    <td ><b>火化炉</b></td>
	              	<td id="cremation"></td>
	              	<td id="cremation1"></td>
	              	<td id="cremation2"></td>
	              	
	              	<td ><b>告别厅</b></td>
	              	<td id="farewell"></td>
	              	<td id="farewell1"></td>
	              	<td id="farewell2"></td>
	              	
	              	<td><b>骨灰盒</b></td>
	              	<td id="urn"></td>
	              	<td id="urn1"></td>
	              	<td id="urn2"></td>
              	</tr>
					<tr>
	              	<td ><b>整容</b></td>
	              	<td id="face"></td>
	              	<td id="face1"></td>
	              	<td id="face2"></td>
	              	
	              	<td ><b>租用冰棺</b></td>
	              	<td id="crystal"></td>
	              	<td id="crystal1"></td>
	              	<td id="crystal2"></td>
	              	
	              	<td ><b>守灵</b></td>
	              	<td id="watch"></td>
	              	<td id="watch1"></td>
	              	<td id="watch2"></td>
              	</tr>
              	<tr>
	              	<td><b>遗体接运</td>
	              	<td id="car"></td>
	              	<td id="car1"></td>
	              	<td id="car2"></td>
	              	<td><b>用棺接运</td>
	              	<td id="car3"></td>
	              	<td id="car4"></td>
	              	<td id="car5"></td>
	              	<td></td>
	              	<td></td>
	              	<td></td>
	              	<td></td>
              	</tr>
              	
              	<tbody id="all"></tbody>
              	
              	<tr>
              		<td><b>费用应收</b></td>
	              	<td colspan="1" id="beCost"></td>
	              	
	              	<td><b>备注</b></td>
	              	<td colspan="1" id="charge"></td>
	              	
	              	<td><b>费用实收</b></td>
	              	<td colspan="1" id="total"></td>
	              	
	              	<td colspan="1"><b>大写</b></td>
	              	<td colspan="5" id="capitalMoney"></td>
              	</tr>
              	<tr>
	              	<td colspan="1"><b>开票员</b></td>
	              	<td colspan="3"></td>
	              	<td colspan="1"><b>管理员</b></td>
	              	<td colspan="7"></td>
              	</tr>
              	<tr>
	              	<td colspan="4"><b>(明白消费  确认签字) 客户主办人签字</b></td>
	              	<td colspan="8"></td>
              	</tr>
              </table>
            </div>
            <!------------------------------------------------------------ 打印单据 -------------------------------------------------------------------------></p>
            <div id="setGoodsPartList">
	            <table  border="0" width="95%" id="setBasicInfo" style="font-size:12px;border-collapse:collapse;border:0px solid #000;margin-left:30;">
	            	<tr>
	              		<td align="center" colspan="12">
	              			<label><b><font style="font-size:22px">东台市殡仪馆服务收费单</font></b></label>(东台分馆)
	              		</td>
	              	</tr>
	              	<tr>
	              		<td><b>当日序号：</b></td>
	              		<td id="currentDateTh"></td>
		              	<td colspan="1"><b>No:</b></td>
		              	<td id="setNo" colspan="2"></td>
		              	
		              	<td colspan="1"><b>日期:</b></td>
		              	<td id="setTaxDate" colspan="6"></td>
	              	</tr>
	              	<tr>
		              	<td colspan="1"><b>姓名:</b></td>
		              	<td colspan="1" id="setName"></td>
		              	<td colspan="1"><b>性别:</b></td>
		              	<td colspan="1" id="setSex"></td>
		              	<td colspan="1"><b>年龄:</b></td>
		              	<td colspan="1" id="setAge"></td>
		              	<td colspan="1"><b>住址:</b></td>
		              	<td colspan="5" id="setAddress"></td>
	              	</tr>
	            </table>
	            <table border="2" width="95%" height="22%" id="setAllGoods" style="font-size:12px;border-collapse:collapse;border:1px solid #000;margin-left:30;">
	            	<tr>
	            		<td colspan="1" width="15%"><b>项目</b></td>
	            		<td colspan="1"><b>金额</b></td>
	            		<td colspan="8" width="80%"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem1"></td>
	            		<td colspan="1" id="itemPrice1"></td>
	            		<td colspan="8" id="setServiceDetail"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem2"></td>
	            		<td colspan="1" id="itemPrice2"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem3"></td>
	            		<td colspan="1" id="itemPrice3"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem4"></td>
	            		<td colspan="1" id="itemPrice4"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem5"></td>
	            		<td colspan="1" id="itemPrice5"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem6"></td>
	            		<td colspan="1" id="itemPrice6"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem7"></td>
	            		<td colspan="1" id="itemPrice7"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem8"></td>
	            		<td colspan="1" id="itemPrice8"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="15%" id="setItem9"></td>
	            		<td colspan="1" id="itemPrice9"></td>
	            		<td colspan="8"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="10%"><b>合计</b></td>
	            		<td colspan="1" id="setAllCost"></td>
	            		<td colspan="1"><b>大写</b></td>
	            		<td colspan="7" id="setAllCostUp" width="70%"></td>
	            	</tr>
	            	<tr>
	            		<td colspan="1" height="10%"><b>开票员</b></td>
	            		<td colspan="1" ></td>
	            		<td colspan="1"><b>管理员</b></td>
	            		<td colspan="1" width="10%"></td>
	            		<td colspan="2"><b>(明白消费 确认签字)</b></td>
	            		<td colspan="1"><b>客户签字</b></td>
	            		<td colspan="3" width="30%"></td>
	            	</tr>
	            </table>
            </div>
          </form>
          <p>&nbsp;</p>
        </div>
     <!--———————————————————————————4.打印费用清单—————————————  ——————————————————-->
</div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
<script src="js/createHttpRequest.js">
	//创建XMLHttpRequest对象
</script>

</html>
