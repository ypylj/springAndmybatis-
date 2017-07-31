package com.soecode.lyf.modules.sys.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soecode.lyf.common.web.BaseController;

@Controller
@RequestMapping(value = "${adminPath}/sys/")
public class LoginController extends BaseController {
	/*@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String login() {
		return "modules/sys/login";
	}
	*/
	@RequestMapping(value = "login")
	public String login1(HttpServletRequest request,HttpServletResponse response,HttpSession session,Boolean remember) {
		String loginName=request.getParameter("loginName");
		String password=request.getParameter("password");
		System.out.println("remeber"+remember);
		if(remember==null||remember==false){
			
		}else{  //如果remember为true,则表示记住密码
			Cookie loginName_c=new Cookie("loginName", loginName);
			Cookie password_c=new Cookie("password_c", password);
			 loginName_c.setPath("/");  
             password_c.setPath("/"); //这里不设置一下路径发现最后的cookie总是保存后取不出来  
             loginName_c.setMaxAge(60*10);//设置cookie保存时间,这里是按秒为单位的
             password_c.setMaxAge(60*3);
            response.addCookie(loginName_c);
            response.addCookie(password_c);
		}
		System.out.println("loginName:" + loginName + "  " + password);
		if ("yangp_39".equals(loginName) && "123".equals(password)) {
			System.out.println("登录成功");
			session.setAttribute("loginName", loginName);
			System.out.println("adminPath"+adminPath);
			return "redirect:"+adminPath+"/book/list";
		} else {

			return "modules/sys/login";

		}
	}
}
