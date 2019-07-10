package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.MyAddress;

public interface AddressMapper {
	public int insertAddress(MyAddress address);
	public int deleteAddress(String address_id);
	public List<MyAddress> selectAddress(String user_id);
	public int updateAddress(MyAddress address);
}
