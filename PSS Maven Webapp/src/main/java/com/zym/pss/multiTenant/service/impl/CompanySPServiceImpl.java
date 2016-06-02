package com.zym.pss.multiTenant.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zym.pss.multiTenant.dao.CompanySPDao;
import com.zym.pss.multiTenant.vo.CompanySP;
import com.zym.pss.multiTenant.service.CompanySPService;
import com.zym.pss.core.service.impl.BaseServiceImpl;

@Service("companySPService")
public class CompanySPServiceImpl extends BaseServiceImpl<CompanySP> implements CompanySPService{
	
	CompanySPDao companySPDao ;
	@Resource
	public void setCompanySPDao(CompanySPDao companySPDao) {
		super.setBaseDao(companySPDao);
		this.companySPDao = companySPDao;
	}
}	
