package com.soecode.lyf.modules.book.exception;

/**
 * 预约业务异常
 */
public class AppointException extends RuntimeException {

	private static final long serialVersionUID = 4833038416628985293L;

	public AppointException(String message) {
		super(message);
	}

	public AppointException(String message, Throwable cause) {
		super(message, cause);
	}

}
