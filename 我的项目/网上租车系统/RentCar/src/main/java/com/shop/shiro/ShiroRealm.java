package com.shop.shiro;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.shop.entity.User;
import com.shop.service.UserService;
//realm需要查询数据库，并得到正确的数据
public class ShiroRealm extends AuthorizingRealm{
	@Autowired
	private UserService userService;

    /**
     * 授权:
     * 
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        
        return null;
    }

    /*
     * 用户验证
     * 
     */
    @Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		SimpleAuthenticationInfo info = null;
		//1.将token转换为UsernamePasswordToken
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		//2.获取用户名即可
		String account = upToken.getUsername();
		//3.查询数据库，是否存在指定用户名和密码的用户
		User user = userService.login(account);
		if(user!=null){
		Object principal = account;
		String realmName = this.getName();
		ByteSource salt = ByteSource.Util.bytes(user.getPhone());
		info = new SimpleAuthenticationInfo(principal,user.getPassword(), salt, realmName);
		return info;
		}else{
				throw new AuthenticationException();
			}
	}


    //init-method 配置. 
    public void setCredentialMatcher(){
        HashedCredentialsMatcher  credentialsMatcher = new HashedCredentialsMatcher();    
        credentialsMatcher.setHashAlgorithmName("MD5");//MD5算法加密
        credentialsMatcher.setHashIterations(1024);//1024次循环加密      
        setCredentialsMatcher(credentialsMatcher);
    }
    
    //获取盐值加密后的密码
    public static void main(String[] args) {
		String hashAlgorithmName = "MD5";
		Object credentials = "123456";
		Object salt = ByteSource.Util.bytes("15735104464");
		int hashIterations = 1024;
		
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		System.out.println(result);
	}

}

