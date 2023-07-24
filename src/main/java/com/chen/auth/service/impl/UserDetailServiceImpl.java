package com.chen.auth.service.impl;

import com.chen.auth.constant.enumeration.EStatus;
import com.chen.auth.dao.entity.AuthUser;
import com.chen.auth.dao.repository.AuthUserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Objects;

/**
 * @author haichen
 */
@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private AuthUserRepository authUserRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AuthUserDetails userDetails = new AuthUserDetails();
        AuthUser authUser = authUserRepository.findByUsernameAndStatus(username, EStatus.NORMAL.getIndex());
        if (Objects.nonNull(authUser)){
            BeanUtils.copyProperties(authUser, userDetails);
            //TOTO
            userDetails.setAuthorities(Arrays.asList(new SimpleGrantedAuthority("user:edit")));
        }


        return userDetails;
    }
}
