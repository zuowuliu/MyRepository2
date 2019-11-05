package com.ren.bbs.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.ren.bbs.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" })
public class MVCTest {
	// 传入spring的IOC容器
	@Autowired
	WebApplicationContext context;
	// 可以虚拟一个MVC请求，并且获取到处理结果，来看正确性如何
	MockMvc mockMvc;

	@Before // 表示在任意使用@Test注解标注的public void方法执行之前执行
	// 说明每次测试都需要初始化一下,初始化的目的就是为了获取到一个mockmvc，
	// 但是每次测试的请求不一样就需要虚拟出来不同的mvc请求
	// 之前是默认的初始化，此处才是真正的初始化得到一个mockMvc
	public void initMockmvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	// perform模拟发送请求，拿到返回值
	public void testPage() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("PageInfo");
		System.out.println("当前页码：" + pi.getPageNum());
		System.out.println("总页码:" + pi.getPages());
		System.out.println("总记录数:" + pi.getTotal());
		System.out.println("在页码需要连续显示的页码:");
		int[] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.println(" " + i);
		}
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println("ID：" + employee.getdId() + "==>Name:" + employee.getEmpName());
		}
	}

}
