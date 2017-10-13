package com.furniture.products;

import java.util.List;

public interface ProductsDAO {
	
	void insert(Products pd);
	void update(Products pd);
	
	void delete(int pdid);
	Products getProduct(int pdid);
	List<Products> getAllProducts();

}
