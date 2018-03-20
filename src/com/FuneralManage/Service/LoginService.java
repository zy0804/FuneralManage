package com.FuneralManage.Service;

import com.FuneralManage.Dao.LoginDao;

public class LoginService extends BaseService{
	
	private String returnString;
	public String getReturnsString() {
		return returnString;
	}
	public void setReturnsString(String returnsString) {
		this.returnString = returnsString;
	}
	public String loginService(String workID,String passWord) {
		LoginDao loginDao = new LoginDao(dataSource);
		if (workID!=null&&passWord!=null) {
			returnString=loginDao.Userlogin(workID, passWord);			
		}else {
			returnString="false";
		}
		
		return returnString;
		
		
	}

}
