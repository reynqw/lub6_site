package com.example.website.service;

import com.example.website.entity.Book;
import com.example.website.entity.BorrowedBook;
import com.example.website.repository.BookRepository;
import com.example.website.repository.BorrowedBookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibraryService {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BorrowedBookRepository borrowedBookRepository;

    // Получить все книги
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    // Получить список взятых книг по ID читателя
    public List<BorrowedBook> getBorrowedBooksByReaderId(int readerId) {
        return borrowedBookRepository.findByReader_IdReader(readerId);
    }
}
