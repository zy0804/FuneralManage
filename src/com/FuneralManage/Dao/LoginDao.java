package com.FuneralManage.Dao;

import javax.mail.Session;
import javax.sql.DataSource;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;

public class LoginDao extends BaseDAO{
	
	public LoginDao(DataSource dataSource) {
		super(dataSource);
	}
	private String returnString;
	public String getReturnString() {
		return returnString;
	}

	public void setReturnString(String returnString) {
		this.returnString = returnString;
	}

	

	public String Userlogin(String workID,String passWord) {
		
		String sql = "select userName from user where workID = ? and passWord = ?";
		
		String  userName =  this.getForJson(sql,workID,passWord);
		
		if (userName.length()>2) {
			
			//将jsonArray字符串转化为JSONArray数组 
		    JSONArray jsonArray = JSONArray.fromObject(userName); 
		    //取出数组第一个元素 jsonObject
		    JSONObject User = jsonArray.getJSONObject(0);
		    //取出jsonObject中存的值
		    String name =  User.get("userName").toString();
		    //将用户名存入session中 
			ActionContext.getContext().getSession().put("userName", name);
			//设置session生命周期为3600秒
			 ServletActionContext.getRequest().getSession().setMaxInactiveInterval(0);
			returnString="true";
			
		}else {
			returnString="false";
		}
		return returnString;
		
		
	}
	

}
