package edu.sram.service;

import java.util.List;

import edu.sram.dto.ShopCart;
import edu.sram.dto.UserCart;

public interface ShopCartService {
	 public boolean toAdd(UserCart userCart)throws Exception;
	 public boolean delShop(int gid)throws Exception;
	 public List<ShopCart> shopList(UserCart userCart) throws Exception;
	 public boolean addOrder(int User_id) throws Exception;
	 
}
