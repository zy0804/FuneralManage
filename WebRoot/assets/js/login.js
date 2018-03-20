/**
 * 
 */
function login()               //用户登录
{
	var workID=document.getElementById("workID");//获取用户名
	var passWord=document.getElementById("passWord");//获取密码
	var data="";
	data = "workID=" + workID.value + "&passWord=" + passWord.value   //拼接数据json字符串
	
	var url = "/FuneralManage/LoginAction!userLogin";
	sendRequest("post", url, data, LoginBack);  //发送请求
}


function LoginBack(result)       //登录回调函数
{
	var rs = eval("(" + eval("(" + result + ")") + ")");
	if(rs.success=="登录成功！"){          //登录成功
		setTimeout(tiao, 500 );        //设置延时函数，延时跳转
		
		
		
	}else{
		alert(rs.error);              //登录失败
		document.getElementById("workID").value="";
		document.getElementById("passWord").value="";
		document.getElementById("workID").onfocus;
		
	}
}
function tiao(){
	window.location.href="index.jsp";    //跳转到系统操作页面
}