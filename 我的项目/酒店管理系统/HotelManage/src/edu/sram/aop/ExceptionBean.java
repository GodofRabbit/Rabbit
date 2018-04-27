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
	//����ex��������Ŀ�귽���׳����쳣����
    @AfterThrowing(throwing="ex",pointcut="within(edu.sram..*)")
    public void recordException(Exception ex) throws IOException{
    	//��¼�쳣��Ϣ
    	FileWriter fw=new FileWriter("d://error.log",true);
		PrintWriter out=new PrintWriter(fw);
		ex.printStackTrace(out);//���쳣ջ��Ϣд��error.log
		out.flush();
		out.close();
		fw.close();
	}

}
