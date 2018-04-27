package com.tarena.dangdang.action.user;

public class CheckCodeAction extends BaseAction{
	private String code;
	private boolean result;
	public String execute(){
		String serverCode=(String)session.get("code");
		if(code.equalsIgnoreCase(serverCode)){
			result=true;
		}else{
			result=false;
		}
		return "sucess";
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}

	
}
