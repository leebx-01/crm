﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>客户拜访记录列表</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath }/css/Manage.css"
	type=text/css rel=stylesheet>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
<SCRIPT language=javascript>
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.customerForm.submit();

	}
	function f() {
		document.customerForm.action = "saleVisit!find.action";
		document.customerForm.submit();
	}
</SCRIPT>
<!-- 日期插件，使用jquery -->
<script type="text/javascript" src="jquery/jquery-1.4.2.js"></script>
<link rel="stylesheet" href="jquery/jquery.datepick.css" type="text/css">
<script type="text/javascript" src="jquery/jquery.datepick.js"></script>
<script type="text/javascript" src="jquery/jquery.datepick-zh-CN.js"></script>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
<script type="text/javascript">
		$(document).ready(function(){
			//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
			$('#birthday').datepick({dateFormat: 'yy-mm-dd'}); 
			$('#birthday2').datepick({dateFormat: 'yy-mm-dd'}); 
		});
</script>
</HEAD>
<BODY>
	<FORM id="customerForm" name="customerForm"
		action="${pageContext.request.contextPath }/saleVisit!find.action"
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
					<TD width=15
						background="${pageContext.request.contextPath }/images/new_022.jpg"><IMG
						src="${pageContext.request.contextPath }/images/new_022.jpg"
						border=0>
					</TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>当前位置：客户拜访记录 &gt; 客户拜访记录列表</TD>
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
													<TD>拜访日期从：</TD>
													<TD><INPUT class=textbox id=birthday
														style="WIDTH: 80px" maxLength=50 name="saleVisit.visitTime">
													</TD>
													<TD>到</TD>
													<TD><INPUT class=textbox id=birthday2
														style="WIDTH: 80px" maxLength=50 name="saleVisit.visitEndTime">
													</TD>
													<TD><INPUT class=button id=sButton2 type=submit
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
													<TD>业务员名称</TD>
													<TD>客户名称</TD>
													<TD>拜访时间</TD>
													<TD>拜访地点</TD>
													<TD>拜访详情</TD>
													<TD>下次拜访时间</TD>
													<TD>操作</TD>
												</TR>
												<s:iterator value="pageBean.list">
													<TR
														style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD><s:property value="sysUser.userName" /></TD>
														<TD><s:property value="cstCustomer.custName" /></TD>
														<TD><s:date name="visitTime" format="yyyy-MM-dd"/></TD>
														<TD><s:property value="visitAddr" /></TD>
														<TD><s:property value="visitDetail" /></TD>
														<TD><s:date name="visitNexttime" format="yyyy-MM-dd"/></TD>
														<TD><a
															href="#">修改</a>
															&nbsp;&nbsp; <a
															href="#">删除</a>
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
												共[<B><s:property value="pageBean.totalCount" /> </B>]条记录,[<B><s:property
														value="pageBean.totalPage" /> </B>]页 ,每页显示
												<s:select name="pageSize" list="#{4:4,8:8,10:10 }"
													onchange="javascript:to_page()"></s:select>
												条 [<A
													href="javascript:to_page(<s:property value="currPage=1"/>)">首页</A>]
												<B> <s:iterator var="i" begin="1" end="pageBean.totalPage">
														<a href="javascript:to_page(<s:property value="#i"/>)"><s:property value="#i" /> </a>
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
