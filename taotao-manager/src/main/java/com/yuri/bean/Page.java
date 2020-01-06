package com.yuri.bean;

import java.util.List;

public class Page {
	private int pageNum;  //总页数
    private int pageSize;  //每页大小(显示的条数)
    private List<TbItem> content;  //存储数据
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<TbItem> getContent() {
		return content;
	}
	public void setContent(List<TbItem> content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Page [pageNum=" + pageNum + ", pageSize=" + pageSize + ", content=" + content + "]";
	}
	public Page(int pageNum, int pageSize, List<TbItem> content) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.content = content;
	}
	public Page() {
	}
    
    
}
