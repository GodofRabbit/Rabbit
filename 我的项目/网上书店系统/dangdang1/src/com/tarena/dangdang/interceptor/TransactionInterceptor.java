package com.tarena.dangdang.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tarena.util.ConnectionManagement;

public class TransactionInterceptor extends AbstractInterceptor{

	public String intercept(ActionInvocation invocation) throws Exception {
		try{
		ConnectionManagement.getConnection().setAutoCommit(false);
		String result=invocation.invoke();//�൱�ڵ���action�ĺ�������
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
