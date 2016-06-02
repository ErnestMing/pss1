package com.zym.pss.cargo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zym.pss.baseinfo.po.Material;
import com.zym.pss.baseinfo.po.Supplier;
import com.zym.pss.baseinfo.service.MaterialService;
import com.zym.pss.baseinfo.service.SupplierService;
import com.zym.pss.cargo.po.Order;
import com.zym.pss.cargo.po.PurchaseOrder;
import com.zym.pss.cargo.service.OrderService;
import com.zym.pss.cargo.service.PurchaseOrderService;
import com.zym.pss.core.controller.BaseController;
import com.zym.pss.sysadmin.vo.UserVo;

@Controller
@RequestMapping("/cargo/purchaseorder")
public class PurchaseOrderController extends BaseController{
	
	@Resource
	OrderService orderService ;		//订单Service
	@Resource	
	private SupplierService supplierService;		//提供商Service
	@Resource
	private MaterialService materialService ; 		//原材料Service
	@Resource
	private PurchaseOrderService purchaseOrderService ;//采购订单Service
	
	//存放列表信息
	private List<Order> dataList ;	
		
	/**
	 * 跳转到采购订单列表页面
	 */
	@RequestMapping("/list.action")
	public String purchase_list(Model model,HttpSession session ){
		//获取当前用户
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("tenantId", curuser.getTenantId());
		paraMap.put("orderType", "1");
		
		dataList = orderService.find(paraMap);
		
		model.addAttribute("dataList",dataList);
		model.addAttribute("orderState",Order.ORDER_STATE_MAP);
		
		return "/cargo/purchaseorder/jOrderList.jsp" ; 
	}
	@RequestMapping("/toview.action")
	public String toview(String id , Model model,HttpSession session ){
		//获取当前用户
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		
		Order obj = this.orderService.get(id);
		
		//通过订单编号查询订单下的货物列表
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("orderNo", obj.getOrderNo());
		paraMap.put("tenantId", curuser.getTenantId());
		
		List<PurchaseOrder> goodsList = this.purchaseOrderService.find(paraMap);
		model.addAttribute("goodsList",goodsList);
		
		model.addAttribute("obj",obj);

		return "/cargo/purchaseorder/jOrderView.jsp";
	}
	/**
	 * 跳到添加页面
	 */
	@RequestMapping("/tocreate.action")
	public String tocreate(){
		return "/cargo/purchaseorder/jOrderCreate.jsp";
	}
	/**
	 * 添加
	 */
	@RequestMapping("/insert.action")
	public String create(Order order,HttpSession session ){
		//获取租户信息
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		String tenantId = curuser.getTenantId() ; 
		
		order.setTenantId(tenantId);
		
		this.orderService.insert(order);

		return "redirect:/cargo/purchaseorder/list.action";
	}
	/**
	 * 跳到更新页面
	 */
	@RequestMapping("/toupdate.action")
	public String toupdate(String id,Model model){
		Order obj = this.orderService.get(id);
		if(obj.getState() == 1){
			model.addAttribute("obj",obj);
			return "/cargo/purchaseorder/jOrderUpdate.jsp";
		}else{
			return "redirect:/cargo/purchaseorder/list.action";
		}
	}
	/**
	 * 更新
	 */
	@RequestMapping("/update.action")
	public String update(Order order){
		this.orderService.update(order);
		return "redirect:/cargo/purchaseorder/list.action";
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping("/delete.action")
	public String delete(@RequestParam("id")String[] ids){
		for(int i = 0 ; i < ids.length;i++){
			Order o = orderService.get(ids[i]);
			if(o.getState() == 1 ){
				this.orderService.delete(new String[]{ids[i]});
			}
		}
		return "redirect:/cargo/purchaseorder/list.action";
	}
	/**
	 * 上报订单
	 * @param id
	 * @return
	 */
	@RequestMapping("/start.action")
	public String start(@RequestParam("id")String[] ids){
		for(int i = 0 ; i < ids.length;i++){
			Order o = orderService.get(ids[i]);
			if(o.getState() == 1 || o.getState() == 4 ){					//只有当 订单的状态为 未上报/未通过 状态时,才可以上报.其他状态都不可以上报
				this.orderService.updateState(new String[]{ids[i]},2);
			}
		}
		return "redirect:/cargo/purchaseorder/list.action";
	}
	@RequestMapping("/check.action")
	public String check(@RequestParam("id")String[] ids){
		for(int i = 0  ; i < ids.length;i++){
			Order o = orderService.get(ids[i]);
			if(o.getState() == 2 ){							//只有当订单状态为待审核状态时,才可以审核
				this.orderService.updateState(new String[]{ids[i]},3);
			}
		}
		return "redirect:/cargo/order/orderreview.action";
	}
	/**
	 * 取消订单
	 * @param ids
	 * @return
	 */
	@RequestMapping("/cancel.action")
	public String cancel(@RequestParam("id")String[] ids){
		this.orderService.updateState(ids,1);
		return "redirect:/cargo/purchaseorder/list.action";
	}

	//---------------------------------------------------------------订单下原材料的CRUD--------------------------------------------------
	/**
	 * 跳转到订单原材料添加页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toaddmaterial.action")
	public String toAddMaterial(String orderNo ,Model model,HttpSession session ){
		//获取当前用户
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		Map<String,Object> paraMap1 = new HashMap<String,Object>();
		paraMap1.put("tenantId", curuser.getTenantId());
		
		//准备原材料下拉列表
		List<Material> materialList = this.materialService.find(paraMap1);
		//准备供应商下拉列表
		List<Supplier> supplierList = this.supplierService.find(paraMap1);
		
		//查询该订单下的采购信息
		Map<String,Object> paraMap  = new HashMap<String,Object>();
		paraMap.put("tenantId", curuser.getTenantId());
		paraMap.put("orderNo", orderNo);		//获取订单编号
		List<PurchaseOrder> purchaseOrderList = this.purchaseOrderService.find(paraMap);
		
		//返回到页面
		model.addAttribute("materialList",materialList);
		model.addAttribute("supplierList",supplierList);
		model.addAttribute("orderNo",orderNo);
		model.addAttribute("purchaseOrderList",purchaseOrderList);
		
		
		return "/cargo/purchaseorder/jPOMaterialCreate.jsp";
	}
	/**
	 * 给订单添加原材料
	 * @param OrderId
	 * @param materialNo
	 * @param supplierNo
	 * @param purchaseAmount
	 * @return
	 */
	@RequestMapping("/addmaterial.action")
	public String addMaterial(PurchaseOrder purchaseOrder,String orderNo , Model model,HttpSession session ){
		//获取租户信息
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		String tenantId = curuser.getTenantId() ; 
		
		purchaseOrder.setTenantId(tenantId);
		
		this.purchaseOrderService.insert(purchaseOrder);
		
		//传递订单ID到 --  新增+列表页面
		model.addAttribute("orderNo", orderNo);
		return "redirect:/cargo/purchaseorder/toaddmaterial.action";
	}
	
	/**
	 * 跳转到订单原材料添加页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toupdatematerial.action")
	public String toUpdateMaterial(String id ,String orderNo , Model model,HttpSession session ){
		//获取当前用户
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("tenantId", curuser.getTenantId());
		
		//准备原材料下拉列表
		List<Material> materialList = this.materialService.find(paraMap);
		//准备供应商下拉列表
		List<Supplier> supplierList = this.supplierService.find(paraMap);
		
		//获取要修改的订单原材料信息
		PurchaseOrder obj = this.purchaseOrderService.get(id);
		
		//返回到页面
		model.addAttribute("materialList",materialList);
		model.addAttribute("supplierList",supplierList);
		model.addAttribute("obj",obj);
		
		//传递订单ID
		model.addAttribute("orderNo",orderNo);
		
		
		return "/cargo/purchaseorder/jPOMaterialUpdate.jsp";
	}
	/**
	 * 更新采购原材料信息
	 * @param purchaseOrder
	 * @return
	 */
	@RequestMapping("/updatematerial.action")
	public String updateMaterial(PurchaseOrder purchaseOrder,String orderNo , Model model){
		this.purchaseOrderService.update(purchaseOrder);
		
		//传递订单ID到 --  新增+列表页面
		return "redirect:/cargo/purchaseorder/toaddmaterial.action?orderNo="+orderNo;
	}
	/**
	 * 删除订单下原材料信息
	 * @param id
	 * @param orderId
	 * @param model
	 * @return
	 */
	@RequestMapping("/deletematerial.action")
	public String deleteMaterial(String id ,String orderNo , Model model){
		this.purchaseOrderService.deleteById(id);
		
		//跳转到订单原材料添加页面,同时传递订单的编号
		return "redirect:/cargo/purchaseorder/toaddmaterial.action?orderNo="+orderNo;
	}
		
}
