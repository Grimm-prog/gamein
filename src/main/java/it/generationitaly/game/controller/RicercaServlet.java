package it.generationitaly.game.controller;

import java.io.IOException;
import java.util.List;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RicercaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("In servlet ricerca, doGet");
		String titolo = request.getParameter("titolo");
		// System.out.println("annuncio.id="+id);
		List<Videogame> videogames = null;
		if(titolo != null && !videogames.isEmpty()) {
			videogames = videogameRepository.findAll();
		} else {
			videogames = videogameRepository.RicercaPerTitolo(titolo);
		}
		request.setAttribute("videogames", videogames);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogiochi.jsp");
		requestDispatcher.forward(request, response);
		
	}

}
