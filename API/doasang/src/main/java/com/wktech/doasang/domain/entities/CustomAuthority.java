package com.wktech.doasang.domain.entities;

import org.springframework.security.core.GrantedAuthority;

public class CustomAuthority implements GrantedAuthority 
{

    private String role;

    public CustomAuthority(String role) {
        this.role = role;
    }

    @Override
    public String getAuthority() 
    {
    	return role;
    }
    
}