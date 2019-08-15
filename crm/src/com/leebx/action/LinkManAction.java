package com.leebx.action;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.leebx.entity.CstCustomer;
import com.leebx.entity.CstLinkman;
import com.leebx.entity.PageBean;
import com.leebx.service.CustomerService;
import com.leebx.service.LinkManService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LinkManAction extends ActionSupport {
	private LinkManService linkManService;
	private CustomerService customerService;
	private CstLinkman cstLinkMan;
	private Integer currPage;// ��ǰҳ
	private Integer pageSize;// ÿҳ�ļ�¼��
	public void setLinkManService(LinkManService linkManService) {
		this.linkManService = linkManService;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public CstLinkman getCstLinkMan() {
		return cstLinkMan;
	}

	public void setCstLinkMan(CstLinkman cstLinkMan) {
		this.cstLinkMan = cstLinkMan;
	}

	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	// ��ѯ��ϵ��
	public String find() throws Exception {
		//�������߲�ѯ
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(CstLinkman.class);
//		if(cstLinkMan.getLkmName()!=null){
//			//���߲�ѯ������web���������
//			detachedCriteria.add(Restrictions.like("lkmName", "%"+cstLinkMan.getLkmName()+"%"));
//		}
		if(currPage==null){
			currPage=1;
		}
		if(pageSize==null){
			pageSize=4;
		}
		PageBean<CstLinkman> pageBean = linkManService.find(detachedCriteria,currPage,pageSize);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "list";
	}
	//��ת��add.jsp
	public String addUI() throws Exception {
		List<CstCustomer> list = customerService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "addUI";
	}
	//������ϵ��
	public String save() throws Exception {
		Integer i = linkManService.save(cstLinkMan);
		if(i>0){
			return find();
		}else{
			return "error";
		}
	}
	//ɾ����ϵ��
	public String delete() throws Exception {
		CstLinkman cstLinkMan2 = linkManService.findById(cstLinkMan.getLkmId());
		Integer i = linkManService.delete(cstLinkMan2);
		if(i>0){
			return find();
		}else{
			return "error";
		}
	}
	//��ѯ��ϵ��
	public String findByLinkMan() throws Exception {
		
		cstLinkMan = linkManService.findById(cstLinkMan.getLkmId());
		List<CstCustomer> list = customerService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "edit";
	}
	//�޸���ϵ��
	public String update() throws Exception {
		int i = linkManService.update(cstLinkMan);
		if(i>0){
			return find();
		}else{
			return "error";
		}
	}

}
