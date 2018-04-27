package com.tarena.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.tarena.dao.ProductDao;
import com.tarena.entity.CartItem;

public class CartServiceImpl implements CartService{
	private List<CartItem> cartList=new ArrayList<CartItem>();
	public void add(int id) throws Exception {
		for(CartItem item:cartList){
			if(item.getProduct().getId()==id){
				item.setQuantity(item.getQuantity()+1);
				return;
			}
		}
		CartItem item=new CartItem();
		item.setProduct(ProductDao.findProductById(id));
		cartList.add(item);
	}

	public void delete(int id) throws Exception {
		for(CartItem item:cartList){
			if(item.getProduct().getId()==id){
				item.setBuy(false);
				return;
			}
		}
	}

	public List<CartItem> getBuyPros() throws Exception {
		List<CartItem> list=new ArrayList<CartItem>();
		for(CartItem item:cartList){
			if(item.isBuy()){
				list.add(item);
			}
		}
		return list;
	}

	public List<CartItem> getDeletePros() throws Exception {
		List<CartItem> list=new ArrayList<CartItem>();
		for(CartItem item:cartList){
			if(!item.isBuy()){
				list.add(item);
			}
		}
		return list;
	}

	public double getTotalPrice() throws Exception {
		double sum=0;
		for(CartItem item:cartList){
			if(item.isBuy()){
				sum+=item.getProduct().getDangPrice()*item.getQuantity();
			}
		}
		return sum;
	}
	public double getMarketTotalPrice() throws Exception{
		double sum=0;
		for(CartItem item:cartList){
			if(item.isBuy()){
				sum+=item.getProduct().getFixedPrice()*item.getQuantity();
			}	
		}
		return sum;
	}

	public void recover(int id) throws Exception {
		for(CartItem item:cartList){
			if(item.getProduct().getId()==id){
				item.setBuy(true);
				return;
			}
		}
		
	}

	public void update(int id, int pnum) throws Exception {
		for(CartItem item:cartList){
			if(item.getProduct().getId()==id){
				if(pnum==0){
					delete(id);
				}else{
					item.setQuantity(pnum);
				}
			}
		}
	}

	public void clearBuyPros() throws Exception {
		for(CartItem item:cartList){
			if(item.isBuy()){
				item.setBuy(false);
			}
		}
	}
	public void clearDeletePros() throws Exception {
		CartItem[] delArray=new CartItem[0];
		for(int i=0;i<cartList.size();i++){
			CartItem item=cartList.get(i);
			if(!item.isBuy()){
				delArray=Arrays.copyOf(delArray, delArray.length+1);
				delArray[delArray.length-1]=item;
			}
		}
		for(CartItem item:delArray){
			cartList.remove(item);
		}
		
	}

	public void realDelete(int id) throws Exception {
		CartItem delItem=null;
		for(CartItem item:cartList){
			if(item.getProduct().getId()==id){
				delItem=item;
			}
		}
		cartList.remove(delItem);
	}
	public void recoverAll()throws Exception{
		for(CartItem item:cartList){
			if(!item.isBuy()){
				item.setBuy(true);
			}
		}
	}

	public void hasBought() {
		List<CartItem> delList=new ArrayList<CartItem>();
		for(CartItem item:cartList){
			if(item.isBuy()){
				delList.add(item);
			}
		}
		for(CartItem item:delList){
			cartList.remove(item);
		}
		
	}
	
	
}
