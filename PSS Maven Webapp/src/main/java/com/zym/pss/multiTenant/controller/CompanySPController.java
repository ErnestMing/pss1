package com.zym.pss.multiTenant.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zym.pss.multiTenant.vo.CompanySP;
import com.zym.pss.multiTenant.po.Tenant;
import com.zym.pss.multiTenant.service.CompanySPService;
import com.zym.pss.multiTenant.service.TenantService;
import com.zym.pss.util.UtilFuns;
import com.zym.pss.core.controller.BaseController;

@Controller
@RequestMapping("/multimm/companysp")
public class CompanySPController extends BaseController {

	@Resource
	CompanySPService companySPService ;
	
	@Resource
	TenantService tenantService ; 
	
	//存放列表信息
	private List<CompanySP> dataList ;		
	
	
	/**
	 * 跳转到列表页面
	 * month : 查询的月份
	 */
	@RequestMapping("/list.action")
	public String list(Model model,String month){
		
		Map<String,Object> paraMap = new HashMap<String,Object>();
		if(UtilFuns.isEmpty(month)){
			month = new SimpleDateFormat("yyyy-MM").format(new Date()).toString();
		}
		
		paraMap.put("month",month);
		dataList = companySPService.find(paraMap);
		model.addAttribute("dataList",dataList);
		
		return "/multimm/companysp/jCompanySPList.jsp" ; 
	}
	
	@RequestMapping("toview")
	public String toview (String tenantId , Model model ){
		Tenant tenant = this.tenantService.get(tenantId);
		
		model.addAttribute("obj",tenant);
		return "/multimm/tenantadmin/tenant/jTenantView.jsp";
	}
}
