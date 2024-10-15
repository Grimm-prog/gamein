<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="it.generationitaly.game.entity.Utente" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina Utente</title>
<!-- Bootstrap CSS -->
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
   		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    	<!-- Google Fonts -->
    	<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    
    	<!-- il mio CSS -->
    	<link rel="stylesheet" href="style-login.css">
</head>
<body>
	<h1>Benvenuto, <%= ((Utente) request.getAttribute("utente")).getUsername() %>!</h1>
	<p>Email: <%= ((Utente) request.getAttribute("utente")).getEmail() %>
	
	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>