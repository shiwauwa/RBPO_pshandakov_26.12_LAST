package org.example.pshandakov.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;

//TODO: 1. createTicket - должна быть реализация цифровой подписи, а не UUID

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime serverDate;

    private int ticketLifetime;

    private Date activationDate;

    private Date expirationDate;

    private Long userId;

    private Long deviceId;

    private boolean isBlocked;

    private String digitalSignature;

    public static Ticket createTicket(Long userId, boolean isBlocked, Date expirationDate) {
        return Ticket.builder()
                .serverDate(LocalDateTime.now())
                .ticketLifetime(2)
                .activationDate(new Date())
                .expirationDate(expirationDate)
                .userId(userId)
                .isBlocked(isBlocked)
                .digitalSignature(UUID.randomUUID().toString())
                .build();
    }

}
