package com.shop.service;

import java.util.List;

import com.shop.entity.Goods;
import com.shop.entity.NoteResult;

public interface GoodsService {

	public NoteResult recommand(String username);

	public List<Goods> showmore(int page);

	public Goods findOne(int goods_id);

	public int allnum();

	public void editGoods(Goods goods,int sort);

	public void addGoods(Goods goods,int sort);

	public void delgoods(int goods_id);

	public NoteResult searchGoods(int page, String keywords);

	public NoteResult allProdu(int page,int pageSize,int...term);

	public void addShopCart(int user_id, int id, int num);

	public NoteResult loadCart(int user_id);

	public void delShopCart(int uid, int gid);

	public NoteResult loadBalance(int uid, String[] goods_id);

	public void saveAddress(String user_id,String consignee, String telephone,
			String provinces, String citys, String countys, String street,
			int zipcode, String tag);

	public void createOrder(int user_id,String goods_id, String conphone,
			String delivery_time,String order_message);

}
