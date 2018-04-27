package com.tarena.dangdang.action.main;

import com.tarena.dao.ProductDao;



public class ChackISBN {
	
		private String isbn;
		private boolean data;
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		
		public boolean getData() {
			return data;
		}
		public void isData(boolean data) {
			this.data = data;
		}
		public String execute() throws Exception{
		
			data=ProductDao.findIsbn(isbn);
			if(data==false){
				data=false;
			}else{
				data=true;
			}
			System.out.println(data+"|||isbn");
			return "success";
		
		}
	
}
