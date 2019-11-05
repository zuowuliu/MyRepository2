package com.ren.bbs.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ren.bbs.bean.Employee;
import com.ren.bbs.dao.DepartmentMapper;
import com.ren.bbs.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession sqlSession;

	@Test
	public void test() {
		System.out.println(departmentMapper);
		System.out.println(employeeMapper);
//		departmentMapper.insertSelective(new Department(null, "开发部"));
//		departmentMapper.insertSelective(new Department(null, "测试部"));
		// 用sqlSession获取到的Mapper就是可以批量插入的Mapper
		EmployeeMapper Mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 1; i <= 100; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5);
			if (i % 2 == 0) {
				System.out.println("第" + i + "名女性员工入库成功");
				Mapper.insertSelective(new Employee(null, uid, "F", uid + "@renbbs.com", 2));
			} else {
				System.out.println("第" + i + "名男性员工入库成功");
				Mapper.insertSelective(new Employee(null, uid, "M", uid + "@renbbs.com", 1));
			}
		}
	}

}
