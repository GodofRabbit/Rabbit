package com.shop.serviceImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.GoodsDao;
import com.shop.dao.UserDao;
import com.shop.entity.Address;
import com.shop.entity.Goods;
import com.shop.entity.NoteResult;
import com.shop.entity.ShopCart;
import com.shop.service.GoodsService;
import com.shop.service.UserService;

@Service
public class GoodsServiceImp implements GoodsService{
	
	@Autowired
	GoodsDao goodsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	NoteResult note;
	@Autowired
	UserService userService;

	public NoteResult recommand(String username) {
		List<Goods> list = goodsDao.allProdu(0,6);
		note.setData(list);
		try{
			int user_id = userService.login(username).getId();
			List<ShopCart> cart = goodsDao.loadCart(user_id);
			note.setObj(cart);
		}catch(Exception e){
			note.setObj(null);
		}
		return note;
	}

	public List<Goods> showmore(int page) {
		int pageSize = 8;
		int currentPage = (page-2)*pageSize+6;
		if(currentPage<0){
			currentPage = 0;
		}
		return goodsDao.allProdu(currentPage,pageSize);
	}

	public Goods findOne(int goods_id) {
		return goodsDao.findOne(goods_id);
	}

	public int allnum() {
		return goodsDao.allnum();
	}

	@Transactional
	public void editGoods(Goods goods,int sort) {
		 goodsDao.editGoods(goods);
		 goodsDao.editSort(goods.getId(),sort);
	}

	@Transactional
	public void addGoods(Goods goods,int sort) {
		goodsDao.addGoods(goods);
		int goods_id = goodsDao.findByName(goods.getGoodsname());
		goodsDao.addSort(sort,goods_id);
	}

	@Transactional
	public void delgoods(int goods_id) {
		goodsDao.delgoods(goods_id);
	}

	public NoteResult searchGoods(int page, String keywords) {
		int currentPage = (page-1)*4;
		List<Goods> list = goodsDao.searchGoods(currentPage,keywords);
		note.setData(list);
		int i = goodsDao.allSearchNum(keywords);
		note.setState((i-1)/4+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	//如果id=130，ajax请求加载果蔬热卖(热卖的果蔬，我定义为库存量<80的商品)
	//如果id=240，ajax请求加载全部产品
	//如果id=131，ajax请求加载国产水果
	//如果id=132，ajax请求加载进口水果
	//如果id=133，ajax请求加载新鲜时蔬
	public NoteResult allProdu(int page,int pageSize,int...term) {
		List<Goods> list = null;
		String condition = null;
		int i = 0;
		int currentPage = (page-1)*pageSize;
		if(term!=null && term.length!=0){
			int id = 0;
			for (int s : term) {  
	             id = s; 
	        }
			if(id==131){
				   condition = "国产水果";
				}	
			if(id==132){
				   condition = "进口水果";
				}	
			if(id==133){
				   condition = "新鲜时蔬";
				}	
			list = goodsDao.allProdu(currentPage,pageSize,condition);
			i = goodsDao.allnum(condition);
			if(id==130){
				list = goodsDao.hotProdu(currentPage, pageSize);
				i = goodsDao.allHotNum();
			}
			if(id==240){
				list = goodsDao.allProdu(currentPage,pageSize);
				i = goodsDao.allnum();
			}	
			
		}else{
			list = goodsDao.allProdu(currentPage,pageSize);
			i = goodsDao.allnum();
		}
		note.setData(list);
		note.setState((i-1)/pageSize+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public void addShopCart(int user_id, int id, int num) {
		goodsDao.addShopCart(user_id,id,num);		
	}

	public NoteResult loadCart(int user_id) {
		List<ShopCart> cart = goodsDao.loadCart(user_id);
		note.setData(cart);
		return note;
	}

	public void delShopCart(int uid, int gid) {
		goodsDao.delShopCart(uid,gid);
	}

	public NoteResult loadBalance(int uid, String[] goods_id) {
		List<ShopCart> list = new ArrayList<ShopCart>();
		ShopCart shopCart = null;
		for(int i=0;i<goods_id.length;i++){
			shopCart = goodsDao.loadBalance(uid,goods_id[i]);
			if(shopCart!=null){
				list.add(shopCart);		
			}
		}
		note.setData(list);
		//根据用户id查找是否已经保存过地址
		List<Address> address = goodsDao.selectAddress(uid);
		note.setObj(address);
		return note;
	}

	public void saveAddress(String user_id,String consignee, String telephone,
			String provinces, String citys, String countys, String street,
			int zipcode, String tag) {
		goodsDao.saveAddress(user_id,consignee,telephone,provinces,citys,countys,street,zipcode,tag);
		
	}

	@Transactional
	public void createOrder(int user_id,String goods_id, String conphone,
			String delivery_time,String order_message) {
		int address_id = goodsDao.selectAddress_id(user_id,conphone);
		goodsDao.createOrder(user_id,address_id,delivery_time,order_message);
		
		int order_id = goodsDao.selectOrder_id(user_id,address_id);
		String[] gid = goods_id.split(",");
		ShopCart shopCart = null;
		for(int i=0;i<gid.length;i++){
			shopCart = goodsDao.loadBalance(user_id,gid[i]);
			if(shopCart!=null){
				goodsDao.addOrder_goods(order_id,shopCart.getGoods_id(),shopCart.getGoods_num());		
				goodsDao.delShopCart(user_id, Integer.parseInt(gid[i]));
			}
		}
		
	}


}
