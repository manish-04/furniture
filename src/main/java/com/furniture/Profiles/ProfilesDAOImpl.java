package com.furniture.Profiles;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.furniture.Profiles.Profiles;

@Repository
@Transactional
public class ProfilesDAOImpl implements ProfilesDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	public void insert(Profiles p) {
		this.sessionFactory.getCurrentSession().save(p);
		
	}

	public void update(Profiles p) {
		this.sessionFactory.getCurrentSession().update(p);
		
	}

	public void delete(int pid) {
		this.sessionFactory.getCurrentSession().createQuery("delete from Profiles where id=:id").setInteger("id", pid).executeUpdate();
		// TODO Auto-generated method stub
		
	}

	public Profiles getProfile(int pid) {
		return(Profiles)this.sessionFactory.getCurrentSession().createQuery("from Profiles where id=:id").setInteger("id", pid).list().get(0);
	}

	public List<Profiles> getAllProfile() {
		return (List<Profiles>)this.sessionFactory.getCurrentSession().createQuery("from Profiles").list();
	}

	

}
