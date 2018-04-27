package com.tarena.dangdang.action.order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.dao.OrderDao;
import com.tarena.entity.CartItem;
import com.tarena.entity.Order;
import com.tarena.entity.OrderItem;
import com.tarena.entity.RecieveInformation;
import com.tarena.entity.UserInfo;
import com.tarena.service.CartService;

public class CreateOrderAction extends BaseAction{
	private RecieveInformation information;
	private Order order;
	public String execute() throws Exception{
		UserInfo user=(UserInfo)session.get("user");
		CartService service=(CartService)session.get("cart");
		information.setUserId(user.getId());
		if(information.getId()==0){
		OrderDao.createNewAddress(information);
		}
		order=new Order();
		order.setUserId(user.getId());
		order.setStatus(1);
		order.setOrderTime(new Date().getTime());
		order.setTotalPrice(service.getTotalPrice());
		order.setReceiveName(information.getReceiveName());
		order.setFullAddress(information.getFullAddress());
		order.setPostalCode(information.getPostalCode());
		order.setMobile(information.getMobile());
		order.setPhone(information.getPhone());
		OrderDao.createNewOrder(order);
		List<CartItem> cartList=service.getBuyPros();
		List<OrderItem> orderList=new ArrayList<OrderItem>();
		for(CartItem item:cartList){
			OrderItem oi=new OrderItem();
			oi.setProductName(item.getProduct().getProductName());
			oi.setProductId(item.getProduct().getId());
			oi.setDangPrice(item.getProduct().getDangPrice());
			oi.setOrderId(order.getId());
			oi.setProductNum(item.getQuantity());
			oi.setAmount(oi.getProductNum()*oi.getDangPrice());
			orderList.add(oi);
		}
		OrderDao.createNewOrderItem(orderList);
		service.hasBought();
		return "success";
	}
	public RecieveInformation getInformation() {
		return information;
	}
	public void setInformation(RecieveInformation information) {
		this.information = information;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
	
}
