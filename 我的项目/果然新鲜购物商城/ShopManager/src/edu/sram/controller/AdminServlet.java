package edu.sram.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.sram.dao.AdminDao;
import edu.sram.dao.AdminDaoImpl;
import edu.sram.entity.Admin;
import edu.sram.entity.Page;
import edu.sram.service.AdminService;
import edu.sram.service.AdminServiceImpl;

public class AdminServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminServiceImpl();
	private Admin admin = new Admin();
	
	protected void check(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String managername = request.getParameter("managername");
		String managerpassword = request.getParameter("managerpassword");
		admin.setManagername(managername);
		admin.setManagerpassword(managerpassword);
		Admin findManager=null;
		try {
			findManager= adminService.findAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(findManager==null){
			request.setAttribute("message", "用户名或密码错误，请重新输入");
			request.getRequestDispatcher("/page/login/login.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("manager", findManager);
			session.setAttribute("sessionId", session.getId());
			response.sendRedirect(this.getServletContext().getContextPath()+"/index.jsp");
		}
	}
	protected void adminList(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
	    Page<Admin> page=null;
		int pageSize=4;
		String managername = request.getParameter("managername");
		admin.setManagername(managername);
		String currentPageValue = request.getParameter("currentPage");
		int  currentPage = 0;
		currentPage = currentPageValue==null?1:Integer.valueOf(currentPageValue);
		try {
			page = adminService.findPage(currentPage,pageSize,admin);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel",admin);//回显查询条件
		request.getRequestDispatcher("/page/user/Admin.jsp").forward(request, response);
	}
	
	protected void adminList2(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		Admin u = new Admin();
	    Page<Admin> page=null;
		int pageSize=4;
		String managername = request.getParameter("managername");
		u.setManagername(managername);
		String jumpPage = request.getParameter("jumpPage");
		int  currentPage = 0;
		currentPage = jumpPage==null?1:Integer.valueOf(jumpPage);
		try {
			page = adminService.findPage(currentPage,pageSize,u);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel", u);//回显查询条件
		request.setAttribute("search",jumpPage);
		request.getRequestDispatcher("/page/user/Admin.jsp").forward(request, response);
	}
	
	protected void addAdmin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		response.sendRedirect(this.getServletContext().getContextPath()+"/page/user/addAdmin.jsp");
	}
	
	protected void adminEdit(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		admin.setId(no);
		Admin findAdmin=null;
		try {
			findAdmin = adminService.findById(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("admin", findAdmin);
		request.getRequestDispatcher("/page/user/addAdmin.jsp").forward(request, response);
	}
	
	protected void editAdmin(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String message1=null;
		String id = request.getParameter("id");
		String managername = request.getParameter("managername");
		String managerpassword = request.getParameter("managerpassword");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		admin.setManagername(managername);
		admin.setManagerpassword(managerpassword);
		admin.setRealname(realname);
		admin.setSex(sex);
		admin.setRole(Integer.parseInt(role));
		boolean b =false;
		if(id!=null && id !=""){
		try {
			admin.setId(Integer.parseInt(id));
			b = adminService.editAdmin(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message1= b?"恭喜您，修改成功":"未知错误，修改失败";
		}else{
			try {
			b = adminService.toAddAdmin(admin);
			} catch (Exception e) {
				e.printStackTrace();
			}
		  message1 = b?"恭喜您，添加成功":"添加失败,请注意格式！";
		}
		request.setAttribute("message1", message1);
		request.getRequestDispatcher("/adminServlet?flag=adminList").forward(request, response);
		}
	
	protected void delAdmin(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		boolean b = false;
		try {
			b = adminService.deleteAdmin(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = b?"删除成功":"删除失败";
		request.setAttribute("info", message);
		request.getRequestDispatcher("/adminServlet?flag=adminList").forward(request, response);
	}

}
