package com.leebx.action;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import com.leebx.entity.CstCustomer;
import com.leebx.entity.SysUser;
import com.leebx.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private SysUser user;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public SysUser getUser() {
		return user;
	}

	public void setUser(SysUser user) {
		this.user = user;
	}

	//�û���¼
	public String login() throws Exception {
		// TODO Auto-generated method stub
		if(userService.login(user)!=null){
			ActionContext.getContext().getSession().put("USER", userService.login(user));
			return "index";
		}else{
			this.addFieldError("error", "�û������������");
			return "login";
		}
		
	}
	// �û�ע��
	public String regist() throws Exception {
		user.setUserState("1");
		Integer i = userService.regist(user);
		if(i>0){
			return "login";
		}else{
			return null;
		}
	}
	//�û��˳�
	public String exit() throws Exception {
		ActionContext.getContext().getSession().clear();
		return "login";
	}
	public String findAllUser() throws Exception {
		List<SysUser> list = userService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[]{"saleVisits","sysUserRoles"});
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(jsonArray.toString());
		return null;
	}
}
