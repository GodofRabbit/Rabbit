package com.tarena.dangdang.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tarena.util.ConnectionManagement;

public class TransactionInterceptor extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception {
		try{
		ConnectionManagement.getConnection().setAutoCommit(false);
		String result=invocation.invoke();//相当于调用action的后续方法
		ConnectionManagement.getConnection().commit();
		return result;
		}catch(Exception e){
			e.printStackTrace();
			ConnectionManagement.getConnection().rollback();
			throw e;
		}finally{
			ConnectionManagement.close();
		}
	}
	
}
