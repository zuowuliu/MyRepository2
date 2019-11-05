package com.ren.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ren.bbs.bean.Employee;
import com.ren.bbs.bean.EmployeeExample;
import com.ren.bbs.bean.EmployeeExample.Criteria;
import com.ren.bbs.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;

	/**
	 * 业务层调用dao层的接口来完成与数据库的交互
	 */

	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 检验员工名是否可用 /true可用 /false不可用
	 */
	public boolean checkUser(String empName) {
		// 创建检验是否有重名员工的条件
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria criteria = employeeExample.createCriteria();
		criteria.andEmpNameEqualTo(empName);

		long count = employeeMapper.countByExample(employeeExample);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	// 员工更新
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	// 员工删除
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
	}
}
