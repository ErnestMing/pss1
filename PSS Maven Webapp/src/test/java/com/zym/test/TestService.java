package com.zym.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.zym.pss.multiTenant.po.Tenant;
import com.zym.pss.multiTenant.service.TenantService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:beans.xml","classpath:springmvc-servlet.xml","classpath:sqlMapConfig.xml"})
@WebAppConfiguration
@Transactional
@TransactionConfiguration(defaultRollback = false , transactionManager = "txManager")
public class TestService {

	@Resource
	TenantService tenantService ; 
	
	@Test
	public void test01(){
		List<Tenant> list = this.tenantService.find(null);
		System.out.println(list);
	}
	
	//初始化数据
	@Test
	public void init(){
		/*//创建超级管理员
		Tenant tenantAdmin = new Tenant();
		tenantAdmin.setName("tenantadmin");
		tenantAdmin.setPassword("111111");
		tenantAdmin.setTenantNo("tenantadmin");
		tenantService.insert(tenantAdmin);
		
		//创建租户01
		Tenant t1 = new Tenant() ; 
		t1.setName("tenant01");
		t1.setTenantNo("tenant01");
		t1.setPassword("111111");
		tenantService.insert(t1);

		//创建租户02
		Tenant t2 = new Tenant() ; 
		t2.setName("tenant02");
		t2.setTenantNo("tenant02");
		t2.setPassword("111111");
		tenantService.insert(t2);
		
		//创建租户03
		Tenant t3 = new Tenant() ; 
		t3.setName("tenant03");
		t3.setTenantNo("tenant03");
		t3.setPassword("111111");
		tenantService.insert(t3);*/
		
	}
}
