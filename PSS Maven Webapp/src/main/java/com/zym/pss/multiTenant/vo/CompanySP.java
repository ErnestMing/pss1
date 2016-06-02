package com.zym.pss.multiTenant.vo;

import java.io.Serializable;

/**
 * @Description:企业销售与采购情况VO类
 * @Author: zym
 * @CreateDate: 2016年1月7日
 */
public class CompanySP implements Serializable{
	
	private static final long serialVersionUID = -4544412193407147640L;

	private String tenantId ; 				//企业租户ID
	private String company ; 				//企业名称
	private Double saleAmount ;				//销售总金额
	private Double purchaseAmount ; 		//采购总金额
	
	private Double profitLoss ; 			//盈亏

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Double getSaleAmount() {
		return saleAmount;
	}

	public void setSaleAmount(Double saleAmount) {
		this.saleAmount = saleAmount;
	}

	public Double getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(Double purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public Double getProfitLoss() {
		return profitLoss;
	}

	public void setProfitLoss(Double profitLoss) {
		this.profitLoss = profitLoss;
	}
}
