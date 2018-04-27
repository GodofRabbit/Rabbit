package edu.sram.aop;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class ExceptionBean {
	//采用ex参数接收目标方法抛出的异常对象
    @AfterThrowing(throwing="ex",pointcut="within(edu.sram..*)")
    public void recordException(Exception ex) throws IOException{
    	//记录异常信息
    	FileWriter fw=new FileWriter("d://error.log",true);
		PrintWriter out=new PrintWriter(fw);
		ex.printStackTrace(out);//将异常栈信息写入error.log
		out.flush();
		out.close();
		fw.close();
	}

}
