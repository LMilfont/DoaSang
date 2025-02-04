package com.wktech.doasang.domain.entities;

import java.util.Collection;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

public class CustomAuthentication implements Authentication
{
	private String name;
	private boolean isAuthenticated;
	private Object credentials;
	private Collection<? extends GrantedAuthority> authorities;
	private Object details;
	private Object principal;
	
	@Override
	public String getName() 
	{
		return this.name;
	}	
	
	public void setName(String name) 
	{
		this.name = name;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() 
	{
		return this.authorities;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) 
	{
		this.authorities = authorities;
	}

	@Override
	public Object getCredentials() 
	{
		return this.credentials;
	}
	
	public void setCredentials(Object credentials) 
	{
		this.credentials = credentials;
	}

	@Override
	public Object getDetails() 
	{
		return this.details;
	}
	
	public void setDetails(Object details) 
	{
		this.details = details;
	}

	@Override
	public Object getPrincipal() 
	{
		return this.principal;
	}
	
	public void setPrincipal(Object principal) {
		this.principal = principal;
	}

	@Override
	public boolean isAuthenticated() 
	{
		return this.isAuthenticated;
	}

	@Override
	public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException 
	{
		this.isAuthenticated = isAuthenticated;
	}

}
