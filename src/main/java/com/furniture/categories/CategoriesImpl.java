package com.furniture.categories;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.furniture.Profiles.Profiles;


@Repository
@Transactional
public class CategoriesImpl implements CategoriesDAO{
	
	@Autowired
	private SessionFactory SessionFactory;

	public void insert(Categories c) {
		this.SessionFactory.getCurrentSession().save(c);
		
	}

	public void update(Categories c) {
		this.SessionFactory.getCurrentSession().update(c);
		
	}

	public void delete(int cid) {
	this.SessionFactory.getCurrentSession().createQuery("delete from Categories where id=:id").setInteger("id", cid).executeUpdate();
		
	}
	
	public Categories getCategories(int cid) {
     
		return (Categories)this.SessionFactory.getCurrentSession().createQuery("from Categories where id=:id").setInteger("id", cid).list().get(0);
	}

	public List<Categories> getAllCategories() {
		return (List<Categories>)this.SessionFactory.getCurrentSession().createQuery("from Categories").list();
	}

}
