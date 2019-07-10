package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.AddressMapper;
import com.nkshare.vo.MyAddress;

@Service
public class AddressService {
	@Autowired
	AddressMapper addressMapper;				
	public List<MyAddress> selectAddress(String user_id){
		return addressMapper.selectAddress(user_id);
	}
	
	public int insertAddress(MyAddress address){
		return addressMapper.insertAddress(address);
	}
	
	public int deleteAddress(String address_id) {
		return addressMapper.deleteAddress(address_id);
	}
}
