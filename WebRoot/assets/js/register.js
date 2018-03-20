/**
 * 
 */
function register()               //用户登录
{
	var passwd1=document.form.passWord.value;  
    var passwd2=document.form.passWord1.value;
	var workID=document.getElementById("workID");//获取工号
	var userID=document.getElementById("userID");//获取身份证
	var userName=document.getElementById("userName");//获取员工姓名
	var passWord=document.getElementById("passWord");//获取密码
	var passWord1=document.getElementById("passWord1");//获取确认密码
	var data="";
	data = "workID=" + workID.value+ "&userID=" + userID.value+ "&userName=" + userName.value + "&passWord=" + passWord.value  + "&passWord1=" + passWord1.value; //拼接数据json字符串
	var url = "/FuneralManage/RegisterAction!userRegister";
//	checkuserID();
//	if(checkuserID.result!=Errors[0]){
//		document.form.userID.innerText="";
//	}else 
	if (passwd1 != passwd2) {
     	alert("两次输入的密码不一致，请重新输入")
         document.form.passWord.innerText="";
         document.form.passWord1.innerText="";
     } else {
    	 sendRequest("post", url, data, RegisterBack);
     }	     
}  
/*
 * 身份证号码验证
 */
function checkuserID(userID){ 
var Errors=new Array( 
"验证通过!", 
"身份证号码位数不对!", 
"身份证号码出生日期超出范围或含有非法字符!", 
"身份证号码校验错误!", 
"身份证地区非法!" 
); 
var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"} 

var userID,Y,JYM; 
var S,M; 
var userID_array = new Array(); 
userID_array = userID.split(""); 

//地区检验 
if(area[parseInt(userID.substr(0,2))]==null) return Errors[4]; 
alert(Errors[4]); 

//身份号码位数及格式检验 
switch(userID.length){ 
case 15: 
if ( (parseInt(userID.substr(6,2))+1900) % 4 == 0 || ((parseInt(userID.substr(6,2))+1900) % 100 == 0 && (parseInt(userID.substr(6,2))+1900) % 4 == 0 )){ 
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性 
} else { 
ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性 
} 

if(ereg.test(userID)) return Errors[0]; 
else return Errors[2]; 
break; 
case 18: 
//18位身份号码检测 
//出生日期的合法性检查 
//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9])) 
//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])) 
if ( parseInt(userID.substr(6,4)) % 4 == 0 || (parseInt(userID.substr(6,4)) % 100 == 0 && parseInt(userID.substr(6,4))%4 == 0 )){ 
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
} else { 
ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
} 
if(ereg.test(userID)){//测试出生日期的合法性 
//计算校验位 
S = (parseInt(userID_array[0]) + parseInt(userID_array[10])) * 7 
+ (parseInt(userID_array[1]) + parseInt(userID_array[11])) * 9 
+ (parseInt(userID_array[2]) + parseInt(userID_array[12])) * 10 
+ (parseInt(userID_array[3]) + parseInt(userID_array[13])) * 5 
+ (parseInt(userID_array[4]) + parseInt(userID_array[14])) * 8 
+ (parseInt(userID_array[5]) + parseInt(userID_array[15])) * 4 
+ (parseInt(userID_array[6]) + parseInt(userID_array[16])) * 2 
+ parseInt(userID_array[7]) * 1 
+ parseInt(userID_array[8]) * 6 
+ parseInt(userID_array[9]) * 3 ; 
Y = S % 11; 
M = "F"; 
JYM = "10X98765432"; 
M = JYM.substr(Y,1);//判断校验位 
if(M == userID_array[17]) return Errors[0]; //检测ID的校验位 
else return Errors[3]; 
} 
else return Errors[2]; 
break; 
default: 
return Errors[1]; break; 
} 
}

function RegisterBack(result)       //注册回调函数
	{
		var rs = eval("(" + eval("(" + result + ")") + ")");
		if(rs.success=="注册成功！"){          //注册成功
			setTimeout(tiao, 500 );        //设置延时函数，延时跳转
		}
	
	else{
	alert(rs.error);              //注册失败
}
}
	
function tiao(){
window.location.href="Login.html";    //跳转到系统登录页面
}

	
