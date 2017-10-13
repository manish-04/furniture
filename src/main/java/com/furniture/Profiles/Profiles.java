package com.furniture.Profiles;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

import com.sun.istack.internal.NotNull;

@Entity
public class Profiles {
		
	
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private int id;
	
		private String username;
		private String email;
		private String password;
		private String phone;
		private String address;
		
		
		private boolean active = true;
		private String role = "ROLE_USER";
		
		public boolean isActive() {
			return active;
		}
		public void setActive(boolean active) {
			this.active = active;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		/*@Pattern(regexp="^[a-zA-Z0-9_{5,20}]$",message="Invalid Username, min Length:5 ,max Length:20")*/
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		
		@NotNull
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public Profiles() {
		}
		
		
}
