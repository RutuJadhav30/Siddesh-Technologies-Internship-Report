package com.voting.onlinevotingsystem;

import com.voting.onlinevotingsystem.entity.User;
import com.voting.onlinevotingsystem.repository.UserRepository;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class OnlinevotingsystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(OnlinevotingsystemApplication.class, args);
    }

    @Bean
    CommandLineRunner runner(UserRepository repo,
                             BCryptPasswordEncoder encoder) {
        return args -> {

            if (repo.findByUsername("admin") == null) {
                User admin = new User();
                admin.setUsername("admin");
                admin.setPassword(encoder.encode("admin123"));
                admin.setRole("ADMIN");
                admin.setHasVoted(false);
                repo.save(admin);
            }
        };
    }
}