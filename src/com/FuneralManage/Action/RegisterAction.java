package com.FuneralManage.Action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.FuneralManage.Service.LoginService;
import com.FuneralManage.Service.RegisterService;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String workID;
	private String userID;
	private String userName;
	private String passWord;
	private String passWord1;
	public String getPassWord1() {
		return passWord1;
	}
	public void setPassWord1(String passWord1) {
		this.passWord1 = passWord1;
	}

	private String returnString;
	
	public String getWorkID() {
		return workID;
	}
	public void setWorkID(String workID) {
		this.workID = workID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getReturnString() {
		return returnString;
	}
	public void setReturnString(String returnString) {
		this.returnString = returnString;
	} 
		
	public String userRegister() throws Exception{
		RegisterService userService=new RegisterService();
		returnString = userService.addUser(workID,userName,userID,passWord);
		
		if (returnString=="true") {
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("success", "注册成功！");
			JSONObject json = JSONObject.fromObject(map);
			returnString = json.toString();
			System.out.println(returnString);
			return "success";
		}else {
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("error", "注册失败！");
			JSONObject json = JSONObject.fromObject(map);
			returnString = json.toString();
			System.out.println(returnString);
			return "error";
	}
	
	}
}
