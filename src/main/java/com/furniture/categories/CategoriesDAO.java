package com.furniture.categories;

import java.util.List;

public interface CategoriesDAO {
	
	public void insert(Categories c);
	public void update(Categories c);
	
	public void delete(int cid);
	Categories getCategories(int cid);
    public List<Categories> getAllCategories();
}
