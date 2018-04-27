package com.shop.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

//shiro�Ľ�ɫ������and�Ĺ�ϵ,����ʵ��or�Ĺ�ϵ
public class CustomRolesAuthorizationFilter extends AuthorizationFilter
{

 @Override
 protected boolean isAccessAllowed(ServletRequest request,
   ServletResponse response, Object mappedValue) throws Exception
 {
  Subject subject = getSubject(request, response);  
        String[] rolesArray = (String[]) mappedValue;  

        if (rolesArray == null || rolesArray.length == 0) 
        {  
            return true;  
        }  
        for(int i=0;i<rolesArray.length;i++)
        {
            if(subject.hasRole(rolesArray[i]))
            {  
                return true;  
            }  
        }  
        return false;  
 }
}
