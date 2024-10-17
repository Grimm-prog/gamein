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
<body>

<div class="container mt-5">
  
   <form action="Recensione" method="post">
        <div class="mb-3">
            <label for="voto" class="form-label">Voto</label>
            <input type="range" class="form-range" id="voto" name="voto" min="1" max="5" required>
        </div>

        <div class="mb-3">
            <label for="difficolta" class="form-label">Difficoltà </label>
            <input type="range" class="form-range" id="difficolta" name="difficolta" min="1" max="5" required>
        </div>

        <div class="mb-3">
            <label for="tempoDiGioco" class="form-label">Tempo di gioco (ore)</label>
            <input type="range" class="form-range" id="tempoDiGioco" name="tempoDiGioco" min="1" max ="120" required>
        </div>
        
        <div class="mb-3">
            <label for="commento" class="form-label">Commento</label>
            <textarea class="form-control" id="commento" name="commento" required></textarea>
        </div>
        

        <button type="submit" class="btn btn-primary">Inserisci Recensione</button>
    </form>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
