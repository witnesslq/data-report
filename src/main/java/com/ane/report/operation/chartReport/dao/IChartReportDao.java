package com.ane.report.operation.chartReport.dao;

import java.util.List;
import java.util.Map;

import com.ane.report.operation.chartReport.model.ChartReportVO;
import com.ane.report.operation.chartReport.model.ReceiveAndSignChartVO;

public interface IChartReportDao {
	Map<String, String>  groupPackCount();
	List<ChartReportVO> querySiteRank();
	List<ChartReportVO> siteActivityCount();
	/**
	 * 收件图形报表
	 * @return
	 */
	List<ReceiveAndSignChartVO> arriveAndSignChart();
	/**
	 * 签收图形报表
	 * @return
	 */
	List<ReceiveAndSignChartVO> signChart();
	/**
	 * 集包数量统计报表
	 * @return
	 */
	List<ChartReportVO> groupPackChart();
}
