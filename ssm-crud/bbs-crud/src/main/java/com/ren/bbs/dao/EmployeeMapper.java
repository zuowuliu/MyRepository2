package com.ren.bbs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ren.bbs.bean.Employee;
import com.ren.bbs.bean.EmployeeExample;

public interface EmployeeMapper {
	long countByExample(EmployeeExample example);

	int deleteByExample(EmployeeExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Employee record);

	int insertSelective(Employee record);

	List<Employee> selectByExample(EmployeeExample example);

	Employee selectByPrimaryKey(Integer id);

	List<Employee> selectByExampleWithDept(EmployeeExample example);

	Employee selectByPrimaryKeyWithDept(Integer empId);

	int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

	int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

	int updateByPrimaryKeySelective(Employee record);

	int updateByPrimaryKey(Employee record);
}