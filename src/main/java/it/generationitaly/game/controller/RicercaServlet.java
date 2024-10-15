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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("In servlet ricerca, doGet");
		String titolo = request.getParameter("titolo");
		String genereName = request.getParameter("genere");
		String sviluppatoreName = request.getParameter("sviluppatore");
		System.out.println(titolo);
		System.out.println(genereName);
		System.out.println(sviluppatoreName);
		int choice = 0;
		if (titolo != null) {
			if (genereName != null) {
				if (sviluppatoreName != null) {
					choice = 3;
				}
			} else {
				if (sviluppatoreName != null) {
					choice = 5;
				} else {
					choice = 1;
				}
			}
		} else {
			if (genereName != null) {
				if (sviluppatoreName != null) {
					choice = 4;
				} else {
					choice = 7;
				}
			} else {
				if (sviluppatoreName != null) {
					choice = 6;
				} else {
					choice = 0;
				}
			}
		}
		List<Videogame> videogames = null;
		switch (choice) {
		case 0:
			videogames = videogameRepository.findAll();
			break;
		case 1:
			videogames = videogameRepository.RicercaPerTitolo(titolo);
			break;
		case 2:
			videogames = videogameRepository.findByTitoloGenere(titolo, genereName);
			break;
		case 3:
			videogames = videogameRepository.findByTitoloGenereSviluppatore(titolo, genereName, sviluppatoreName);
			break;
		case 4:
			videogames = videogameRepository.findByGenereSviluppatore(genereName, sviluppatoreName);
			break;
		case 5:
			videogames = videogameRepository.findByTitoloSviluppatore(titolo, sviluppatoreName);
			break;
		case 6:
			videogames = videogameRepository.findBySviluppatore(sviluppatoreName);
			break;
		case 7:
			videogames = videogameRepository.findByGenere(genereName);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + choice);
		}

		request.setAttribute("videogames", videogames);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("videogiochi.jsp");
		requestDispatcher.forward(request, response);

	}

}
