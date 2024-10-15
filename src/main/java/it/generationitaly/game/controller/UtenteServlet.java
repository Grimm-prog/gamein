package it.generationitaly.game.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import it.generationitaly.game.entity.Utente;

public class UtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Verifica se l'utente è autenticato
		HttpSession session = request.getSession();
		if (session != null && session.getAttribute("utente") != null) {
			Utente utente = (Utente) session.getAttribute("utente");

			// Passa l'oggetto utente alla JSP per mostrare i dati utente
			request.setAttribute("utente", utente);
			request.getRequestDispatcher("/utente.jsp").forward(request, response);
		} else {
			// Se non c'è una sessione valida, reindirizza al login
			response.sendRedirect("login.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
