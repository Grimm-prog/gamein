package it.generationitaly.game.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.RecensioneRepository;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VideogiocoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RecensioneRepository recensioneRepository= new RecensioneRepositoryImpl();
	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Videogame videogame = videogameRepository.findById(id);
		Double avgv = recensioneRepository.AvgVoto(id);
		Double avgT = recensioneRepository.AvgTempoDiGioco(id);
		Double avgd=recensioneRepository.AvgDifficolta(id);
		if(avgv==null)avgv=0.0;
		if(avgd==null)avgd=0.0;
		if(avgT==null)avgT=0.0;
		Double avgDifficolta = Math.floor(avgd*10)/10;
		Double avgVoto = Math.floor(avgv*10)/10;
		Double avgTempoDiGioco = Math.floor(avgT*10)/10;
		request.setAttribute("avgTempoDiGioco", avgTempoDiGioco);
		request.setAttribute("avgVoto", avgVoto);
		request.setAttribute("avgDifficolta", avgDifficolta);
		request.setAttribute("videogame", videogame);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogioco.jsp");
		requestDispatcher.forward(request, response);
	}
 
} 
