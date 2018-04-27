package com.tarena.dangdang.action.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.entity.GeOrder;


public class SearchDan2 {
	private String T1;
	private String name;
	private String pcode;
	private String isbn;
	private List<GeOrder> Georders=new ArrayList<GeOrder>();
	
	public String getT1() {
		return T1;
	}
	public void setT1(String t1) {
		T1 = t1;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public List<GeOrder> getGeorders() {
		return Georders;
	}
	public void setGeorders(List<GeOrder> georders) {
		Georders = georders;
	}
	public String execute() throws Exception{
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		Date bs;
		long Ttemp=0L;
		try{
		
		
			bs = sd.parse(T1);
			
		Ttemp=bs.getTime();
		}catch(ParseException ex){
			bs=sd.parse(sd.format(new Date(System.currentTimeMillis())));
			Ttemp=bs.getTime();
		}
		
		//上面是日期转为long
		//下面做语句的查询
		OreDao od=new OreDaoImlp();
		Georders=od.searchOnlyOrder(Ttemp, pcode, name, isbn);
		return "success";
	}
	
}
