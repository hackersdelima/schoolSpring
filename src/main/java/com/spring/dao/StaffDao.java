package com.spring.dao;

import java.util.List;

import com.spring.model.StaffModel;

public interface StaffDao {
	public boolean insertStaff(StaffModel s);
	public boolean updateStaff(StaffModel s);
	public boolean deleteStaff(String id);
	public List<StaffModel> listStaffs();
	public StaffModel staffDetail(int id);
	public StaffModel recentlyInsertedStaff();

}
