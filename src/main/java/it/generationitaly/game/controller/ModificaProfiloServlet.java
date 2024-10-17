package it.generationitaly.game.controller;


import java.io.IOException;

import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


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
		
		long id = Long.parseLong(request.getParameter("id"));
		// System.out.println("id: " + id);

		 Utente utente = utenteRepository.findById(id);
		// System.out.println(automobile);
		 
		 if(utente != null) {
			 if(!username.isEmpty()) {
				 utente.setUsername(username);
			 }
			 if(!foto.isEmpty()) {
				 utente.setFoto(foto);
			 }
		 }
		 utenteRepository.update(utente);
		 request.getRequestDispatcher("profilo.jsp").forward(request, response);
	}

}
