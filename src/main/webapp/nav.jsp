<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand d-none d-lg-block" href="index">GAME<span style="color:#652c9b;">IN</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <a class="navbar-brand d-lg-none mb-3" href="index">GAME<span style="color:#652c9b;">IN</span></a>
            <form class="d-flex search-form mt-4 mb-3 mb-lg-0" action="cerca" method="get">
                <input class="form-control search-input" type="search" name="titolo" placeholder="Silent Hill..." aria-label="Search">
                <button class="btn-search" type="submit">cerca</button>
            </form>
        </div>
        
        <% if(session.getAttribute("username") == null) { %>
        <div class="d-flex align-items-center">
           <form action="login" method="post" style="padding-right: 20px">
           <button type="submit"  class="btn btn-bd-primary2 py-2 fw-bold">Login</button>
           </form>
            <img src="${pageContext.request.contextPath}/img/ICONA-UTENTE.png" alt="User" class="account-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="utente">Profilo</a></li>
                
            </ul>
        </div>
        <% } else { %>
        <div class="d-flex align-items-center">
            <a class="me-3 nav-link"><%= session.getAttribute("username") %></a>
            <img src="<%= session.getAttribute("foto") %>" alt="User" class="account-icon dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="utente">Profilo</a></li>
                 <li>
            <form action="logout" method="post" class="m-0">
                <button type="submit" class="dropdown-item">Logout</button>
            </form>
        </li> 
        </div>
        <% } %>
    </div>
</nav>