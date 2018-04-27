package edu.sram.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



import edu.sram.dao.ShopCartDaoImpl;
import edu.sram.dto.ShopCart;
import edu.sram.entity.Goods;
import edu.sram.entity.Page;
import edu.sram.entity.User;
import edu.sram.service.GoodsService;
import edu.sram.service.GoodsServiceImpl;
@Controller
public class GoodsServlet{
	@Autowired
    GoodsService goodsService;
	@Autowired
    Goods goods;
    
	@RequestMapping("goods.go")
    protected String goodsList(String goodsname,HttpServletRequest request)  throws ServletException, IOException{
	    Page<Goods> page=null;
		int pageSize=12;
		goods.setGoodsname(goodsname);
		String currentPageValue = request.getParameter("currentPage");
		int  currentPage = 0;
		currentPage = currentPageValue==null?1:Integer.valueOf(currentPageValue);
		try {
			page = goodsService.findPage(currentPage,pageSize,goods);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel",goods);
		return "produ";
	}
	@RequestMapping("goods2.go")
    protected String goodsList2(String goodsname,String jumpPage,HttpServletRequest request)  throws ServletException, IOException{
		Goods g = new Goods();
	    Page<Goods> page=null;
		int pageSize=12;
		g.setGoodsname(goodsname);
		int  currentPage = 0;
		currentPage = jumpPage==null?1:Integer.valueOf(jumpPage);
		try {
			page = goodsService.findPage(currentPage,pageSize,g);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel", g);
		request.setAttribute("search",currentPage);
		return "produ";
	}
	@RequestMapping("findOne.go")
    protected String findOne(String fid,HttpServletRequest request)  throws ServletException, IOException{
    	if("null".equals(fid)){
    		return "index";
    	}else{
    		try {
    			goods = goodsService.findById(Integer.parseInt(fid));
    		} catch (NumberFormatException e) {
    			e.printStackTrace();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		request.setAttribute("goods", goods);
    		return "detail";
        }	
    	}
    	
	@RequestMapping("carList.go")
    protected String carList(String user_id,HttpServletRequest request) 
			throws ServletException, IOException{
		User user = new User();
		user.setId(Integer.parseInt(user_id));
		List<ShopCart> allCar = new ShopCartDaoImpl().getAllCar(user);
		request.setAttribute("allCar", allCar);
		for (ShopCart car : allCar) {
			System.out.println(car);
		}
		return "cart";
	}
	
}
