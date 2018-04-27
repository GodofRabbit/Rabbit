package edu.sram.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sram.entity.Order;
import edu.sram.entity.Page;
import edu.sram.service.OrderService;
import edu.sram.service.OrderServiceImpl;

public class OrderServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
    private OrderService orderService = new OrderServiceImpl();
    private Order order = new Order();
    
    protected void orderList(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
	    Page<Order> page=null;
		int pageSize=4;
		String orderseq = request.getParameter("orderseq");
		order.setOrderseq(orderseq);
		String currentPageValue = request.getParameter("currentPage");
		int  currentPage = 0;
		currentPage = currentPageValue==null?1:Integer.valueOf(currentPageValue);
		try {
			page = orderService.findPage(currentPage,pageSize,order);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel",order);//回显查询条件
		request.getRequestDispatcher("/page/user/order.jsp").forward(request, response);
	}
	
    protected void orderList2(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		Order o = new Order();
	    Page<Order> page=null;
		int pageSize=4;
		String orderseq = request.getParameter("orderseq");
		o.setOrderseq(orderseq);
		String jumpPage = request.getParameter("jumpPage");
		int  currentPage = 0;
		currentPage = jumpPage==null?1:Integer.valueOf(jumpPage);
		try {
			page = orderService.findPage(currentPage,pageSize,o);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel", o);//回显查询条件
		request.setAttribute("search",jumpPage);
		request.getRequestDispatcher("/page/user/order.jsp").forward(request, response);
	}
    
    protected void delOrder(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		boolean b = false;
		try {
			b = orderService.deleteOrder(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = b?"删除成功":"删除失败";
		request.setAttribute("info", message);
		request.getRequestDispatcher("/orderServlet?flag=orderList").forward(request, response);
	}
}
