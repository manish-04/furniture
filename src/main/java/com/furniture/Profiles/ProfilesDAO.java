package com.furniture.Profiles;

import java.util.List;


public interface ProfilesDAO {
	
	public void insert(Profiles p);
	public void update(Profiles p);
	public void delete( int pid);

	Profiles getProfile(int pid);
	List<Profiles> getAllProfile();
}
