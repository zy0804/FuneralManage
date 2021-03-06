package com.FuneralManage.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.FuneralManage.Dao.WarehouseBalanceDAO;
import com.FuneralManage.Dao.WarehouseMoveDAO;
import com.FuneralManage.Utility.TransactionManager;

public class WarehouseMoveService extends BaseService {
	private WarehouseBalanceDAO warehouseBalanceDao = new WarehouseBalanceDAO(dataSource);
	private WarehouseMoveDAO warehouseMoveDAO = new WarehouseMoveDAO(dataSource);
	private TransactionManager transactionManager=new TransactionManager(dataSource);
	
	/**
	 * 保存调拨信息
	 * @param warehouseMoveNumber 调拨单号
	 * @param goodsList 商品信息
	 * @return 保存结果
	 */
	public boolean addWarehouseMove(String warehouseMoveNumber,
			List<Map<String, String>> goodsList) {
		// TODO Auto-generated method stub
		try {
			transactionManager.start();
			// 遍历商品信息
			for (Map<String, String> map : goodsList)
			{
				String outWarehouse = map.get("outWarehouse");// 调出仓库
				String goodsName = map.get("goodsName");// 品名
				int moveAmount = Integer.parseInt(map.get("moveAmount"));// 调拨数量
				// 添加调拨信息
				warehouseMoveDAO.addWarehouseMoveTran(warehouseMoveNumber, map);
				// 减少库存量
				warehouseBalanceDao.reduceWarehouseBalanceTran(outWarehouse, goodsName, moveAmount);
			}
			transactionManager.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			transactionManager.rollback();
			return false;
		} finally {
			transactionManager.close();
		}
		return true;
	}

	/**
	 * 重置库存信息
	 * @param goodsList 商品信息
	 * @return 重置结果，true为重置成功，false为失败
	 */
	public boolean resetLocalWarehouseBalance(
			List<Map<String, String>> goodsList) {
		// TODO Auto-generated method stub
		try {
			transactionManager.start();
			// 删除本地调拨单
			warehouseMoveDAO.deleteLocalWarehouseMoveTran();
			// 遍历商品信息
			for (Map<String, String> map : goodsList)
			{
				String outWarehouse = map.get("outWarehouse");// 调出仓库
				String goodsName = map.get("goodsName");// 品名
				int moveAmount = Integer.parseInt(map.get("moveAmount"));// 调拨数量
				// 增加库存量
				warehouseBalanceDao.increaseWarehouseBalanceTran(outWarehouse, "", goodsName, "", moveAmount);	
			}
			transactionManager.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			transactionManager.rollback();
			return false;
		} finally {
			transactionManager.close();
		}
		return true;
	}

	/**
	 * 获取调拨单信息
	 * @param staffName 业务人员
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param outWarehouse 调出仓库
	 * @param inWarehouse 调入仓库
	 * @param pageNum 当前页数
	 * @param pageSize 每页记录数
	 * @return 调拨单信息
	 */
	public String getWarehouseMoves(String staffName, String startTime,
			String endTime, String outWarehouse, String inWarehouse,
			int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		// 获取调拨单信息
		return warehouseMoveDAO.getWarehouseMoves(staffName, startTime, endTime,
				outWarehouse, inWarehouse, pageNum, pageSize);
	}

	/**
	 * 获取分页数
	 * @param staffName 业务人员
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param outWarehouse 调出仓库
	 * @param inWarehouse 调入仓库
	 * @param pageSize 每页记录数
	 * @return 分页数
	 */
	public String getPageCount(String staffName, String startTime,
			String endTime, String outWarehouse, String inWarehouse,
			int pageSize) {
		// TODO Auto-generated method stub
		// 获取分页数
		return warehouseMoveDAO.getPageCount(staffName, startTime, endTime, outWarehouse,
				inWarehouse, pageSize);
	}

	/**
	 * 获取调拨单主信息
	 * @param warehouseMoveNumber 调拨单号
	 * @return 调拨单主信息
	 */
	public String getWarehouseMove(String warehouseMoveNumber) {
		// TODO Auto-generated method stub
		// 获取调拨单主信息
		return warehouseMoveDAO.getWarehouseMove(warehouseMoveNumber);
	}

	/**
	 * 获取调拨单明细信息
	 * @param warehouseMoveNumber 调拨单号
	 * @return 调拨单明细信息
	 */
	public String getWarehouseMoveDetails(String warehouseMoveNumber) {
		// TODO Auto-generated method stub
		// 获取调拨单明细信息
		return warehouseMoveDAO.getWarehouseMoveDetails(warehouseMoveNumber);
	}

	/**
	 * 删除调拨单
	 * @param warehouseMoveNumber 调拨单号
	 * @return 删除结果，true为删除成功，false为失败
	 */
	public boolean deleteWarehouseMove(String warehouseMoveNumber) {
		// TODO Auto-generated method stub
		// 删除调拨单
		return warehouseMoveDAO.deleteWarehouseMoveTran(warehouseMoveNumber);
	}

}
