package edu.sram.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import edu.sram.dao.GoodsDaoImpl;
import edu.sram.dao.ShopCartDaoImpl;
import edu.sram.dto.ShopCart;
import edu.sram.entity.Goods;
import edu.sram.entity.User;

@Controller
public class CarServlet{
	@Autowired
	Goods goods;
	@RequestMapping("carServletList.go")
	@ResponseBody
	public void carServletList(String id,String num,HttpServletRequest request)
			throws ServletException, IOException {
		goods.setId(Integer.parseInt(id));
		Goods findById;
		try {
			findById = new GoodsDaoImpl().findById(Integer.parseInt(id));

			User user = (User) request.getSession().getAttribute("findUser");
			ShopCart car1 = new ShopCart();
			car1.setUser_id(user.getId());
			List<ShopCart> allCar = new ShopCartDaoImpl().getAllCar(user);
			if(allCar.size()!=0){
				for (ShopCart car : allCar) {
					System.out.println(allCar.toString());
					Map<Goods, Integer> goods2 = car.getGoods();
					Set<Goods> keySet = goods2.keySet();
					for (Goods goods3 : keySet) {
						if(findById.getId()==goods3.getId()){
							new ShopCartDaoImpl().delByIdCar(user.getId(), goods3.getId());
							car1.addGoods1(findById,goods2.get(goods3)+Integer.parseInt(num));
						}else{
							car1.addGoods1(findById,Integer.parseInt(num));
						}
					}
				}
			}else{
				car1.addGoods1(findById,Integer.parseInt(num));
			}
			new ShopCartDaoImpl().addCar(car1);
			car1.delGoods(findById);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
