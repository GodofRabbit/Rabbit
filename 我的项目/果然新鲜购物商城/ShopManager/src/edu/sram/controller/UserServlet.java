package edu.sram.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.sram.entity.User;
import edu.sram.entity.Page;
import edu.sram.service.UserService;
import edu.sram.service.UserServiceImpl;

public class UserServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    private User user = new User();
    
    protected void userList(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
	    Page<User> page=null;
		int pageSize=4;
		String username = request.getParameter("username");
		user.setUsername(username);
		String currentPageValue = request.getParameter("currentPage");
		int  currentPage = 0;
		currentPage = currentPageValue==null?1:Integer.valueOf(currentPageValue);
		try {
			page = userService.findPage(currentPage,pageSize,user);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel",user);//回显查询条件
		request.getRequestDispatcher("/page/user/allUsers.jsp").forward(request, response);
	}
	
    protected void userList2(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		User u = new User();
	    Page<User> page=null;
		int pageSize=4;
		String username = request.getParameter("username");
		u.setUsername(username);
		String jumpPage = request.getParameter("jumpPage");
		int  currentPage = 0;
		currentPage = jumpPage==null?1:Integer.valueOf(jumpPage);
		try {
			page = userService.findPage(currentPage,pageSize,u);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		request.setAttribute("page", page);
		request.setAttribute("searchModel", u);//回显查询条件
		request.setAttribute("search",jumpPage);
		request.getRequestDispatcher("/page/user/allUsers.jsp").forward(request, response);
	}
	
	protected void addUser(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		response.sendRedirect(this.getServletContext().getContextPath()+"/page/user/addUser.jsp");
	}
	
	protected void userEdit(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		user.setId(no);
		User findUser=null;
		try {
			findUser = userService.findById(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("user", findUser);
		request.getRequestDispatcher("/page/user/addUser.jsp").forward(request, response);
	}
	
	protected void editUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String message1=null;
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setSex(sex);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		try {
			date = sdf.parse(birthday);
			user.setBirthday(date);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}  
		user.setPhone(phone);
		boolean b =false;
		if(id!=null && id !=""){
		try {
			user.setId(Integer.parseInt(id));
			b = userService.editUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		message1= b?"恭喜您，修改成功":"未知错误，修改失败";
		}else{
			try {
			b = userService.toAddUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		  message1 = b?"恭喜您，添加成功":"添加失败,请注意格式！";
		}
		request.setAttribute("message1", message1);
		request.getRequestDispatcher("/userServlet?flag=userList").forward(request, response);
		}
	
	protected void delUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(id);
		boolean b = false;
		try {
			b = userService.deleteUser(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String message = b?"删除成功":"删除失败";
		request.setAttribute("info", message);
		request.getRequestDispatcher("/userServlet?flag=userList").forward(request, response);
	}

}
