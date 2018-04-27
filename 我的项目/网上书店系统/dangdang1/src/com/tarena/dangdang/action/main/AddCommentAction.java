package com.tarena.dangdang.action.main;

import java.util.Date;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.dao.CommentDao;
import com.tarena.entity.Comment;
import com.tarena.entity.UserInfo;

public class AddCommentAction extends BaseAction{
	private int star;
	private boolean result;
	private String comment;
	private int productId;
	public String execute() throws Exception{
		UserInfo user=(UserInfo)session.get("user");
		Comment com=new Comment();
		com.setUserId(user.getId());
		com.setProductId(productId);
		com.setStar(star);
		com.setComment(comment);
		com.setCommentTime(new Date().getTime());
		CommentDao.addCommet(com);
		result=true;
		return "success";
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
