package org.example.pshandakov.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "action_auth_reg_history")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActionAuthRegHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idAction;

    @Column(nullable = false)
    private String email;

    @Column(nullable = true)
    private String username;

    @Column(nullable = false)
    private LocalDateTime timeAction;

    @Column(nullable = false)
    private String description;

    @Column(nullable = true)
    private String actionType;
}
