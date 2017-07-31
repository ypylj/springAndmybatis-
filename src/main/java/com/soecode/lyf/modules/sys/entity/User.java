package com.soecode.lyf.modules.sys.entity;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 2358482015502641640L;
	private Integer id;
	private String loginName;
	private String password;
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the loginName
	 */
	public String getLoginName() {
		return loginName;
	}
	/**
	 * @param loginName the loginName to set
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", password=" + password + "]";
	}
	public User(Integer id, String loginName, String password) {
		this.id = id;
		this.loginName = loginName;
		this.password = password;
	}
	
}
