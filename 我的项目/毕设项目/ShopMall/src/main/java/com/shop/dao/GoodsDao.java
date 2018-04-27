package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.Address;
import com.shop.entity.Goods;
import com.shop.entity.ShopCart;

public interface GoodsDao {

	public Goods findOne(int goods_id);

	public void editGoods(Goods goods);

	public void addGoods(Goods goods);

	public void delgoods(int goods_id);

	public List<Goods> searchGoods(int page, String keywords);

	public int allSearchNum(String keywords);

	public List<Goods> allProdu(@Param("currentPage")int currentPage,@Param("pageSize")int pageSize,@Param("term")Object...term);
	
	public int allnum(@Param("term")Object...term);

	public List<Goods> hotProdu(int currentPage, int pageSize);

	public int allHotNum();

	public void addSort(int sort,int goods_id);

	public int findByName(String goodsname);

	public void editSort(int id, int sort);

	public void addShopCart(int user_id, int id, int num);

	public List<ShopCart> loadCart(int user_id);

	public void delShopCart(int uid, int gid);

	public ShopCart loadBalance(int uid, String gid);

	public List<Address> selectAddress(int uid);

	public void saveAddress(String user_id,String consignee, String telephone,
			String provinces, String citys, String countys, String street,
			int zipcode, String tag);

	public int selectAddress_id(int user_id, String conphone);

	public void createOrder(int user_id, int address_id, String delivery_time ,String order_message);

	public int selectOrder_id(int user_id, int address_id);

	public void addOrder_goods(int order_id, int goods_id, int goods_num);

}
