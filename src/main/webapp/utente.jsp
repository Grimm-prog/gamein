<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.game.entity.Utente"%>
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
<link rel="stylesheet" href="stileUtente.css">
</head>
<body>
 <!-- Navbar -->
    <%@ include file="nav.jsp" %>
	<!-- 
	<h1>Benvenuto,((Utente) request.getAttribute("utente")).getUsername()e() %>!</h1>
	<p>Email:((Utente) request.getAttribute("utente")).getEmail()l() %>
	 -->
	<div class="container mt-5" style="max-width: 130pc;" >
	
		<div class="row">
		
			<div class="col" >
			
			<img alt="" 
				src="<%=((Utente) request.getAttribute("utente")).getFoto()%>" class="profile-pic" >
				</div>
				<div class="col ">
				<div class="card text-bg-dark mb-3 " style="max-width: 222rem; margin-top: 200px; max-height: 511px;">
  
  <div class="card-body">
    <h5 class="card-title"><span style="font-size: 30px;">Username:</span> </h5>
    <p class="card-text"><span style="font-size: 80px; align-content: center; margin-bottom: 12px;"> <%= session.getAttribute("username") %></span> </p>
  </div>
				</div>
				<div class="col mt-5" >
					  <form class="d-flex search-form mt-4 mb-3 mb-lg-0" action="logout" method="post"> <!-- aggiunti action e method -->
			            <button class="btn-search" type="submit">logout</button>
			        </form>
				</div>
			</div>
		</div>	
			<!-- Bootstrap JS -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
				crossorigin="anonymous"></script>
		
</body>
</html>