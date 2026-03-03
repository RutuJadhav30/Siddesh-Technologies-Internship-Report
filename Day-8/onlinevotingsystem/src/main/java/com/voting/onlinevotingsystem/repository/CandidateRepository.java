package com.voting.onlinevotingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.voting.onlinevotingsystem.entity.Candidate;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {
}