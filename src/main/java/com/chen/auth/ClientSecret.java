package com.chen.auth;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author haichen
 */
public class ClientSecret {
    public static void main(String[] args) {
        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String clientSecret = passwordEncoder.encode("123456");
        System.out.println(clientSecret);
    }
}
