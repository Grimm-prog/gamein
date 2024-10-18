package it.generationitaly.game.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;


public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UtenteRepository utenteRepository = new UtenteRepositoryImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String foto = request.getParameter("foto");

		
		Utente utente = new Utente();
		utente.setNome(nome);
		utente.setCognome(cognome);
		utente.setUsername(username);
		utente.setPassword(password);
		utente.setEmail(email);
		utente.setFoto(foto);
		 
		if(utenteRepository.findByUsername(username) == null) {
			utenteRepository.save(utente);
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("sign-in.jsp?errore");
		}
		
	}

}