package com.soecode.lyf.modules.book.exception;

/**
 * 库存不足异常
 */
public class NoNumberException extends RuntimeException {

	private static final long serialVersionUID = -6131491362652502389L;

	public NoNumberException(String message) {
		super(message);
	}

	public NoNumberException(String message, Throwable cause) {
		super(message, cause);
	}

}
