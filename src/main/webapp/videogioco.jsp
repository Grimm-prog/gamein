<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.game.entity.Videogame" %>


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
	<%Videogame videogioco = (Videogame) request.getAttribute("videogame"); %>
	

    <!-- contenuto principale -->
    <div class="container pt-5">
        <!-- titolo del gioco ricercato in un h1 -->
        <div class="row justify-content-center pt-5 mb-2">
            <h1 style="text-align: center;"><%= videogioco.getTitolo() %></h1>
        </div>
        <div class="row justify-content-center">
            <!-- introduco l'immagine principale o il possibile carosello-->
            <div class="col-lg-8">
                <div class="content-box">
                    <img src="<%= videogioco.getFoto() %>"
                        alt="Descrizione dell'immagine" class="img-fluid"
                        style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
                </div>
            </div>
        </div>
        <!-- descrizione -->
        <div class="row justify-content-center pt-5 mb-2">
            <h1 style="text-align: center;">DESCRIZIONE</h1>
        </div>
        <div class="row justify-content-center pt-5 mb-2">
            <p
                style="text-align: center;color: #652c9b; border: 2px solid #7851a9; padding: 50px; border-radius: 10px;">
                <%= videogioco.getDescrizione() %>
             </p>
        </div>
        <!-- dettagli -->
        <div class="row justify-content-center pt-5 mb-3">
            <h1 style="text-align: center;">DETTAGLI</h1>
            <br>
            <br>
            <br>
            <br>
        </div>
        <!-- introduco le icone -->
        <div class="row justify-content-center mt-4">
            <div class="col-6 col-md-2">
				 <div class="card">
		        <button class="btn btn-purple d-flex flex-column align-items-center">
		            <img src="https://www.instant-gaming.com/themes/igv2/modules/product/images/icon-features/feature-icon2.svg" alt="Icon" class="img-fluid" style="width: 50%; max-width: 80px;">
		            <span>SinglePlayer</span>
		        </button>
		    </div>
		    </div>
            <div class="col-6 col-md-2">
				<div class="card">
						<button class="btn btn-purple d-flex flex-column align-items-center">
						<img src="https://www.instant-gaming.com/themes/igv2/modules/product/images/icon-features/feature-icon36.svg" alt="Icon" class="img-fluid" style="width: 50%; max-width: 80px;">
						<span>Multiplayer</span>
						</button>
					</div>
				</div>
             <div class="col-6 col-md-2">
				<div class="card">
		        <button class="btn btn-purple d-flex flex-column align-items-center">
		            <img src="https://www.instant-gaming.com/themes/igv2/modules/product/images/icon-features/feature-icon2.svg" alt="Icon" class="img-fluid" style="width: 50%; max-width: 80px;">
		            <span>SinglePlayer</span>
		        </button>
		    </div>
		    </div>
            <div class="col-6 col-md-2">
				<div class="card">
						      <button class="btn btn-purple d-flex flex-column align-items-center">
						            <img src="" alt="Icon" class="img-fluid" style="width: 50px;">
						            <span>Sviluppatore</span>
						            <img src="	https://cdn.mashthosebuttons.com/assets/images/2011/08/PEGI.jpg" alt="Icon" class="img-fluid" style="width: 50%; max-width: 80px;">
						            <span>SinglePlayer</span>

						        </button>
						    </div>
						    </div>
             <div class="col-6 col-md-2">
				 <div class="card">
		        <button class="btn btn-purple d-flex flex-column align-items-center">

		            <img src="${pageContext.request.contextPath}/img/PEGI2.png" alt="Icon" class="img-fluid" style="width: 100px;">
		            <img src="https://www.instant-gaming.com/themes/igv2/modules/product/images/icon-features/feature-icon2.svg" alt="Icon" class="img-fluid" style="width: 50%; max-width: 80px;">
		            <span>SinglePlayer</span>
		        </button>
		    </div>
		    </div>
		</div>
        <div class="row justify-content-center pt-5 mb-3">
            <h1 style="text-align: center;">RECENSIONI</h1>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>
    <!-- qui andranno le card con le recensioni -->
    <div class="container-fluid" style="background-color: #652c9b;">
        <div class="container pt-5">
            <div class="row">
                <div class="col-md-4">
                    <div class="card review-card">
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title">User123</h5>
                            <h6 class="card-subtitle mb-2 ">★★★★☆</h6>
                            <p class="card-text pb-2">This game is fantastic! The storyline is engaging, and the graphics are out of this world. Highly recommend!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card review-card">
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title">GamerX</h5>
                            <h6 class="card-subtitle mb-2 ">★★★☆☆</h6>
                            <p class="card-text">Good game, but could use some improvements in mechanics. Graphics are great though!</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card review-card">
                        <div class="card-body" style="text-align: center;">
                            <h5 class="card-title">PlayerY</h5>
                            <h6 class="card-subtitle mb-2 ">★★★★★</h6>
                            <p class="card-text">Amazing! One of the best games I’ve played. Highly recommend it for any fan of the genre!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>