package com.wktech.doasang.presentation.controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.wktech.doasang.application.services.CustomUserDetailsService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

@RestController
@RequestMapping("/auth")
public class AuthController {

	@Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private CustomUserDetailsService userDetailsService;
        
    @Value("${jwt.secret}")
    private String jwtSecret;
    
    public String getJwtSecret() {
        return jwtSecret;
    }

	// Criação de token JWT.
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestParam String username, @RequestParam String password)
	{
		Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password)
        );

        SecurityContextHolder.getContext().setAuthentication(authentication);
	
		String user = authentication.getName();
		Date now = new Date();
		Date validity = new Date(now.getTime() + 3600000);
			
		Algorithm algorithm = Algorithm.HMAC256(this.getJwtSecret());
					
		SecurityContextHolder.getContext().setAuthentication(authentication);

		// Cria o token JWT.
		String jwtToken = JWT.create()
				.withSubject(user)
				.withIssuedAt(now)
				.withExpiresAt(validity)
				.withClaim("doasangUser_details", "")
				.withClaim("doasangUser_principal", username)
				.withClaim("scopes", "admin")
				.sign(algorithm);
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.body(jwtToken);

	}

	
}