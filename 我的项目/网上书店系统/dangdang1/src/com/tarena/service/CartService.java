package com.tarena.service;

import java.util.List;

import com.tarena.entity.CartItem;

public interface CartService {
	public void add(int id)throws Exception;
	public void delete(int id)throws Exception;
	public void recover(int id)throws Exception;
	public void update(int id,int pnum)throws Exception;
	public List<CartItem> getBuyPros()throws Exception;//查看确认购买的
	public List<CartItem> getDeletePros()throws Exception;
	public double getTotalPrice()throws Exception;
	public double getMarketTotalPrice() throws Exception;
	public void clearBuyPros()throws Exception;
	public void clearDeletePros() throws Exception;
	public void realDelete(int id)throws Exception;
	public void recoverAll()throws Exception;
	public void hasBought();

}
