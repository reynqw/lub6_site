package com.example.website.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class BorrowedBook {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idBorrowedBook;

    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;  // Поле для книги

    @ManyToOne
    @JoinColumn(name = "reader_id")
    private Reader reader;  // Читатель, взявший книгу

    private LocalDate loanDate;  // Дата получения книги
    private LocalDate returnDate;  // Дата возврата книги

    // Геттеры и сеттеры
    public int getIdBorrowedBook() {
        return idBorrowedBook;
    }

    public void setIdBorrowedBook(int idBorrowedBook) {
        this.idBorrowedBook = idBorrowedBook;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public LocalDate getLoanDate() {
        return loanDate;
    }

    public void setLoanDate(LocalDate loanDate) {
        this.loanDate = loanDate;
    }

    public LocalDate getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }
}
