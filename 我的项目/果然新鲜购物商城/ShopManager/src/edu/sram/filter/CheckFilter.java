package edu.sram.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckFilter implements Filter {
    public CheckFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
		HttpServletResponse response	=(HttpServletResponse)arg1;
		HttpServletRequest request	=(HttpServletRequest)arg0;
		HttpSession session = request.getSession();
		Object user = session.getAttribute("manager");
		if(user==null){
			session.setAttribute("message", "登录后才可浏览相关信息");
			response.sendRedirect("/ShopManager/page/login/login.jsp");
		}else{
			
		}
		arg2.doFilter(arg0, arg1);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
