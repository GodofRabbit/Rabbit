package edu.sram.dao;

import java.util.List;


import edu.sram.dto.ShopCart;
import edu.sram.dto.UserCart;
import edu.sram.entity.User;

public interface ShopCartDao {
	public boolean toAdd(UserCart userCart)throws Exception;
	public List<ShopCart> shopList(UserCart userCart) throws Exception;
	public boolean delShop(int gid) throws Exception;
	
    public int addCar(ShopCart cart);
	
	public boolean delByIdCar(int userid,int goodsid);
	
	public List<ShopCart> getAllCar(User user);
}
