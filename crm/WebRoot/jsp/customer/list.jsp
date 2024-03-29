﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css"
	type=text/css rel=stylesheet>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {

		$.post("baseDict!findByInfo.action", {
			"baseDict.dictTypeCode" : "006"
		}, function(data) {
			$(data).each(
					function(i, n) {
						$("#cust_level").append(
								"<option value='"+n.dictId+"'>"
										+ n.dictItemName + "</option>");
					});
			//记住默认选项
			$("#cust_level option[value='${cstCustomer.baseDict.dictId}']")
					.prop("selected", true);
		}, "json");

	});
</script>
<SCRIPT language=javascript>
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.customerForm.submit();

	}
	function f(){
		document.customerForm.action="customer!find.action";
		document.customerForm.submit();
	}
</SCRIPT>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/customer!find.action"
		method=post>

		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_019.jpg"
						border=0>
					</TD>
					<TD width="100%"
						background="${pageContext.request.contextPath }/images/new_020.jpg"
						height=20></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_021.jpg"
						border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15 background=${pageContext.request.contextPath }
						/images/new_022.jpg><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg"
						border=0>
					</TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户管理 &gt; 客户列表</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0
							width="100%" align=center border=0>
							<TBODY>
								<TR>
									<TD height=25>
										<TABLE cellSpacing=0 cellPadding=2 border=0>
											<TBODY>
												<TR>
													<TD>客户名称：</TD>
													<TD><INPUT class=textbox id=sChannel2
														style="WIDTH: 80px" maxLength=50 name="cstCustomer.custName">
													</TD>
													<TD>客户等级：</TD>
													<TD><select id="cust_level"
														name="cstCustomer.baseDict.dictId">
															<option value="">--请选择--</option>
														</select>
													</TD>

													<TD><INPUT class=button id=sButton2 type=button
														value=" 筛选 " name=sButton2 onclick="f()">
													</TD>
												</TR>
											</TBODY>
										</TABLE></TD>
								</TR>

								<TR>
									<TD>
									
										<TABLE id=grid
											style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
											cellSpacing=1 cellPadding=2 rules=all border=0>
											<TBODY>
												<TR
													style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
													<TD>客户名称</TD>
													<TD>客户级别</TD>
													<TD>客户来源</TD>
													<TD>客户所属行业</TD>
													<TD>电话</TD>
													<TD>手机</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator value="pageBean.list">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD><s:property value="custName" />
														</TD>
														<TD><s:property value="baseDict.dictItemName" />
														</TD>
														<TD><s:property value="custSource" />
														</TD>
														<TD><s:property value="custIndustry" />
														</TD>
														<TD><s:property value="custPhone" />
														</TD>
														<TD><s:property value="custMobile" />
														</TD>
														<TD><a
															href="${pageContext.request.contextPath }/customer!update.action?cstCustomer.custId=<s:property value="custId"/>">修改</a>
															&nbsp;&nbsp; <a
															href="${pageContext.request.contextPath }/customer!delete.action?cstCustomer.custId=<s:property value="custId"/>">删除</a>
														</TD>
													</TR>
												</s:iterator>
											</TBODY>
										</TABLE></TD>
								</TR>

								<TR>
									<TD><SPAN id=pagelink>
											<DIV
												style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												共[<B><s:property value="pageBean.totalCount" />
												</B>]条记录,[<B><s:property value="pageBean.totalPage" />
												</B>]页 ,每页显示
												<s:select name="pageSize" list="#{4:4,8:8,10:10 }"
													onchange="javascript:to_page()"></s:select>
												条 [<A
													href="javascript:to_page(<s:property value="currPage=1"/>)">首页</A>]
												<B> <s:iterator var="i" begin="1"
														end="pageBean.totalPage">
														<a href="javascript:to_page(<s:property value="#i"/>)"><s:property
																value="#i" />
														</a>
													</s:iterator> </B> [<A
													href="javascript:to_page(<s:property value="pageBean.totalPage"/>)">尾页</A>]
												到 <input type="text" size="3" id="page" name="currPage" />
												页 <input type="button" value="Go" onclick="to_page()" />
											</DIV> </SPAN>
									</TD>
								</TR>
							</TBODY>
						</TABLE></TD>
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_023.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_023.jpg"
						border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
				<TR>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_024.jpg"
						border=0>
					</TD>
					<TD align=middle width="100%"
						background="${pageContext.request.contextPath }/images/new_025.jpg"
						height=15></TD>
					<TD width=15><IMG
						src="${pageContext.request.contextPath }/images/new_026.jpg"
						border=0>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</FORM>
</BODY>
</HTML>
