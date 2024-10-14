package it.generationitaly.game.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static  UtenteRepository utenteRepository=new UtenteRepositoryImpl();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Utente utente = utenteRepository.findByUsername(username);
		if (utente != null && utente.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("utente", utente);
			session.setAttribute("username", utente.getUsername());
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.jsp?erroreCredenzali");
		}
	}

}
