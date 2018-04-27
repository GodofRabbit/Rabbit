package com.tarena.dangdang.action.main;

import java.util.List;

import com.tarena.dao.CommentDao;
import com.tarena.entity.Comment;

public class GetComment{
	private int id;
	private List<Comment> comlist;
	private int num;
	public String execute() throws Exception{
		comlist=CommentDao.getComments(id);
		num=CommentDao.getMaxNumOfComments(id);
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Comment> getComlist() {
		return comlist;
	}
	public void setComlist(List<Comment> comlist) {
		this.comlist = comlist;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
