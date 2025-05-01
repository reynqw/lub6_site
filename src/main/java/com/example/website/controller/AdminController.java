package com.example.website.controller;

import com.example.website.entity.Book;
import com.example.website.entity.User;
import com.example.website.service.LibraryService;
import com.example.website.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private LibraryService libraryService;

    @Autowired
    private UserService userService; // Добавьте зависимость от UserService

    @GetMapping("/admin")
    public String adminPage(HttpSession session, Model model) {
        var user = (User) session.getAttribute("user");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/login"; // Перенаправляем на страницу логина, если не админ
        }

        List<User> allUsers = userService.getAllUsers(); // Получаем всех пользователей
        model.addAttribute("users", allUsers);

        List<Book> allBooks = libraryService.getAllBooks(); // Получаем все книги
        model.addAttribute("books", allBooks);

        return "admin"; // Открываем страницу администратора
    }
}
