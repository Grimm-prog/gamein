<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.game.entity.Videogame" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Catalog</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- il mio CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>


<!-- Navbar -->
    <%@include file ="nav.jsp" %>

		
	<!-- Creazione lista videogame -->
	<%List<Videogame> videogiochi = (List<Videogame>) request.getAttribute("videogames"); %>
	
    <!-- contenuto principale -->
    <div class="container pt-5">

        <!-- aggingi il collegamento al filtro che cerca per categoria sulla ricerca già fatta dall'utente -->
        <div class="row justify-content-center pt-5 mb-2" style="text-align: center;">

								<%
									if (videogiochi.isEmpty()) {
								%>
								<%
								if (request.getParameter("titolo") != null) {
								%> 
								<h1>Nessun risultato per il videogame:"<b><%=request.getParameter("titolo")%></b>"</h1>
								<%
								} else {
								%> 
								<h1>Nessun videogame presente in archivio </h1>
								<%
								}
								%>
	
        </div>

		      
        <!-- introduco le immagini -->
        
		<% } else { %>
		
		<!-- aggiungere un bottone sulla sinistra con il selettore alle categorie-->
        <div class="pt-5 mb-2">
            <button class="btn-search" type="submit">categoria</button>
        </div>
		
		<div class="row justify-content-center mt-3">
		<%
	         for (Videogame videogioco : videogiochi){
	     %>

           <div class="col-6 col-md-2">
           		 <a href="videogioco?id=<%= videogioco.getId() %>">
                    <div class="card">

                        <img src="<%= videogioco.getFoto() %>"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">

                    </div>
                </a>
            </div>
          <%
	         }
		}
        %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
