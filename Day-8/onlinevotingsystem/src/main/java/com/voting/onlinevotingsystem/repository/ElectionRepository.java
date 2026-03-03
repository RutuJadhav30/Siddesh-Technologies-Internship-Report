package com.voting.onlinevotingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.voting.onlinevotingsystem.entity.Election;

public interface ElectionRepository extends JpaRepository<Election, Long> {
}