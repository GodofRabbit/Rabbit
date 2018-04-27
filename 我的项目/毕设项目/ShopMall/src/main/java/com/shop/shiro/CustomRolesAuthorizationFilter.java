package com.shop.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

//shiro的角色过滤是and的关系,本类实现or的关系
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
