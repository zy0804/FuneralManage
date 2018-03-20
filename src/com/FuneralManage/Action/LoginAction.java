package com.FuneralManage.Action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



import net.sf.json.JSONObject;

import com.FuneralManage.Service.LoginService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport
{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		private String workID;
		private String passWord;
		private String returnString; 
			
	
		
		public String getReturnString() {
			return returnString;
		}

		public void setReturnString(String returnString) {
			this.returnString = returnString;
		}

		public String getWorkID() {
			return workID;
		}
		
		public void setWorkID(String workID) {
			this.workID = workID;
		}
	
		public String getPassWord() {
			return passWord;
		}

		public void setPassWord(String passWord) {
			this.passWord = passWord;
		}
		
public String userLogin() throws Exception {

	LoginService userService=new LoginService();
	returnString = userService.loginService(workID, passWord);
	if (returnString=="true") {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("success", "登录成功！");
		JSONObject json = JSONObject.fromObject(map);
		returnString = json.toString();
		return "success";
	}else {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("error", "登录失败！用户名或密码不正确,请重新输入！");
		JSONObject json = JSONObject.fromObject(map);
		returnString = json.toString();
		return "error";	
	}
    }
}
