<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registrazione</title>
		
		<!-- Bootstrap CSS -->
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
   		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    	<!-- Google Fonts -->
    	<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    
    	<!-- il mio CSS -->
    	<link rel="stylesheet" href="style-login.css">
    	
	</head>

	<body class="d-flex justify-content-center align-items-center min-vh-100 py-4 bg-dark text-light">
	<main class="form-signin w-100 m-auto" style="max-width: 400px;">
		<form action="register" method="post">
		<nav class="navbar navbar-expand-lg bg-transparent">
	    	<div class="container-fluid d-flex justify-content-center">
	        	<h1 class="navbar-brand fs-1" style="font-size: 3rem;"> <span style="color: white;">SIGN</span><span style="color:#652c9b;">IN</span> </h1>
	   		</div>
		</nav>

			<div class="input-group mb-3"> 
	  			<span class="input-group-text" id="basic-addon1">Username</span>
	 			<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" id="username" name="username" required>
			</div>
			
			<div class="input-group mb-3">
	 			<span class="input-group-text" id="basic-addon1">Password</span>
	 			<input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="password" name="password" required>
			</div>
			
			<div class="input-group mb-3">
	  			<span class="input-group-text" id="basic-addon1">Email</span>
	 			<input type="email" class="form-control" placeholder="Email" aria-label="email" aria-describedby="basic-addon1" id="email" name="email" required>
			</div>
			
			<!-- Avatar selection -->
			<div class="mb-3">
			    <label class="form-label">Seleziona il tuo avatar:</label>
			    <div class="d-flex justify-content-around">
			        <div>
			            <input type="radio" id="avatar1" name="avatar" value="avatar1.png" required>
			            <label for="avatar1">
			                <img src="https://img.freepik.com/vettori-premium/ritratto-di-un-cane-alla-moda-generativo-ai-occhiali-stile-avatar-moda-animale-domestico-design-elegante-moderno-carattere-avatar-trendy-adolescente-razza-tendenza-concetto-artistico-illustrazione-vettoriale_579956-3458.jpg?w=360" alt="Avatar 1" class="img-thumbnail" style="width: 100px;">
			            </label>
			        </div>
			        <div>
			            <input type="radio" id="avatar2" name="avatar" value="avatar2.png" required>
			            <label for="avatar2">
			                <img src="https://st2.depositphotos.com/2800301/46357/v/450/depositphotos_463575770-stock-illustration-horse-head-horse-portrait-animal.jpg" alt="Avatar 2" class="img-thumbnail" style="width: 100px;">
			            </label>
			        </div>
			    </div>
			</div>

			<button class="btn btn-bd-primary  w-100 py-2 fw-bold text-uppercase" type="submit">Sign in</button>

		</form>
	</main>
	
	<!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>
