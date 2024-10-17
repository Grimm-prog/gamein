package it.generationitaly.game.controller;


import java.io.IOException;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class ModificaProfiloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UtenteRepository  utenteRepository = new UtenteRepositoryImpl();
	 


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username= request.getParameter("username");
		String foto = request.getParameter("foto");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		Utente utente=(Utente) session.getAttribute("utente");
		// System.out.println("id: " + id);

		 
		// System.out.println(automobile);
		 
		 utente.setUsername(username);
		 utente.setFoto(foto);
		 utente.setNome(nome);
		 utente.setCognome(cognome);
		 utente.setEmail(email);
		 utente.setPassword(password);
		 utenteRepository.update(utente);
		 
		 session.setAttribute("utente", utente);
		 request.getRequestDispatcher("utente.jsp").forward(request, response);
	}

}
