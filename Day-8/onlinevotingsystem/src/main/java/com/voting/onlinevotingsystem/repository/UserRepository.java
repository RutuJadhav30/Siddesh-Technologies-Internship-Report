package com.voting.onlinevotingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.voting.onlinevotingsystem.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}