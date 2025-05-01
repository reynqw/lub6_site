package com.example.website.controller;

import com.example.website.entity.Book;
import com.example.website.entity.BorrowedBook;
import com.example.website.entity.User;
import com.example.website.service.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private LibraryService libraryService;

    // Страница для обычного пользователя
    @GetMapping("/user")
    public String userPage(HttpSession session, Model model) {
        // Получаем информацию о текущем пользователе из сессии
        var user = (User) session.getAttribute("user");

        // Проверка, чтобы убедиться, что пользователь существует и имеет роль "user"
        if (user == null || !"user".equals(user.getRole())) {
            return "redirect:/login";  // Перенаправление на страницу логина, если пользователь не авторизован
        }

        int readerId = user.getId();  // Получаем ID текущего пользователя

        // Получаем список книг, которые этот пользователь взял
        List<BorrowedBook> borrowedBooks = libraryService.getBorrowedBooksByReaderId(readerId);
        model.addAttribute("borrowedBooks", borrowedBooks);  // Передаем в модель

        // Получаем список всех доступных книг в библиотеке
        List<Book> availableBooks = libraryService.getAllBooks();
        model.addAttribute("availableBooks", availableBooks);  // Передаем в модель

        // Возвращаем имя шаблона (view) для отображения на странице пользователя
        return "user";  // Открываем страницу user.html
    }
}
