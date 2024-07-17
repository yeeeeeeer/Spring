package com.springbook.ioc.injection;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class CollectionBean {
	
	private Map<String, String> addressList;

	public void setAddressList(Map<String, String> addressList) {
		this.addressList = addressList;
	}
	
	public Map<String, String> getAddressList() {
		return addressList;
	}
	
	
	
	
	/*
	private Set<String> addressList;
	
	public void setAddresslist(Set<String> addressList) {
		this.addressList = addressList;
	}

	public Set<String> getAddressList() {
		return addressList;
	}

	public void setAddressList(Set<String> addressList) {
		this.addressList = addressList;
	}
	*/
	
	
	
	/*
	private List<String> addressList;

	public void setAddressList(List<String> addressList) {
		this.addressList = addressList;
	}
	
	public List<String> getAddressList() {
		return addressList;
	}
	*/

}
