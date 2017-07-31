package com.soecode.lyf.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginHandlerInterceptor implements HandlerInterceptor
{

	 /*
	  * Handler执行之前调用这个方法
	  */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	//获取请求的URL  //获取绝对jsp的绝对路径
	
		String currentUrl=request.getRequestURI();
		System.out.println(currentUrl);
		 //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
		String targetURL=currentUrl.substring(currentUrl.indexOf("/",1),currentUrl.length());
		System.out.println(targetURL);
		if(currentUrl.indexOf("login")>=0){  
			System.out.println("True");
            return true;  
        }
		//获取session
		HttpSession session= request.getSession();
		String loginName=(String)session.getAttribute("loginName");
		System.out.println("Session-loginName:"+loginName);
		if(loginName!=null){
			return true;
		}
		//未登录时，不能进入其他页面，进行拦截，进入登录页面
		response.sendRedirect(request.getContextPath());
		return false;
	}
	/*
	Handler执行之后，ModelAndView返回之前调用这个方法
	*/
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	/*
	 * Handler执行完成之后调用这个方法
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
/*
 * 登陆拦截器 
 * 场景：用户点击查看的时候，我们进行登陆拦截器操作，判断用户是否登陆？ 
 * 登陆，则不拦截，没登陆，则转到登陆界面； 
 *//*
public class LoginFilter implements Filter{
	
	 *销毁 
	 
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

 *判断用户是否登陆？ 登陆，则不拦截，没登陆，则转到登陆界面；
 
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("查看是否登录过");
		HttpServletRequest request=(HttpServletRequest)servletRequest;
		HttpServletResponse response=(HttpServletResponse)servletResponse;
		request.getRequestURL() 返回全路径
		request.getRequestURI() 返回除去host（域名或者ip）部分的路径
		request.getContextPath() 返回工程名部分，如果工程映射为/，此处返回则为空
		request.getServletPath() 返回除去host和工程名部分的路径
		
		
		 * request.getRequestURL() http://localhost:8080/jqueryLearn/resources/request.jsp 
		   request.getRequestURI() /jqueryLearn/resources/request.jsp
		   request.getContextPath()/jqueryLearn 
		   request.getServletPath()/resources/request.jsp 
			注： resources为WebContext下的目录名 
      		jqueryLearn 为工程名
		 
		//获取根目录所对应的绝对路径
		String currentUrl=request.getRequestURI();
		//截取到当前文件名用于比较
		String targetURL=currentUrl.substring(currentUrl.indexOf("/",1),currentUrl.length());
		System.out.println(targetURL);
		//如果session不为空就返回该session，否则返回null；
		HttpSession session= request.getSession();
		//判断当前页面是否为登录页面，如果是就不做session的判断，防止死循环
		if(!"login.jsp".equals(targetURL)){
			if(session==null||session.getAttribute("user")==null){
				 //如果session为空表示用户没有登陆就重定向到login.jsp页面
                System.out.println("request.getContextPath()=" + request.getContextPath());  
                response.sendRedirect(request.getContextPath()+"/login.jsp");
                return;
			}
		}
		  //继续向下执行
		//http://blog.csdn.net/huangcongjie/article/details/7377422
        filterChain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
*//*
过滤器的生命周期一般都要经过下面三个阶段：

初始化

当容器第一次加载该过滤器时，init() 方法将被调用。该类在这个方法中包含了一个指向 Filter Config 对象的引用。


过滤
过滤器的大多数时间都消耗在这里。doFilter方法被容器调用，同时传入分别指向这个请求/响应链中的 Servlet Request、Servlet Response 和 Filter Chain 对象的引用。然后过滤器就有机会处理请求，将处理任务传递给链中的下一个资源(通过调用 Filter Chain 对象引用上的 doFilter方法)，之后在处理控制权返回该过滤器时处理响应。


析构
容器紧跟在垃圾收集之前调用 destroy()方法，以便能够执行任何必需的清理代码。


关于chain.doFilter(request,response)
他的作用是将请求转发给过滤器链上下一个对象。这里的下一个指的是下一个filter，如果没有filter那就是你请求的资源。 一般filter都是一个链,web.xml 里面配置了几个就有几个。一个一个的连在一起 
request -> filter1 -> filter2 ->filter3 -> .... -> request resource.

*/