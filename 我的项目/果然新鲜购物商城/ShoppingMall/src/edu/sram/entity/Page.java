package edu.sram.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Page<T> {

private int totalRecord; // ��¼������
	
	private int currentPage; // ��ǰҳ��

	private int pageSize; // ÿҳ��ʾ����
	
	private int totalPage; // ��ҳ��    
	
	private List<T> dataList; //���ݵļ���

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
