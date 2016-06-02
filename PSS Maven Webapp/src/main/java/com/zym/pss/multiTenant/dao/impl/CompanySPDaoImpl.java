package com.zym.pss.multiTenant.dao.impl;

import org.springframework.stereotype.Repository;

import com.zym.pss.multiTenant.dao.CompanySPDao;
import com.zym.pss.multiTenant.vo.CompanySP;
import com.zym.pss.core.dao.impl.BaseDaoImpl;

@Repository("companySPDao")
public class CompanySPDaoImpl extends BaseDaoImpl<CompanySP> implements CompanySPDao {

	//设置命名空间
	public CompanySPDaoImpl() {
		super.setNs("com.zym.pss.multiTenant.mapper.CompanySPMapper");
	}
}
