package com.example.javawebserver;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String zip = request.getParameter("zip");

        User user = new User(firstName, lastName, email,dateOfBirth);
        UserDAO userDAO = new UserDAO();

        if (userDAO.registerUser(user)) {
            request.setAttribute("firstName", firstName);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            response.sendRedirect("register.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
