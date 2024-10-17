<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.game.entity.Videogame"%>
<%@ page import="it.generationitaly.game.entity.Utente"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>INSERISCI RECENSIONE</title>
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- il mio CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body class="d-flex justify-content-center align-items-center min-vh-100 py-4">
<main class="form-signin w-100 m-auto" style="max-width: 400px;">
<form action="sign-in" method="post">
        <nav class="navbar navbar-expand-lg bg-transparent">
            <div class="container-fluid d-flex justify-content-center">
                <h1 class="navbar-brand fs-1" style="font-size: 3rem;"> <span style="color: white;">AGGIUNGI LA TUA </span><span style="color:#652c9b;">RECENSIONE</span> </h1>
            </div>
        </nav>
        
<div class="container mt-5">
  
   <form action="recensione" method="post">
        <div class="range-wrap mb-3">
            <label for="voto" class="form-label">Voto</label>
            <input type="range" class="range form-range" id="voto" name="voto" min="1" max="5" required>
            <output class="bubble"></output>
        </div>

        <div class="range-wrap mb-3">
            <label for="difficolta" class="form-label">Difficoltà </label>
            <input type="range" class="range form-range" id="difficolta" name="difficolta" min="1" max="5" required>
            <output class="bubble"></output>
        </div>

        <div class="range-wrap mb-3">
            <label for="tempoDiGioco" class="form-label">Tempo di gioco (ore)</label>
            <input type="range" class="range form-range" id="tempoDiGioco" name="tempoDiGioco" min="1" max ="120" required>
            <output class="bubble"></output>
        </div>
        
        <div class="mb-3">
            <label for="testo" class="form-label">Testo recensione</label>
            <textarea class="form-control" id="testo" name="testo" required></textarea>
        </div>
        

        <button type="submit" class="btn btn-bd-primary2  w-100 py-2 fw-bold text-uppercase">PUBBLICA</button>
    </form>
</div>
</form>
</main>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>

const allRanges = document.querySelectorAll(".range-wrap");
allRanges.forEach(wrap => {
  const range = wrap.querySelector(".range");
  const bubble = wrap.querySelector(".bubble");

  range.addEventListener("input", () => {
    setBubble(range, bubble);
  });
  setBubble(range, bubble);
});

function setBubble(range, bubble) {
  const val = range.value;
  const min = range.min ? range.min : 0;
  const max = range.max ? range.max : 100;
  const newVal = Number(((val - min) * 100) / (max - min));
  bubble.innerHTML = val;

  // Sorta magic numbers based on size of the native UI thumb
  bubble.style.left = `calc(${newVal}% + (${8 - newVal * 0.15}px))`;
}

</script>

</body>
</html>
