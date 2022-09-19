package com.anhduc.managecake.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class CartDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Long idCheckout;
    private String nameProduct;
    private String price;
    private int amount;



}
