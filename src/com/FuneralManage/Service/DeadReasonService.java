package com.FuneralManage.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeadReasonService extends BaseService
{
	private String returnString;
	
	public String getDeadReason()
	{
		Connection conn=DBDao.openDateBase("dongtai");
		if (conn != null)
		{
			String sql = "select * from deadReason";
			ResultSet rs=null;
			PreparedStatement ps = null;
			try
			{
				ps=conn.prepareStatement(sql);		
				String result = "";
				rs=ps.executeQuery();				
				while(rs.next())
				{					 
					 result = result + "{reasonName:\""+rs.getString("reasonName")+"\"},";					 
				}							
				result = result.substring(0, result.length()-1);							
				returnString = "[" + result + "]";				
				
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			finally{
				try {
					ps.close();
					rs.close();
					conn.close();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}		
		return returnString;
	}

}
