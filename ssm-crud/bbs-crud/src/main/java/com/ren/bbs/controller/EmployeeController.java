package com.ren.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ren.bbs.bean.Employee;
import com.ren.bbs.bean.Msg;
import com.ren.bbs.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	/**
	 * 控制层处理来自客户的请求，并调用业务逻辑层的逻辑来处理请求
	 * 
	 * JSON要能正常使用需要导入jackson的包(这个包负责将我们的对象转换为字符串)
	 */

	/**
	 * 请求响应的结果是一个Msg对象，包含有处理结果的信息（字符串） /通过在index页面使用js发起一个AJAX请求来获取到这个Msg对象的信息
	 * /通过JS解析出来 通过DOM的增删改的形式来将这些数据显示出来
	 */
	// 查询员工信息
	@RequestMapping("/emps")
	@ResponseBody // 如果需要把处理过后的数据对象转为JSON字符串需要引入这个注解,而且作为了/emps的响应，即Msg包含的所有字符串信息就是
	// 新页面的响应结果（查询结果）
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {// 发请求的时候带上需要第几页的数据
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo<Employee> page = new PageInfo<>(emps, 5);
		return Msg.success().add("pageInfo", page);
		// 数据查出来之后通过PageInfo包装，然后放在Msg中，加上了状态属性和状态信息
		// 链式调用，虽然每次都是调用的Msg里面的方法，但是是对Msg对象的一遍又一遍的包装
	}

	// 新增员工信息
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		employeeService.saveEmp(employee);
		return Msg.success();
	}

	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	// 更新员工时返回模态框查询到的员工信息
	public Msg getEmp(@PathVariable("id") Integer id) {// 从路径中获取id的值
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}

	// 检查是否有重名的员工
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("empName") String empName) {
		// 明确的告诉MVC我们要取出empName的值，所以用@RequestParam("empName") String empName

		// 先判断用户名是否是合法的表达式
		String regx = "(^[a-zA-Z0-9_-]{2,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		// 数据库用户名是否重复校验
		boolean r = employeeService.checkUser(empName);
		if (r) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名已存在，请重新输入!");
		}
	}

	// 保存修改后的员工信息
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg saveEmp2(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}

	/**
	 * 不使用@RequestMapping的方法来处理请求，而考虑使用AJAX的方法，将处理得到的数据pageInfo转为JSON字符串的格式
	 */

	// 删除单一的员工
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("id") Integer id) {// 从路径中取出id的值，并将其转换为我们能用的id的值
		employeeService.deleteEmp(id);
		return Msg.success();
	}

//  @RequestMapping("/emps")
//	public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
//		// 查找出员工的所有数据并返回list列表
//		// 引入PageHelper插件，查询前只需要调用，传入页码，以及每页的大小
//		PageHelper.startPage(pn, 5);
//		// PageHelper紧跟着的这个查询就是分页查询
//		List<Employee> emps = employeeService.getAll();
//		// 使用pageInfo包装查询后的信息,只需要将PageInfo交给页面就行了。
//		// 封装了详细的分页信息,包括有我们查询出来的数据,传入:连续显示的页数为5页
//		PageInfo<Employee> page = new PageInfo<>(emps, 5);
//		model.addAttribute("pageInfo", page);// 数据放在请求域中
//		return "list";
//	}

}
