package it.generationitaly.game.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import it.generationitaly.game.entity.Genere;
import it.generationitaly.game.entity.Sviluppatore;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.entity.VideogameGenere;
import it.generationitaly.game.entity.VideogameSviluppatore;
import it.generationitaly.game.repository.GenereRepository;
import it.generationitaly.game.repository.SviluppatoreRepository;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.GenereRepositoryImpl;
import it.generationitaly.game.repository.impl.SviluppatoreRepositoryImpl;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RicercaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideogameRepository videogameRepository = new VideogameRepositoryImpl();
	private GenereRepository genereRepository  = new  GenereRepositoryImpl();
	private SviluppatoreRepository sviluppatoreRepository = new SviluppatoreRepositoryImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String titolo = request.getParameter("titolo");
		String genere = request.getParameter("genere");
		String sviluppatore = request.getParameter("sviluppatore");
		String annoUscita = request.getParameter("annoUscita");
		String choice = request.getParameter("choice");
		List<Videogame> videogames=null;
		if(titolo!=null) {
		videogames = videogameRepository.RicercaPerTitolo(titolo);
		}
		
		List<Genere> generi = genereRepository.findAll(); 
		List<Sviluppatore> sviluppatori = sviluppatoreRepository.findAll();
		
		if(titolo==null) {
			videogames = videogameRepository.findAll();
		}
		
		if(videogames!=null && genere!=null) {
			videogames =RicercaGenere(genere,videogames);
		}
		if(videogames!=null && annoUscita!=null) {
			videogames =RicercaPerData(annoUscita, videogames);
		}
		if(videogames!=null && annoUscita!=null) {
			videogames =RicercaPerData(annoUscita, videogames);
		}
		if(videogames!=null && sviluppatore!=null) {
			videogames =RicercaSviluppatore(sviluppatore, videogames);
		}
		if(videogames!=null && choice!=null && choice=="VotoAsc") {
			videogames = videogameRepository.OrderByAvgVoto();
		}
		if(videogames!=null && choice!=null && choice=="VotoDesc") {
			videogames = videogameRepository.OrderByAvgVotoDesc();
		}
		if(videogames!=null && choice!=null && choice=="DataAsc") {
			videogames = videogameRepository.OrderByDataAsc();
		}
		if(videogames!=null && choice!=null && choice=="DataDesc") {
			videogames = videogameRepository.OrderByDataDesc();
		}
		
		
		request.setAttribute("sviluppatori", sviluppatori);
		request.setAttribute("generi", generi);
		request.setAttribute("videogames", videogames);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogiochi.jsp");
		requestDispatcher.forward(request, response);

	}
	
	private List<Videogame> RicercaGenere(String genere,List<Videogame> videogames){
		List<Videogame> tmp=new ArrayList<Videogame>();
		for (Videogame videogame : videogames) {
			List<VideogameGenere> generi = videogame.getGeneri();
			for (VideogameGenere collegamentogenere : generi) {
				Genere generegioco = collegamentogenere.getGenere();
				if(generegioco.getName().equals(genere)) {
					tmp.add(videogame);
				}
			}
		}
		
		return tmp;
	}
	private List<Videogame> RicercaSviluppatore(String sviluppatore,List<Videogame> videogames){
		List<Videogame> tmp=new ArrayList<Videogame>();
		for (Videogame videogame : videogames) {
			List<VideogameSviluppatore> sviluppatori = videogame.getSviluppatori();
			for (VideogameSviluppatore collegamentosviluppatore:sviluppatori) {
				 Sviluppatore sviluppatoregioco = collegamentosviluppatore.getSviluppatore();
				if(sviluppatoregioco.getName().equals(sviluppatore)) {
					tmp.add(videogame);
				}
			}
		}
		
		return tmp;
	}
	
	private List<Videogame> RicercaPerData(String data,List<Videogame>videogames ){
		List<Videogame> tmp=new ArrayList<Videogame>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		
		for (Videogame videogame : videogames) {
			String year = sdf.format(videogame.getAnnoUscita());
			if(year.equals(data)) {
				tmp.add(videogame);
			}
			
		}
		return tmp;
	}

	
}
