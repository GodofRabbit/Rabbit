package com.shop.dao;

import java.util.List;

import com.shop.entity.Address;
import com.shop.entity.Brand;
import com.shop.entity.Car;
import com.shop.entity.SearchCar;

public interface CarDao {
	//��ȡ��ȡ����ַ
	public List<Address> getAddress(String address);
	//��ѯ���г���
	public List<Car> getCars(SearchCar search);
		
	public Car  findCar(int cid);
	public Brand findBrand(int bid);
	public String findType(int tid);
	
	public List<Car>  findSamePrice(Car car);

}
