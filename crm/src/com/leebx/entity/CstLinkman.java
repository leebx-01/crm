package com.leebx.entity;

/**
 * CstLinkman entity. @author MyEclipse Persistence Tools
 */

public class CstLinkman implements java.io.Serializable {

	// Fields

	private Long lkmId;
	private CstCustomer cstCustomer;
	private String lkmName;
	private String lkmGender;
	private String lkmPhone;
	private String lkmMobile;
	private String lkmEmail;
	private String lkmQq;
	private String lkmPosition;
	private String lkmMemo;

	// Constructors

	/** default constructor */
	public CstLinkman() {
	}

	/** minimal constructor */
	public CstLinkman(CstCustomer cstCustomer) {
		this.cstCustomer = cstCustomer;
	}

	/** full constructor */
	public CstLinkman(CstCustomer cstCustomer, String lkmName,
			String lkmGender, String lkmPhone, String lkmMobile,
			String lkmEmail, String lkmQq, String lkmPosition, String lkmMemo) {
		this.cstCustomer = cstCustomer;
		this.lkmName = lkmName;
		this.lkmGender = lkmGender;
		this.lkmPhone = lkmPhone;
		this.lkmMobile = lkmMobile;
		this.lkmEmail = lkmEmail;
		this.lkmQq = lkmQq;
		this.lkmPosition = lkmPosition;
		this.lkmMemo = lkmMemo;
	}

	// Property accessors

	public Long getLkmId() {
		return this.lkmId;
	}

	public void setLkmId(Long lkmId) {
		this.lkmId = lkmId;
	}

	public CstCustomer getCstCustomer() {
		return this.cstCustomer;
	}

	public void setCstCustomer(CstCustomer cstCustomer) {
		this.cstCustomer = cstCustomer;
	}

	public String getLkmName() {
		return this.lkmName;
	}

	public void setLkmName(String lkmName) {
		this.lkmName = lkmName;
	}

	public String getLkmGender() {
		return this.lkmGender;
	}

	public void setLkmGender(String lkmGender) {
		this.lkmGender = lkmGender;
	}

	public String getLkmPhone() {
		return this.lkmPhone;
	}

	public void setLkmPhone(String lkmPhone) {
		this.lkmPhone = lkmPhone;
	}

	public String getLkmMobile() {
		return this.lkmMobile;
	}

	public void setLkmMobile(String lkmMobile) {
		this.lkmMobile = lkmMobile;
	}

	public String getLkmEmail() {
		return this.lkmEmail;
	}

	public void setLkmEmail(String lkmEmail) {
		this.lkmEmail = lkmEmail;
	}

	public String getLkmQq() {
		return this.lkmQq;
	}

	public void setLkmQq(String lkmQq) {
		this.lkmQq = lkmQq;
	}

	public String getLkmPosition() {
		return this.lkmPosition;
	}

	public void setLkmPosition(String lkmPosition) {
		this.lkmPosition = lkmPosition;
	}

	public String getLkmMemo() {
		return this.lkmMemo;
	}

	public void setLkmMemo(String lkmMemo) {
		this.lkmMemo = lkmMemo;
	}

}