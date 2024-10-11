package it.generationitaly.game.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VideogiocoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Videogame> videogame = new ArrayList<Videogame>();
		String titolo = request.getParameter("titolo");
		String genere = request.getParameter("genere");
		String sviluppatore = request.getParameter("sviluppatore");
		String classificazionePegi = request.getParameter("classificazione_pegi");
		Boolean multiplayer = Boolean.parseBoolean(request.getParameter("multiplayer"));
		LocalDate date = LocalDate.parse(request.getParameter("anno_uscita"));
		
		videogame = videogameRepository.findAll();
		/*
		if(titolo != null) {
			videogame = videogameRepository.RicercaPerTitolo(titolo);
		}
		*/
		request.setAttribute("videogame", videogame);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogame.jsp");
		requestDispatcher.forward(request, response);
	}
 
} 
