package com.voting.onlinevotingsystem.controller;

import com.voting.onlinevotingsystem.entity.Candidate;
import com.voting.onlinevotingsystem.entity.Election;
import com.voting.onlinevotingsystem.repository.CandidateRepository;
import com.voting.onlinevotingsystem.repository.ElectionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final CandidateRepository candidateRepo;
    private final ElectionRepository electionRepo;

    public AdminController(CandidateRepository candidateRepo,
                           ElectionRepository electionRepo) {
        this.candidateRepo = candidateRepo;
        this.electionRepo = electionRepo;
    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("candidates", candidateRepo.findAll());
        return "admin-dashboard";
    }

    @PostMapping("/addCandidate")
    public String addCandidate(@RequestParam String name) {
        Candidate candidate = new Candidate();
        candidate.setName(name);
        candidate.setVoteCount(0);
        candidateRepo.save(candidate);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/start")
    public String startElection() {
        Election election = electionRepo.findById(1L).orElse(new Election());
        election.setActive(true);
        electionRepo.save(election);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/stop")
    public String stopElection() {
        Election election = electionRepo.findById(1L).orElse(new Election());
        election.setActive(false);
        electionRepo.save(election);
        return "redirect:/admin/dashboard";
    }
}