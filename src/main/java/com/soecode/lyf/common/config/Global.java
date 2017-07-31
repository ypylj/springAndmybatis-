 package com.soecode.lyf.common.config;

import java.util.HashMap;
import java.util.Map;

import com.soecode.lyf.common.utils.PropertiesLoader;
import com.soecode.lyf.common.utils.StringUtils;


//全局配置类
public class Global {
	 /**
	 * 当前对象实例
	 */ 
	private static Global global = new Global();
	 /**
	 * 保存全局属性值
	 */
	private static Map<String, String> map=new HashMap<String,String>();
	
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader loader = new PropertiesLoader("jdbc.properties");


	/**
	 * 获取管理端根路径
	 */
	public static String getAdminPath() {
		System.out.println(getConfig("adminPath"));
		return getConfig("adminPath");
	}
	 /**
	 * 获取配置
	 * @see ${fns:getConfig('adminPath')}
	 */ 
	public static String getConfig(String key) {
		String value = map.get(key);
		if (value == null){
			value = loader.getProperty(key);
			map.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}
}
 