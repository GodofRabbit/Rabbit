package com.tarena.util;

import java.util.Map;

import com.tarena.service.CartServiceImpl;

public class CartManagement {
	public static CartServiceImpl initCart( Map<String,Object> session){
		CartServiceImpl localcart=(CartServiceImpl)session.get("cart");
		if(localcart==null){
			CartServiceImpl service=new CartServiceImpl();
			session.put("cart",service);
			return service;
		}else{
			return localcart;
		}
	}

}
