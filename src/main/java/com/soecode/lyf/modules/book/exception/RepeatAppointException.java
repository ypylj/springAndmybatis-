package com.soecode.lyf.modules.book.exception;

/**
 * 重复预约异常
 */
public class RepeatAppointException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5722440807428528815L;

	public RepeatAppointException(String message) {
		super(message);
	}

	public RepeatAppointException(String message, Throwable cause) {
		super(message, cause);
	}

}
