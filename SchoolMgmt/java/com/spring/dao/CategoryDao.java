package com.spring.dao;

import java.util.List;

import com.spring.model.CategoryModel;
import com.spring.model.MonthModel;

public interface CategoryDao {
	public List<CategoryModel> getCategories();
	public List<CategoryModel> getCategories(String accountType);
	public List<CategoryModel> getFeeHeadCategories();
	public CategoryModel getCategory(String id);
	public int delete(String id);
	public int update(CategoryModel category);
	public List<MonthModel> getMonthList();
}
