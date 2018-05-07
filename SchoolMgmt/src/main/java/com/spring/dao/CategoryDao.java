package com.spring.dao;

import java.util.List;

import com.spring.model.CategoryModel;

public interface CategoryDao {
	public List<CategoryModel> getCategories();
	public CategoryModel getCategory(String id);
	public int delete(String id);
	public int update(CategoryModel category);
}
