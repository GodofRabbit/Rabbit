package edu.sram.dto;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import edu.sram.entity.Goods;
@Repository
public class ShopCart {
	private int id;
	private int user_id;
	private Map<Goods,Integer> goods;
	private double totalPrice;
	public ShopCart() {
		goods = new HashMap<Goods, Integer>();
	}
	public ShopCart(int id, int user_id, Map<Goods, Integer> goods,
			double totalPrice) {
		this.id = id;
		this.user_id = user_id;
		this.goods = goods;
		this.totalPrice = totalPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Map<Goods, Integer> getGoods() {
		return goods;
	}
	public void setGoods(Map<Goods, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Override
	public String toString() {
		return "ShopCart [id=" + id + ", user_id=" + user_id + ", goods="
				+ goods + ", totalPrice=" + totalPrice + "]";
	}
	
	public void addGoods(Goods goods,int num){
		if(this.goods.containsKey(goods)){
			this.goods.put(goods,this.goods.get(goods)+num);
		}else{
			this.goods.put(goods, num);
		}
		showTotalPrice();
	}
	public void addGoods1(Goods goods,int num){
		
			this.goods.put(goods, num);
		
		showTotalPrice();
	}
	public void delGoods(Goods goods){
		this.goods.remove(goods);
		showTotalPrice();
	}
	public void showTotalPrice(){
		double total = 0.0;
		Set<Goods> keySet = this.goods.keySet();
		for (Goods goods : keySet) {
			total += this.goods.get(goods)*goods.getGoodsprice();
		}
		this.totalPrice = total;
	}
}
