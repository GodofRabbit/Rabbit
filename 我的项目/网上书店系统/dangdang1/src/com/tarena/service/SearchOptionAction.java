package com.tarena.service;

import java.util.List;

import com.tarena.dao.SearchDao;
import com.tarena.entity.Option;

public class SearchOptionAction {
	private List<Option> opts;
	public String execute() throws Exception{
		opts=SearchDao.getSearchOption();
		return "success";
	}
	public List<Option> getOpts() {
		return opts;
	}
	public void setOpts(List<Option> opts) {
		this.opts = opts;
	}
	

}
