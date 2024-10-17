<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.game.entity.Utente"%>
<%@ page import="it.generationitaly.game.entity.Videogame" %>
<%@page import="it.generationitaly.game.entity.Recensione"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina Utente</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap"
	rel="stylesheet">

<!-- il mio CSS -->
<link rel="stylesheet" href="styles.css">
</head>
<body>
<!-- Creazione lista videogame -->
	<% Utente utente = (Utente) session.getAttribute("utente"); %>

	<!-- Navbar -->
	<%@ include file="nav.jsp"%>
	<!-- 
	<h1>Benvenuto,((Utente) request.getAttribute("utente")).getUsername()e() %>!</h1>
	<p>Email:((Utente) request.getAttribute("utente")).getEmail()l() %>
	 -->
	<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-4 ">
            <img alt="" src="<%=utente.getFoto()%>" class="profile-pic" style="width: 400px; height: 400px; object-fit: cover; ">
        </div>
        <div class="col-lg-8 " style="padding-left: 50px;">
            <div class="card review-card mb-3" style="margin-top: 200px; max-height: 300px; ">
                <div class="card-body">
                    <h5 class="card-title">
                        <span style="font-size: 30px;">Username:</span>
                    </h5>
                    <p class="card-text">
                        <span style="font-size: 30px; align-content: center; margin-bottom: 12px;">
                            <%=utente.getUsername()%>
                        </span>
                    </p>
                </div>
            </div>
            <div class="card review-card mb-3" style="margin-top: 20px; max-height: 300px;">
                <div class="card-body">
                    <h5 class="card-title">
                        <span style="font-size: 30px;">Email:</span>
                    </h5>
                    <p class="card-text">
                        <span style="font-size: 30px; align-content: center; margin-bottom: 12px;">
                            <%=utente.getEmail()%>
                        </span>
                    </p>
                </div>
            </div>
        </div>
    </div>
<div  style="margin-top: 200px;" >

	<div class="row justify-content-center pt-5 mb-3">
            <h1 style="text-align: center;">LA MIA LISTA</h1>
            <br>
            <br>
        </div>
<!-- introduco le immagini -->
        <div class="row justify-content-center mt-4" style="border: 2px solid #7851a9; padding: 50px; border-radius: 10px; background-color: #652c9b; ">
          <% if(!utente.getPreferiti().isEmpty()) { %>
          <% for(int i=0;i<5 && i<utente.getPreferiti().size();i++){ %>
          
           <div class="col-6 col-md-2">
           		 <a href="videogioco?id=<%= utente.getPreferiti().get(i).getVideogame().getId() %>">
                    <div class="card">
                        <img src="<%= utente.getPreferiti().get(i).getVideogame().getFoto() %>"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </a>
            </div>
             <% }%>
            <% }%>
            <!--  
            <div class="col-6 col-md-2">
           		 <a href="#">
                    <div class="card">
                        <img src="#"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-2">
           		 <a href="#">
                    <div class="card">
                        <img src="#"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </a>
            </div>
           <div class="col-6 col-md-2">
           		 <a href="#">
                    <div class="card">
                        <img src="#"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-2">
           		 <a href="#">
                    <div class="card">
                        <img src="#"
                             class="img-fluid"
                            style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </a>
            </div>
            -->
            <%if(utente.getPreferiti().size()>5){ %>
            <div class="col mt-5">
				<form class="d-flex search-form mt-4 mb-3 mb-lg-0" action="cerca"
					method="post">
					<!-- aggiunti action e method -->
					<button class="btn btn-bd-primary2 py-2 fw-bold text-uppercase" type="submit">lista completa</button>
				</form>
			</div>
			<%} %>
        </div>
		</div>
	 	<div class="row justify-content-center pt-5 mb-3">
	            <h1 style="text-align: center;">LE MIE RECENSIONI</h1>
	            <br>
	            <br>
	        </div>
	        </div>
	        <% List<Recensione> recensioni = utente.getRecensioni(); %>
	    <!-- qui andranno le card con le recensioni -->
	    <div class="container-fluid" style="background-color: #652c9b;">
	        <div class="container pt-5">
	            <div class="row">
	            <%  for(Recensione recensione: recensioni){ %>
	            	<% String stelle="";
	            	for(int i=0;i<5;i++){
	            		if(i<recensione.getVoto()){
	            			stelle+="★";
	            		}else{
	            			stelle+="☆";
	            		}
	            	} %>
	                <div class="col-md-4">
	                    <div class="card review-card">
	                        <div class="card-body" style="text-align: center;">
	                            <h5 class="card-title"><%= recensione.getVideogame().getTitolo() %></h5>
	                            <h6 class="card-subtitle mb-2 "><%= stelle %></h6>
	                            <p class="card-text pb-2"><%= recensione.getCommento() %></p>
	                        </div>
	                    </div>
	                </div>
	                <% } %>
	               
	            </div>
	        </div>
	    </div>
	    </div>
	    </div>
				<div class="col mt-5">
					<form class="d-flex search-form mt-4 mb-3 mb-lg-0" action="logout"
						method="post">
						<!-- aggiunti action e method -->
						<button class="btn btn-bd-primary2 py-2 fw-bold text-uppercase" type="submit">logout</button>
					</form>
				</div>
				
				<!-- Bootstrap JS -->
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>