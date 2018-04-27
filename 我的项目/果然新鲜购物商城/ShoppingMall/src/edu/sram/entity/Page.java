package edu.sram.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Page<T> {

private int totalRecord; // 记录总条数
	
	private int currentPage; // 当前页数

	private int pageSize; // 每页显示条数
	
	private int totalPage; // 总页数    
	
	private List<T> dataList; //数据的集合

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage=totalPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	@Override
	public String toString() {
		return "Page [totalRecord=" + totalRecord + ", currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + "]";
	}
	
}
