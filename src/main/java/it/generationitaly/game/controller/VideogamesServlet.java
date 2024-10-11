package it.generationitaly.game.controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;

public class VideogamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		// System.out.println("videogame.id="+id); 
		Videogame videogame = videogameRepository.findById(id);
		// System.out.println(videogame);
		request.setAttribute("videogame", videogame);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogame.jsp");
		requestDispatcher.forward(request, response);
	}
 
} 
