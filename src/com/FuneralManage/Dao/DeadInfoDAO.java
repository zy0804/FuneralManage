package com.FuneralManage.Dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import com.FuneralManage.entity.DeadInfo;

public class DeadInfoDAO extends BaseDAO{

	public DeadInfoDAO(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}
	public String judgeDeadInfo(DeadInfo deadInfo) {         //判断该逝者的身份证号是否登记过
		String sql = "select deadName from remainsIn where deadId=?";
		return this.getForJsonTran(sql,deadInfo.deadId);
		
	}
	public int alterDeadInvoiceAndSubsidyInfo(DeadInfo deadInfo) {        //更新逝者信息
		String sql = "update remainsin set invoiceNo=?, subsidyNo=?, subsidyMoney=?, dealerId=?, dealerName=?, directorName=?, dealerAddress=?, deadTime=?, deadType=?, deadReason=?, address=?, proofUnit=?, memo=?, memberMobile=?, deadSex=?, deadAge=?, deadName=?, pathogeny=?, operatorRelation=?, deadResidence=?, ashesDisposition=?,benefitTime=? where deadId=?";
		return this.saveOrUpdateOrDelete(sql,deadInfo.invoiceNo,deadInfo.subsidyNo,deadInfo.subsidyMoney,deadInfo.dealerId,deadInfo.dealerName,deadInfo.directorName,deadInfo.dealerAddress,deadInfo.deadTime,deadInfo.deadKind,deadInfo.deadReason,deadInfo.deadAddress,deadInfo.deadProveUnit,deadInfo.deadExtraInfo,deadInfo.memberMobile,deadInfo.deadSex,deadInfo.deadAge,deadInfo.deadName,deadInfo.pathogeny,deadInfo.operatorRelation,deadInfo.deadResidence,deadInfo.ashesDisposition,deadInfo.benefitTime,deadInfo.deadId);

		
	}
	public String  judgeRemainsNumber(DeadInfo deadInfo) {               //判断该遗体编号是否被使用
		String curDate=deadInfo.inTime;
		String curDay=curDate.substring(0,10);
		String startDate=null;
		String endDate=null;
		startDate = curDay+" 00:00:00";
		endDate = curDay+" 23:59:59";
		String sql = "select deadName from remainsIn where remainsNumber=? and inTime BETWEEN STR_TO_DATE('"+startDate+"','%Y-%m-%d %H:%i:%s')AND STR_TO_DATE('"+endDate+"','%Y-%m-%d %H:%i:%s')";
		return this.getForJsonTran(sql,deadInfo.deadNumber);

		
	}
	public int deadInfoRegister(DeadInfo deadInfo) {               //插入一条新的逝者信息
	
		String sql = "insert into remainsIn(deadID,deadName,deadSex,memberMobile,remainsNumber,deadType,deadAge,inTime,address,proofUnit,memo,deadReason,deadTime,dealerId,dealerName,dealerAddress,directorName,pathogeny,operatorRelation,deadResidence,ashesDisposition,benefitTime,subsidyMoney,invoiceNo,subsidyNo)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return this.saveOrUpdateOrDelete(sql,deadInfo.deadId,deadInfo.deadName,deadInfo.deadSex,deadInfo.memberMobile,deadInfo.deadNumber,deadInfo.deadKind,deadInfo.deadAge,deadInfo.inTime,deadInfo.deadAddress,deadInfo.deadProveUnit,deadInfo.deadExtraInfo,deadInfo.deadReason,deadInfo.deadTime,deadInfo.dealerId,deadInfo.dealerName,deadInfo.dealerAddress,deadInfo.directorName,deadInfo.pathogeny,deadInfo.operatorRelation,deadInfo.deadResidence,deadInfo.ashesDisposition,deadInfo.benefitTime,deadInfo.subsidyMoney,deadInfo.invoiceNo,deadInfo.subsidyNo);

	}

}
