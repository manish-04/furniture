package com.furniture.cart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cid;
	private String username;
	private String shipping_Address;
	private String billing_Address;
	private int id;
	private int quantity;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getShipping_Address() {
		return shipping_Address;
	}
	public void setShipping_Address(String shipping_Address) {
		this.shipping_Address = shipping_Address;
	}
	public String getBilling_Address() {
		return billing_Address;
	}
	public void setBilling_Address(String billing_Address) {
		this.billing_Address = billing_Address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Cart() {
	
	}
	
	
}
