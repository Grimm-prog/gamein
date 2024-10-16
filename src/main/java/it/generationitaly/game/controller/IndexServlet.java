package it.generationitaly.game.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import it.generationitaly.game.entity.Recensione;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;


public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Videogame> videogames = videogameRepository.findAll();
		List<Videogame> videogamesByData = videogameRepository.OrderByDataDesc();
		List<Videogame> videogamesByAvgVoto = videogameRepository.OrderByAvgVoto();
		
		request.setAttribute("videogames", videogames);
		request.setAttribute("videogamesByData", videogamesByData);
		request.setAttribute("videogamesByAvgVoto", videogamesByAvgVoto);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

}
