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

import com.zym.pss.cargo.po.Order;
import com.zym.pss.cargo.service.OrderService;
import com.zym.pss.core.controller.BaseController;
import com.zym.pss.sysadmin.vo.UserVo;

@Controller
@RequestMapping("/cargo/order")
public class OrderController extends BaseController {
 
	@Resource
	OrderService orderService ;		//采购订单Service
	
	//存放列表信息
	private List<Order> dataList ;	
	
	/**
	 * 跳转到订单审核
	 */
	@RequestMapping("/orderreview.action")
	public String toOrderReview(Model model,HttpSession session ){
		//获取当前用户
		UserVo curuser = (UserVo) session.getAttribute("CURUSER");
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("tenantId", curuser.getTenantId());
		paraMap.put("state", 2);
		dataList = orderService.find(paraMap);		//查询出未审核的订单
		
		model.addAttribute("dataList",dataList);
		model.addAttribute("orderState",Order.ORDER_STATE_MAP);
		
		return "/cargo/order/jOrderReview.jsp" ; 
	}
	
	/**
	 * 订单审核（通过）
	 * @param ids
	 * @return
	 */
	@RequestMapping("/check.action")
	public String check(@RequestParam("id")String[] ids){
		for(int i = 0  ; i < ids.length;i++){
			Order o = orderService.get(ids[i]);
			if(o.getState() == 2 ){							//只有当订单状态为待审核状态时,才可以审核
				this.orderService.updateState(new String[]{ids[i]},3);	//审核通过
			}
		}
		return "redirect:/cargo/order/orderreview.action";
	}
	
	/**
	 * 订单审核（未通过）
	 * @param ids
	 * @return
	 */
	@RequestMapping("/checkFail.action")
	public String checkFail(@RequestParam("id")String[] ids){
		for(int i = 0  ; i < ids.length;i++){
			Order o = orderService.get(ids[i]);
			if(o.getState() == 2 ){							//只有当订单状态为待审核状态时,才可以审核
				this.orderService.updateState(new String[]{ids[i]},4);		//未通过
			}
		}
		return "redirect:/cargo/order/orderreview.action";
	}
	
	/**
	 * 跳到订单详细信息页面（根据订单类型）
	 * @return
	 */
	@RequestMapping("/toview.action")
	public String toview(String id ){
		Order order = this.orderService.get(id);
		//判断订单的类型：1-采购   2-销售
		if("1".equals(order.getType())){
			//采购订单
			return "redirect:/cargo/purchaseorder/toview.action?id="+id;
		}else{
			//销售订单
			return "redirect:/cargo/saleorder/toview.action?id="+id;
		}
	}
	
}