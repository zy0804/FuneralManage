package com.FuneralManage.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterService extends BaseService{
	
	private String returnString;
	public String getReturnsString() {
		return returnString;
	}
	public void setReturnsString(String returnsString) {
		this.returnString = returnsString;
	}	
	public  String addUser(String workID, String userName, String userID, String passWord){
			Connection conn=DBDao.openDateBase("dongtai");
			int lag = 0;
			if(conn!=null){
				String sql="insert into user(workID,userName,userID,passWord)values(?,?,?,?)";
				try{
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, workID);
					ps.setString(2, userName);
					ps.setString(3, userID);
					ps.setString(4, passWord);
					lag = ps.executeUpdate();
					if (lag > 0) 
					{
						returnString= "true";
					}
					else
					{
						returnString="false";
					}
					
					ps.close();
					conn.close();
				}
				catch(SQLException e){
					returnString="数据库操作失败!";
					e.printStackTrace();
					return returnString;
				}
			}
			return returnString;
		}
		
	}
