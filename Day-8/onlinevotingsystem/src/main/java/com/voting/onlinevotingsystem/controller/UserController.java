package com.voting.onlinevotingsystem.controller;

import com.voting.onlinevotingsystem.entity.*;
import com.voting.onlinevotingsystem.repository.*;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    private final CandidateRepository candidateRepo;
    private final UserRepository userRepo;
    private final ElectionRepository electionRepo;

    public UserController(CandidateRepository candidateRepo,
                          UserRepository userRepo,
                          ElectionRepository electionRepo) {
        this.candidateRepo = candidateRepo;
        this.userRepo = userRepo;
        this.electionRepo = electionRepo;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model, Authentication auth) {

        User user = userRepo.findByUsername(auth.getName());
        Election election = electionRepo.findById(1L).orElse(new Election());

        model.addAttribute("candidates", candidateRepo.findAll());
        model.addAttribute("hasVoted", user.isHasVoted());
        model.addAttribute("electionActive", election.isActive());

        return "user-dashboard";
    }

    @PostMapping("/vote")
    public String vote(@RequestParam Long id, Authentication auth) {

        User user = userRepo.findByUsername(auth.getName());

        if (!user.isHasVoted()) {

            Candidate c = candidateRepo.findById(id).orElse(null);

            if (c != null) {
                c.setVoteCount(c.getVoteCount() + 1);
                candidateRepo.save(c);

                user.setHasVoted(true);
                userRepo.save(user);
            }
        }

        return "redirect:/user/dashboard";
    }
}