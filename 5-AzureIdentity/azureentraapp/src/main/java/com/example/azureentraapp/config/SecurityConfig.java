package com.example.azureentraapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(
            authorize -> authorize.requestMatchers("/", "/css/**", "/js/**").permitAll()
            .anyRequest().authenticated()
            )
            .oauth2Login(
                oauth2 -> oauth2
                    .defaultSuccessUrl("/home", true)
            );                                     // enable OAuth2 login
        return http.build();
    }
}
