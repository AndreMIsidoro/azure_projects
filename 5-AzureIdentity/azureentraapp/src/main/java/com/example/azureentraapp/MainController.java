package com.example.azureentraapp;

import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

  @GetMapping("/")
    public String index() {
        return "index"; // Unauthenticated landing page with login button
    }

    @GetMapping("/home")
    public String home(Model model, OAuth2AuthenticationToken authentication) {
        model.addAttribute("userName", authentication.getPrincipal().getAttribute("name"));
        model.addAttribute("userEmail", authentication.getPrincipal().getAttribute("email"));
        return "home"; // Authenticated user view
    }
}
