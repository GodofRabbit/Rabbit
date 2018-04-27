package edu.sram.service;

import java.util.List;

import org.springframework.stereotype.Service;


import edu.sram.dao.ShopCartDaoImpl;
import edu.sram.dto.ShopCart;
import edu.sram.dto.UserCart;

@Service
public class ShopCartServiceImpl implements ShopCartService{
	private ShopCartDaoImpl shopCartDao = new ShopCartDaoImpl();
	
	@Override
	public boolean toAdd(UserCart userCart) throws Exception {
		return shopCartDao.toAdd(userCart);
	}

	public List<ShopCart> shopList(UserCart userCart) throws Exception{
       return shopCartDao.shopList(userCart);		
	}

	@Override
	public boolean delShop(int gid) throws Exception {
		return shopCartDao.delShop(gid);
	}

	public boolean addOrder(int User_id) throws Exception{
		return shopCartDao.addOrder(User_id);
	}

}
