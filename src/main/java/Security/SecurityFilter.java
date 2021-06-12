package Security;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.http.HttpHeaders;
import java.util.Collection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class SecurityFilter implements Filter {
	 
	 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
	
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		//no cache Ngăn người dùng nhìn thấy trang được bảo mật đã truy cập trước đó sau khi đăng xuất
		res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		res.setDateHeader("Expires", 0);
		
		res.setHeader("X-Frame-Options", "DENY");
		res.setHeader("X-Content-Type-Options", "nosniff");
		res.setHeader("X-XSS-Protection", "1; mode=block"); 	
		
		//Đặt Cookie
		String sessionid = req.getSession().getId();
		//res.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly;Secure"+";SameSite=Strict"+";path=/;domain=www.hostingweb.com");
		res.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + "; HttpOnly;Secure"+";SameSite=Strict"+";path=/");
		chain.doFilter(request, response);	
	}  

 
	public void init(FilterConfig config) throws ServletException {
	}
	
	public void destroy() {
	}
	
}