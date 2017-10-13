package com.furniture.products;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.furniture.products.Products;

@Repository
@Transactional
public class ProductsImpl implements ProductsDAO{
	@Autowired
	private SessionFactory sessionfactory;
	
	public void insert(Products pd) {
		this.sessionfactory.getCurrentSession().save(pd);
		
	}

	public void update(Products pd) {
		this.sessionfactory.getCurrentSession().update(pd);
		
	}

	public void delete(int pdid) {
		this.sessionfactory.getCurrentSession().createQuery("delete from Products where Id=:id").setInteger("id", pdid).executeUpdate();
		
	}

	public Products getProduct(int pdid) {
		return (Products)this.sessionfactory.getCurrentSession().createQuery("from Products where Id=:id").setInteger("id", pdid).list().get(0);
	}

	public List<Products> getAllProducts() {
		return (List<Products>)this.sessionfactory.getCurrentSession().createQuery("from Products").list();
	}

}
