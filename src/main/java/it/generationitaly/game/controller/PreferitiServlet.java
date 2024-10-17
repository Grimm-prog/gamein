package it.generationitaly.game.controller;

import java.io.IOException;

import it.generationitaly.game.entity.Preferito;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.PreferitoRepository;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.PreferitoRepositoryImpl;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class PreferitiServlet
 */
public class PreferitiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteRepository utenteRepository = new UtenteRepositoryImpl();
	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	private PreferitoRepository preferitoRepository = new PreferitoRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		Long idVideogame = Long.parseLong(request.getParameter("id"));
		Utente utente = utenteRepository.findByUsername(username);
		Videogame videogame = videogameRepository.findById(idVideogame);
		
		Preferito preferito =preferitoRepository.findByUsernameAndVideogame(utente, videogame);
		 
		
		if(preferitoRepository.findByUsernameAndVideogame(utente, videogame) != null) {
			
			preferitoRepository.delete(preferito);
		}else {
			preferitoRepository.save(preferito);
		}
		
		utente = utenteRepository.findByUsername(username);
		session.setAttribute("utente", utente);
		request.setAttribute("videogame", videogame);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogioco.jsp");
		requestDispatcher.forward(request, response);
	}

}
