/*package com.soecode.lyf.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.soecode.lyf.modules.sys.entity.User;
  过滤器filter实现登陆成功后才能访问主页面，
 *   否则直接输入主页面的地址自动跳转到登陆界面
 

public class LoginServlet extends HttpServlet {

	*//**
	 * 
	 *//*
	private static final long serialVersionUID = -5586295049247023040L;
	
	protected void  doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		//退出系统
		if("exit".equals(type)){
			
			 * 
			getSession(boolean create)意思是返回当前reqeust中的HttpSession ，如果当前reqeust中的HttpSession 为null，当create为true，就创建一个新的Session，否则返回null； 
			简而言之： 
			HttpServletRequest.getSession(ture)等同于 HttpServletRequest.getSession() 
 			HttpServletRequest.getSession(false)等同于 如果当前Session没有就为null； 

			3.使用

			当向Session中存取登录信息时，一般建议：HttpSession session =request.getSession();

			当从Session中获取登录信息时，一般建议：HttpSession session =request.getSession(false);
			 
			HttpSession session=request.getSession(false);
			String SessionUser=(String)session.getAttribute("user");
			if(SessionUser!=null){
				session.removeAttribute("user");
				System.out.println("退出系统成功");
			}else{
				System.out.println("退出失败，用户已经退出登录");
			}
			 request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
	
	protected void  doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String type=request.getParameter("type");
		//登录验证
		if("login".equals(type)){
			String loginName=request.getParameter("loginName");
			String password=request.getParameter("password");
			// User user=userService.loginName(username)		}
			User user=new User(1, "yangp_39", "123456");//用于模拟从数据库查找出来的数据
			if(user.getLoginName().equals(loginName)){
				
				if(user.getPassword().equals(password)){
					HttpSession session=request.getSession();
					session.setAttribute("user",loginName);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else{
                    System.out.println("密码部不正确!");
                    request.setAttribute("userName", loginName);
                    request.setAttribute("message", "输入密码错误！请重新输入！");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
			}else{
				System.out.println("用户名不存在");
				 request.setAttribute("message", "用户名不存在！请重新输入！");
                 request.getRequestDispatcher("login.jsp").forward(request, response);
         
			}
			
		}
	}
}
*/