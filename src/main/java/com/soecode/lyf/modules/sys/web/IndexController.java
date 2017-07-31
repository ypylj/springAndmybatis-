package com.soecode.lyf.modules.sys.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soecode.lyf.common.web.BaseController;
@Controller
//实现输入http://localhost:8080/springAndMybatis，系统自动进入登录页面

public class IndexController extends BaseController{
	@RequestMapping(value="/")
	public String index(HttpSession session,HttpServletRequest request){
		session=request.getSession();//判断之前是否登录
		String loginName=(String) session.getAttribute("loginName");
		//判断用户是否已经记住密码
		String password = null;
		Cookie myCookie[]= request.getCookies();
		if(myCookie !=null){
			for(Cookie cookie:myCookie){
				if("loginName_c".equals(cookie.getName())){
					loginName=cookie.getValue();
					System.out.println("cookie:loginName"+loginName);
				}
				if("password_c".equals(cookie.getName())){
					password=cookie.getValue();

					System.out.println("cookie:password"+password);
				}
					
			}
		}
		
		if(loginName!=null &&loginName.equals("yangp_39")&&password!=null&& password.equals("123"))
			return 	"redirect:"+adminPath+"/book/list";
		return "modules/sys/login";
	 	}
}
