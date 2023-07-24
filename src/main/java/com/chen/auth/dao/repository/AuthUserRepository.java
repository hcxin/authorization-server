package com.chen.auth.dao.repository;

import com.chen.auth.dao.entity.AuthUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


/**
 * @author haichen
 */
@Repository
public interface AuthUserRepository extends JpaRepository<AuthUser, Long> {
    AuthUser findByUsernameAndStatus(String username, Integer status);
}
