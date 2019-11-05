package com.ren.bbs.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	// 状态码
	private int code;
	// 状态信息
	private String msg;
	// 获取处理的数据的结果
	private Map<String, Object> extend = new HashMap<String, Object>();

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public static Msg success() {
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setMsg("成功");
		return msg;
	}

	public static Msg fail() {
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setMsg("失败");
		return msg;
	}

	public Msg add(String key, Object value) {
		this.getExtend().put(key, value);// 相当于建立起了一个映射Map，这个key是随便取的
		return this;
	}
}
