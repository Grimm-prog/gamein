    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand d-none d-lg-block" href="index">GAME<span style="color:#652c9b;">IN</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <!-- Contenuto della navbar -->
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <!-- searchbar -->
                <form class="d-flex search-form mt-4 mb-3 mb-lg-0" action="cerca" method="get"> <!-- aggiunti action e method -->
                    <input class="form-control search-input" type="search" name="titolo" placeholder="Silent Hill..." aria-label="Search">
                    <button class="btn-search" type="submit">cerca</button>
                </form>
            </div>
            
            <!-- il mio account e immagine utente -->
            <div class="d-flex align-items-center">
                <a href="#" class="me-3 nav-link">My Account</a>
                <!-- immagine dell'utente-->
                <img src="https://lh3.googleusercontent.com/BbWEstIBHVTP0Tna_AdcGTx_Rm1g9TDDNHAhETnZ8za0YCruvGw6ihuHlqL0BCOqJkq-rWoufanOwRJxm7op_H2q=s1280-w1280-h800" alt="User" class="account-icon">
            </div>
        </div>
    </nav>