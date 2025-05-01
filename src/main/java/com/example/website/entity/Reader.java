package com.example.website.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "readers")
public class Reader {
    @Id
    private int idReader;

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    public int getIdReader() {
        return idReader;
    }

    public void setIdReader(int idReader) {
        this.idReader = idReader;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}