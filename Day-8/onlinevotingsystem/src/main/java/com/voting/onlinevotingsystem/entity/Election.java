package com.voting.onlinevotingsystem.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Election {

    @Id
    private Long id = 1L;

    private boolean active = false;
}