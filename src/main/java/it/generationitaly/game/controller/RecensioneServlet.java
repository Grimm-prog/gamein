package it.generationitaly.game.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.mysql.cj.Session;

import it.generationitaly.game.entity.Recensione;
import it.generationitaly.game.entity.Utente;
import it.generationitaly.game.entity.Videogame;
import it.generationitaly.game.repository.RecensioneRepository;
import it.generationitaly.game.repository.UtenteRepository;
import it.generationitaly.game.repository.VideogameRepository;
import it.generationitaly.game.repository.impl.RecensioneRepositoryImpl;
import it.generationitaly.game.repository.impl.UtenteRepositoryImpl;
import it.generationitaly.game.repository.impl.VideogameRepositoryImpl;

@WebServlet("/recensione")
public class RecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecensioneRepository recensioneRepository= new RecensioneRepositoryImpl();
	private VideogameRepository videogameRepository= new VideogameRepositoryImpl();
	private UtenteRepository utenteRepository =new UtenteRepositoryImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utente utente=(Utente)session.getAttribute("utente");
		long idVideogioco = Long.parseLong(request.getParameter("id"));
		String commento = request.getParameter("testo");
		int voto=Integer.parseInt(request.getParameter("voto"));
		int difficolta=Integer.parseInt(request.getParameter("difficolta"));
		int tempoDiGioco=Integer.parseInt(request.getParameter("tempoDiGioco"));
		Videogame videogame = videogameRepository.findById(idVideogioco);
		
			Recensione recensione = new Recensione();
			recensione.setCommento(commento);
			recensione.setVoto(voto);
			recensione.setDifficolta(difficolta);
			recensione.setTempoDiGioco(tempoDiGioco);
			recensione.setUtente(utente);
			recensione.setVideogame(videogame);
			recensioneRepository.save(recensione);
			utente = utenteRepository.findById(utente.getId());
			session.setAttribute("utente", utente);
			response.sendRedirect("videogioco?id="+idVideogioco);
		
	}

}
