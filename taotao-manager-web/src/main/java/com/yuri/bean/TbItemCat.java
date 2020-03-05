package com.yuri.bean;

import java.io.Serializable;
import java.util.Date;

public class TbItemCat implements Serializable{
	private Long id;

	private Long parentId;

	private String name;

	private Integer status;
	//排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
	private Integer sortOrder;
	//该类目是否为父类目，1为true，0为false
	//数据库里tinyint类型的字段，值为0或者1，如果取出来的话，0会变成false，1会变成true。
	private Boolean isParent;

	private Date created;

	private Date updated;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}

	public Boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	@Override
	public String toString() {
		return "TbItemCat [id=" + id + ", parentId=" + parentId + ", name=" + name + ", status=" + status
				+ ", sortOrder=" + sortOrder + ", isParent=" + isParent + ", created=" + created + ", updated="
				+ updated + "]";
	}
}
