package com.wktech.doasang.infrastructure.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import com.wktech.doasang.security.JwtAuthenticationFilter;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfiguration {

  @Autowired
  private UserDetailsService userDetailsService; 

  @Value("${jwt.secret}")
  private String secretKey;

  @Bean
  public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
      return authConfig.getAuthenticationManager();
  }
  
  @Bean
  public BCryptPasswordEncoder bCryptPasswordEncoder() {
      return new BCryptPasswordEncoder();
  }
  
  @Bean
  public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    
     CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.setAllowedHeaders(List.of("Authorization", "Cache-Control", "Content-Type"));
        corsConfiguration.setAllowedOrigins(List.of("*"));
        corsConfiguration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "PUT","OPTIONS","PATCH", "DELETE"));
        corsConfiguration.setAllowCredentials(false);
        corsConfiguration.setExposedHeaders(List.of("Authorization", "Content-Type"));

    http
    .cors(cors -> cors.configurationSource(request -> corsConfiguration))//.cors().and()    
        .csrf(c->c.disable())
        .authorizeHttpRequests(auth-> auth
          .requestMatchers("/actuator/**").permitAll()
          .requestMatchers("/swagger-ui/**").permitAll()        
          .requestMatchers("/api-docs/**").permitAll()
          .requestMatchers("/auth/login").permitAll()
          //.requestMatchers("/**").permitAll() //Comentar depois de implementar o jwt
          .anyRequest().authenticated()
          ) 
        .addFilterBefore(new JwtAuthenticationFilter(userDetailsService, secretKey), UsernamePasswordAuthenticationFilter.class)
        .sessionManagement(ss->ss.sessionCreationPolicy(SessionCreationPolicy.STATELESS));


    return http.build();
  }
  
}
