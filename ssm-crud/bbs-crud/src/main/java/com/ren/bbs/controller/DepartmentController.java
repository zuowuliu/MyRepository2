package com.ren.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ren.bbs.bean.Department;
import com.ren.bbs.bean.Msg;
import com.ren.bbs.service.DepartmentService;

/**
 * 处理和部门有关的请求
 */
@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;

	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		// 查出的所有的部门信息
		List<Department> list = departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
