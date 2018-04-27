package com.shop.serviceImp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.CarDao;
import com.shop.entity.Address;
import com.shop.entity.Brand;
import com.shop.entity.Car;
import com.shop.entity.NoteResult;
import com.shop.entity.SearchCar;
import com.shop.service.CarService;
import com.shop.util.BrandType;
@Service
public class CarServiceImp implements CarService {
	@Autowired
	CarDao carDao;

	public NoteResult listAddress(String address) {
		NoteResult result = new NoteResult();
		List<Address> list = new ArrayList<Address>();
		if(address.length()!=0){
			address = "%"+address+"%";
			list=carDao.getAddress(address);
			if(list.size()!=0){
				result.setData(list);
				result.setState(1);
				return result;
			}else {
				address="%%";
				list=carDao.getAddress(address);
				result.setData(list);
				return result;
			}			
		}else{
			address="%%";
			list=carDao.getAddress(address);
			result.setData(list);
			return result;			
		}
		
		 
	}
	//≤È—Ø≥µ¡æ
		public NoteResult list(String[] type_conditions,String[] price_conditions,String [] title_conditions){
			NoteResult result = new NoteResult();
			SearchCar search = new SearchCar(type_conditions, price_conditions, title_conditions);
			List<Car> cars = carDao.getCars(search);
			result.setData(cars);
			return result;
		}


	public NoteResult findCar(int cid, int bid, int tid) {
		NoteResult result = new NoteResult();
		Car findCar = carDao.findCar(cid);
		Brand findBrand = carDao.findBrand(bid);
		String findType = carDao.findType(tid);
		BrandType type= new BrandType(findBrand.getBrandName(),findBrand.getBrandCountry(),findType);
		List  list = new ArrayList();
		list.add(findCar);
		list.add(type);
		Map<Integer,List> map = new HashMap<Integer,List>();
		map.put(1,list);
		System.out.println(map);
		result.setData(map);
		return result;
		
	}

	public NoteResult findPrice(double price,int id) {
		NoteResult result = new NoteResult();
		Car  car = new Car();
		car.setId(id);
		car.setPrice(price);
		List<Car> list = carDao.findSamePrice(car);
		result.setData(list);
		System.out.println(list);
		return result;
	}

}
