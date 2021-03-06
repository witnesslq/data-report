<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<input type="hidden"  name="ctx" id="ctx" value="${ctx}">
<c:set var="basepathUrl"
	value="${pageContext.request.scheme}${'://'}${pageContext.request.serverName}${':'}${pageContext.request.serverPort}${pageContext.request.contextPath}${'/'}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>发件扫描管理</title>
<link rel="stylesheet" href="${ctx}/css/common.css">
<script src="${ctx }/js/jquery/jquery.min-1.11.3.js"></script>
<script type="text/javascript">
	var basepathUrl = "${basepathUrl}";
</script>
<script src="${ctx }/js/operation/scan/commonScan.js"></script>
<link rel="stylesheet" href="${ctx}/css/sweetalert.css">
<script src="${ctx }/js/fuzzyQuery.js"></script>
<script src="${ctx }/js/sweetalert.min.js"></script>
<script type="text/javascript" src="${ctx}/js/laydate/laydate.dev.js"></script>
<script src="${ctx }/js/operation/scan/sendScan.js"></script>
</head>
<body id="dataPage">
	<form id="subform" method="post">
		<div class="condition">
			<div style="min-width: 1130px;">
				<div class="subdiv">
					<input type="button" value="查询" class="subbtn" />
					<input type="button" value="清除" class="cleanbtn" />
					<img src="${ctx}/image/removeimg.png" class="disbtn" />
				</div>
				<div class="textdiv">
					<span>条件查询</span>
					<table>
						<tr>
							<td width="200px">
								<input type="checkbox" class="selType" />
								<span>按单号查询</span>
							</td>
							<td width="400px">
								<label class="label">查询天数</label>
								<input type="button" class="dayNum" value="一天" style="border-color: #BABABA;" />
								<input type="button" class="dayNum" value="两天" />
								<input type="button" class="dayNum" value="三天" style="margin-right: 0px;" />
								<input type="hidden" class="selday" value="1" />
							</td>
							<td width="240px">
								<label class="label">扫描网点</label>
								<input type="text" class="text scanSiteName" name="scanSiteName"
									onkeyup="networkFuzzy(event,this,'scanSiteId');" />
								<input type="hidden" name="scanSiteId" class="scanSiteId" />
							</td>
							<td>
								<label class="label">下一网点</label>
								<input type="text" class="text nextSiteName" name="nextSiteName"
									onkeyup="networkFuzzy(event,this,'nextSiteId');" />
								<input type="hidden" name="nextSiteId" class="nextSiteId" />
							</td>
						</tr>
						<tr>
							<td>
								<label class="label" style="margin-left: 0px;">输入单号</label>
								<input type="text" name="ewbNo" class="text" />
							</td>
							<td>
								<label class="label">扫描时间</label>
								<input type="text" id="scanStartTimeId" name="scanStartTime" value="" class="text" style="width: 120px;"
									readonly="readonly" onclick="laydate()" />
								<span>--</span>
								<input type="text" id="scanEndTimeId" name="scanEndTime" class="text" style="width: 120px;" readonly="readonly"
									onclick="laydate()" />
							</td>
							<td>
								<label class="label">扫描人</label>
								<input type="text" class="text employeeName" name="employeeName" value="${sessionScope.user.userName}"
									onkeyup="employeeFuzzy(event,this,'employeeNameId');" />
								<input type="hidden" name="createdBy" class="employeeNameId" value="${sessionScope.user.userId}" />
							</td>
							<td>
								<label class="label">目的分拨</label>
								<input type="text" class="text dispatchCenterSite" name="dispatchCenterSite"
									onkeyup="networkFuzzy(event,this,'dispatchCenterSiteId');" />
								<input type="hidden" name="dispatchCenterSiteId" class="dispatchCenterSiteId" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="data">
			<div style="min-width: 1000px;">
				<table class="listTable">
					<tr>
						<th>序号</th>
						<th>单号</th>
						<th>扫描网点</th>
						<th>扫描人</th>
						<th>扫描时间</th>
						<th>下一网点</th>
						<th>格口号</th>
						<th>目的分拨</th>
						<th>数据来源</th>
						<th>设备编号</th>
					</tr>
				</table>
				<div class="list">
					<table id="tbody_sendScanDisplayId"></table>
				</div>
			</div>
		</div>
		<div class="page">
			<input type="hidden" class="pageCount" />
			<span>
				<a href=" javascript:void(0);" class="prePage">上一页</a>
				<select class="pageNum" name="pageNum">
					<option selected="selected" value="1">1</option>
				</select>
				<a href=" javascript:void(0);" class="nextPage">下一页</a>
			</span>
			<span>
				每页显示
				<select class="pageSize" name="pageSize">
					<option value="20" selected="selected">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
				</select>
				条数据
			</span>
			<span class="pageinfo"></span>
		</div>
	</form>
	<div class="loadDiv" style="display:none;position:fixed;top:0px;right:0px; bottom:0.1px; left:0px; background-color:#000;opacity:0.5;text-align: center;z-index:3;">
		<img src="${ctx}/image/loading.gif" style="margin:auto;margin-top:350px;">
	</div>
</body>
</html>