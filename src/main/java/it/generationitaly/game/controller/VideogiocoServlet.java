package it.generationitaly.game.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.Session;

import it.generationitaly.game.entity.Recensione;
import it.generationitaly.game.entity.Utente;
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
import jakarta.servlet.http.HttpSession;

public class VideogiocoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RecensioneRepository recensioneRepository= new RecensioneRepositoryImpl();
	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utente utente =(Utente)session.getAttribute("utente");
		long id = Long.parseLong(request.getParameter("id"));
		Videogame videogame = videogameRepository.findById(id);
		Double avgv = recensioneRepository.AvgVoto(id);
		Double avgT = recensioneRepository.AvgTempoDiGioco(id);
		Double avgd=recensioneRepository.AvgDifficolta(id);
		boolean addrecensione=false;
		if (utente!=null) {
			Recensione recensione = recensioneRepository.findByVidoegameId(id, utente);
			if (recensione==null) {
				addrecensione=true;
				
			}
		}
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
		request.setAttribute("addrecensione", addrecensione);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogioco.jsp");
		requestDispatcher.forward(request, response);
	}
 
} 
