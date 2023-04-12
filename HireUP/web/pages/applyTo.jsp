<%-- 
    Document   : applyTo
    Created on : 12 Apr 2023, 01:52:55
    Author     : Pedro Nhamirre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" />
		<link rel="stylesheet" href="../css/apply.css" />
		<link rel="stylesheet" href="../css/navbar.css" />
		<script
			src="https://kit.fontawesome.com/1f168297b1.js"
			crossorigin="anonymous"
		></script>
		<title>Aplicar - para trabalhar</title>
    </head>
    <body>
        <header>
			<div class="navbar">
				<div class="left-nav">
					<a href="../index.html" class="brand"
						><img
							src="../img/logo.png"
							alt="Logo"
							class="logo"
							height="30"
					/></a>
				</div>

				<div class="nav-middle">
					<nav class="nav-menu">
						<a href="../index.html" class="nav-link">Home</a>
						<a href="#" class="nav-link">Empresas</a>
						<a href="../pages/browse.jsp" class="nav-link">Browse</a>
						<a href="#" class="nav-link">Blog</a>
					</nav>
				</div>

				<div>
					<nav class="right-nav">
						<a href="submitJob.html" class="nav-link">Poste um Emprego</a>
						<form action="./login.jsp">
							<button class="btn-primary">Log in</button>
						</form>
					</nav>
				</div>
			</div>
		</header>
		<main>
			<form action="">
				<section class="left-side">
					<div class="icon">
						<div class="image">
							<img src="../img/logo.png" alt="" style="height: 48px" />
						</div>
						<div class="image-title">
							<p> <%= request.getParameter("titulo")%></p>
							
						</div>
					</div>
					<div class="location-info">
						<h1> <%= request.getParameter("posicao")%></h1>
						<div class="location">
							<p>
								<span class="icon-location"
									><i class="fa-solid fa-location-dot"></i
								></span>
								<%= request.getParameter("localizacao")%>
							</p>
							<p>
								<span class="icon-dolar"
									><i class="fa-solid fa-dollar-sign"></i
								></span>
								<%= request.getParameter("salarioMin")%> - <%= request.getParameter("salarioMax")%>
							</p>
						</div>
					</div>
					<div class="datails">
						<div class="qualification">
							<h1>Requisitos mínimos</h1>
							<br />
							<ul>
								<li>
									<%= request.getParameter("requisitos")%>
								</li>
							</ul>
						</div>
						<div class="about-job">
							<h1>Descrićão do emprego</h1>
							<br />
							<p>
								<%= request.getParameter("descricao")%>
							</p>
						</div>
					</div>
					<div class="personal-info">
						<div class="pDetails">
							<h1>1. Detalhe pessoal</h1>
							<p>
								Nós precisamos de algumas informações para que possamos
								entrar em contato com você.
							</p>

							<div class="pDetailsSub">
								<input
									type="text"
									name="firstName"
									required
									placeholder="First Name"
								/>
								<input
									type="text"
									name="lastName"
									required
									placeholder="Last Name"
								/>
								<input
									type="email"
									name="email"
									required
									placeholder="Your Email"
								/>
							</div>
						</div>
						<div class="pProfile">
							<h1>2. Perfil</h1>
							<p>Deixa-nos saber o porquê de querer trabalhar conosco</p>

							<div class="pProfileSub">
								<textarea
									name="1profileArea"
									cols="80"
									rows="12"
									required
									placeholder="Porque você quer trabalhar conosco?"
								></textarea>
								<br />
								<textarea
									name="2profileArea"
									cols="80"
									rows="12"
									required
									placeholder="Porque você é a pessoa certa para a vaga?"
								></textarea>
							</div>
						</div>
						<div class="sProfile">
							<h1>3. Submeter aplicaćão</h1>
							<p>
								A fim de contatá-lo com trabalhos futuros que você pode
								ser interessado, precisamos armazenar seus dados
								pessoais.
							</p>
						</div>
						<div class="inpSubmite">
							<input type="submit" name="inpSubmit" value="Aplicar" />
						</div>
					</div>
				</section>
				<section class="right-side">
					<button>Aplicar</button>
				</section>
			</form>
		</main>
    </body>
</html>
