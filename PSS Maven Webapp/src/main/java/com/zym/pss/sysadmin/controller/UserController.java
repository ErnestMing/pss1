package com.zym.pss.sysadmin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zym.pss.multiTenant.po.Tenant;
import com.zym.pss.sysadmin.po.Function;
import com.zym.pss.sysadmin.po.Role;
import com.zym.pss.sysadmin.po.User;
import com.zym.pss.sysadmin.service.RoleService;
import com.zym.pss.sysadmin.service.UserService;
import com.zym.pss.sysadmin.vo.UserRolesVo;
import com.zym.pss.sysadmin.vo.UserVo;
import com.zym.pss.util.UtilFuns;
import com.zym.pss.core.controller.BaseController;
import com.zym.pss.core.pargination.Page;

@Controller
@RequestMapping("/sysadmin/user")
public class UserController extends BaseController {

	@Resource
	UserService userService ;
	@Resource
	RoleService roleService ; 
	//存放列表信息
	private List<User> dataList ;		
	
	/**
	 * 跳转到列表页面
	 */
	@RequestMapping("/list.action")
	public String list(Model model,HttpSession session ){
		//获取当前租户
		Tenant tenant = (Tenant) session.getAttribute("CUR_TENANT");
		
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("tenantId", tenant.getId());
		
		dataList = userService.find(paraMap);
		
		model.addAttribute("dataList",dataList);
		
		return "/sysadmin/user/jUserList.jsp" ; 
	}
	
	@RequestMapping("/toview.action")
	public String toview(String id , Model model){
		User obj = this.userService.get(id);
		model.addAttribute("obj",obj);

		return "/sysadmin/user/jUserView.jsp";
	}
	/**
	 * 跳到添加页面
	 */
	@RequestMapping("/tocreate.action")
	public String tocreate(){
		return "/sysadmin/user/jUserCreate.jsp";
	}
	/**
	 * 添加
	 */
	@RequestMapping("/insert.action")
	public String create(User User){
		this.userService.insert(User);
		
		return "redirect:/sysadmin/user/list.action";
	}
	/**
	 * 跳到更新页面
	 */
	@RequestMapping("/toupdate.action")
	public String toupdate(String id,Model model){
		User obj = this.userService.get(id);
		model.addAttribute("obj",obj);
		
		return "/sysadmin/user/jUserUpdate.jsp";
	}
	/**
	 * 更新
	 */
	@RequestMapping("/update.action")
	public String update(User User){
		this.userService.update(User);
		return "redirect:/sysadmin/user/list.action";
	}
	/**
	 * 删除
	 */
	@RequestMapping("/deleteById.action")
	public String deleteById(String id){
		this.userService.deleteById(id);
		return "redirect:/sysadmin/user/list.action";
	}
	/**
	 * 批量删除
	 */
	@RequestMapping("/delete.action")
	public String delete(@RequestParam("id")String[] ids){
		this.userService.delete(ids);
		return "redirect:/sysadmin/user/list.action";
	}
	
	
//-------------------------------------------------角色分配---------------------------------
	@RequestMapping(value="/{userId}/touserroles.action",method=RequestMethod.GET)
	public String assignPermission(HttpSession session , Model model ,Integer pageNo,@PathVariable("userId")String userId){
		//获取当前租户
		Tenant tenant = (Tenant) session.getAttribute("CUR_TENANT");
		
		//准备角色权限集合
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userId", userId);
		List<UserRolesVo> userRolesList = this.userService.findRoles(paraMap);
		model.addAttribute("userId", userId);
		
		model.addAttribute("userRolesList", userRolesList);
		
		//准备系统功能集合
		Page<Function> page = new Page<Function>();
		page.setPageSize(2);
		if(pageNo != null){
			page.setPageNo(pageNo);
		}
		page.setTenantId(tenant.getId()); //租户ID
		
		List<Role> roleList = this.roleService.findPage(page);
		
		model.addAttribute("pageLinks", page.pageLinks("touserroles.action"));
		model.addAttribute("roleList", roleList);
		
		return "/sysadmin/user/jUserRoles.jsp";
	}
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping("/updateuserinfo.action")
	public String updateUserInfo(String email ,String telephone, String address ,HttpSession session ){
		UserVo uservo = (UserVo) session.getAttribute("CURUSER");
		User user = new User() ; 
		
//		原始信息
		user.setUserNo(uservo.getUserNo());
		user.setId(uservo.getId());
		user.setPassword(uservo.getPassword());
		user.setStatus(uservo.getStatus());
		user.setTenantId(uservo.getTenantId());
		//修改信息
		user.setAddress(address);
		user.setEmail(email);
		user.setTelephone(telephone);
		this.userService.update(user);
		
		
		//更新Session中的租户信息
		UserVo uservo2 = userService.findByUserNameAndPass(uservo.getTenantId(),uservo.getUserNo(),uservo.getPassword());
		
		session.setAttribute("CURUSER", uservo2);
		
		return "redirect:/userfmain.action";
	}
	
	@RequestMapping("/toupdatepass.action")
	public String toudpatePass(String msg , Model model){
		
		model.addAttribute("msg",msg);
		
		return "/user/jUpdatePass.jsp";
	}
	/**
	 * 修改用户密码
	 */
	@RequestMapping("/updatepass.action")
	public String updatePass(String confirmPass , String newPass , String usercode , Model model , HttpSession session ){
		UserVo uservo = (UserVo) session.getAttribute("CURUSER");
		String code = (String) session.getAttribute("code");
		
		StringBuffer msg = new StringBuffer();
		msg.append("Message:");
		User user = this.userService.get(uservo.getId());
		if(UtilFuns.isNotEmpty(confirmPass) && UtilFuns.isNotEmpty(newPass)){
			if(newPass.equals(confirmPass)){
				if(UtilFuns.isNotEmpty(usercode)){
					if(code.equals(usercode)){
						user.setPassword(newPass);		//设置新密码
						this.userService.update(user);		//更新用户密码
						
						msg.append("Password is changed! ");
					}else{
						msg.append("Captcha input is wrong! ");
					}
				}else{
					msg.append("Phone verification code cannot be empty! ");
				}
			}else{
				msg.append("Two password input inconsistent! ");
			}
		}else{
			msg.append("Password cannot be empty!");
		}
		
		return "redirect:/sysadmin/user/toupdatepass.action?msg="+msg.toString();
	}
}
