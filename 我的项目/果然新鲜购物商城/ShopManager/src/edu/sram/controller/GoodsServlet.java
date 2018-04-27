package edu.sram.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sram.entity.Goods;
import edu.sram.entity.Page;
import edu.sram.service.GoodsService;
import edu.sram.service.GoodsServiceImpl;

public class GoodsServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
    private GoodsService goodsService = new GoodsServiceImpl();
    private Goods goods = new Goods();
    
    protected void goodsList(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
	    Page<Goods> page=null;
		int pageSize=4;
		String goodsname = request.getParameter("goodsname");
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
		request.setAttribute("searchModel",goods);//回显查询条件
		request.getRequestDispatcher("/page/user/allgoods.jsp").forward(request, response);
	}
	
    protected void goodsList2(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		Goods g = new Goods();
	    Page<Goods> page=null;
		int pageSize=4;
		String goodsname = request.getParameter("goodsname");
		g.setGoodsname(goodsname);
		String jumpPage = request.getParameter("jumpPage");
		int  currentPage = 0;
		currentPage = jumpPage==null?1:Integer.valueOf(jumpPage);
		try {
			page = goodsService.findPage(currentPage,pageSize,g);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel", g);//回显查询条件
		request.setAttribute("search",jumpPage);
		request.getRequestDispatcher("/page/user/allgoods.jsp").forward(request, response);
	}
	
	protected void addgoods(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		response.sendRedirect(this.getServletContext().getContextPath()+"/page/user/addgoods.jsp");
	}
	
	protected void goodsEdit(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		goods.setId(no);
		Goods findgoods=null;
		try {
			findgoods = goodsService.findById(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("goods", findgoods);
		request.getRequestDispatcher("/page/user/addgoods.jsp").forward(request, response);
	}
	
	protected void editGoods(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String message1=null;
		String id = request.getParameter("id");
		String goodsname = request.getParameter("goodsname");
		String goodsprice = request.getParameter("goodsprice");
		String goods_imageurl = request.getParameter("goods_imageurl");
		String num = request.getParameter("num");
		String state = request.getParameter("state");
		goods.setGoodsname(goodsname);
		goods.setGoodsprice(Double.parseDouble(goodsprice));
		goods.setGoods_imageurl(goods_imageurl);
		goods.setNum(Integer.parseInt(num));
		goods.setState(Integer.parseInt(state));
		boolean b =false;
		if(id!=null && id !=""){
		try {
			String goodstime = request.getParameter("goodstime");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = null;
			try {
				date = sdf.parse(goodstime);
				goods.setGoodstime(date);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}  

			goods.setId(Integer.parseInt(id));
			b = goodsService.editGoods(goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message1= b?"恭喜您，修改成功":"未知错误，修改失败";
		}else{
			try {
			b = goodsService.toAddGoods(goods);
			} catch (Exception e) {
				e.printStackTrace();
			}
		  message1 = b?"恭喜您，上架成功":"上架失败,请注意格式！";
		}
		request.setAttribute("message1", message1);
		request.getRequestDispatcher("/goodsServlet?flag=goodsList").forward(request, response);
		}
	
	protected void delgoods(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		boolean b = false;
		try {
			b = goodsService.deleteGoods(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = b?"删除成功":"删除失败";
		request.setAttribute("info", message);
		request.getRequestDispatcher("/goodsServlet?flag=goodsList").forward(request, response);
	}

}
