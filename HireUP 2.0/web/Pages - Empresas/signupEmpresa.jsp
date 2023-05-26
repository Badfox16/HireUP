<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="./css/header.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./css/SignUp.css">
	<link rel="shortcut icon" href="../img/logo.png" type="image/x-icon" class="hr1" />
	<title>Sign Up</title>
</head>

<body>
	<div class="navbar">
		<div class="left-nav">
			<a href="#" class="brand"><img src="./img/recursos-humanos.png" alt="Logo" class="logo" height="30"></a>
		</div>
		<div class="nav-middle">
			<nav class="nav-menu">
				<a href="../index.jsp" class="nav-link">Home</a>
				<a href="/candidaturas.jsp" class="nav-link">Candidaturas</a>
				<a href="./empregos.jsp" class="nav-link">Empregos</a>
				<a href="./criarvagas.jsp" class="nav-link">Criar vagas</a>
			</nav>
		</div>
		<div>
			<nav class="right-nav">
				<a href="../pages/searchResults.jsp" class="nav-link">Procure um Emprego</a>
				<form action="./loginRemake.jsp" method="get">
					<button class="btn-primary">Log in</button>
				</form>
			</nav>
		</div>
	</div>
	<div class="content">
		<div class="left">
			<div class="form-block">
				<div class="form-title">
					<h3>HireUP</h3>
					<p>Registre a sua empresa e comece a postar a empregos </p>
				</div>
				<form action="signupBeans.jsp" accept-charset="UTF-8" method="post">
					<input type="text" name="nome" maxlength="120" placeholder="Nome da Empresa*" required
						class="form-field w-input">

					<select name="tipo" class="form-field w-input">
						<option value="" disabled selected>Selecione o Tipo de Empresa</option>
						<option value="Empresa - Publica">Empresa - Publica</option>
						<option value="Empresa - Privada">Empresa - Privada</option>
						<option value="Sem Fins Lucrativos">Sem Fins Lucrativos</option>
						<option value="Governo">Governo</option>
						<option value="Subsidiaria">Subsidiaria</option>
						<option value="Firma">Firma</option>
						<option value="Contratual">Contratual</option>
						<option value="Outro">Outro</option>
					</select>

					<select name="setor" class="form-field w-input">
						<option value="" disabled selected>Selecione o Sector</option>
						<option value="Tecnologias de Informacao">Tecnologias de Informação</option>
						<option value="Marketing">Marketing</option>
						<option value="Telecomunicao">Telecomunição</option>
						<option value="Administracao">Administração</option>
						<option value="Construcao">Construção</option>
						<option value="Saude">Saúde</option>
						<option value="Industrial">Industrial</option>
						<option value="Multimedia">Multimedia</option>
						<option value="Seguranca">Segurança</option>
						<option value="Outro">Outro</option>
					</select>

					<input type="email" name="email" maxlength="100" placeholder="E-mail *" required
						class="form-field w-input">

					<input type="password" name="senha" id="senha" maxlength="20" class="form-field w-input"
						placeholder="Senha *" required>

					<textarea name="descricao" placeholder="Descrição*" id="text" cols="50" rows="9"></textarea>

					<input type="text" name="localizacao" maxlength="100" placeholder="Localização *" required
						class="form-field w-input">
					<br><br>
					<input type="submit" value="Crie uma Conta" data-wait="Por favor aguarde..."
						class="btn-primary w-button">
				</form>
				<div class="form-footer">
					<span class="text">Já tem uma conta?</span>
					<a href="./login_empresa.jsp">Faça o Login</a>
				</div>
			</div>
		</div>

		<div class="right">
			<div class="content-block">
				<h1>Registre-se como empregador.</h1>
				<div class="quote">
					<h2>Teoria e Prática do Comércio</h2>
					<blockquote><q>Não é o trabalho, mas o saber trabalhar, que é o segredo do êxito no trabalho. Saber
							trabalhar quer dizer: não fazer um esforço inútil, persistir no esforço até ao fim, e saber
							reconstruir uma orientação quando se verificou que ela era, ou se tornou, errada.</q>
					</blockquote>
				</div>
			</div>
		</div>
	</div>

</body>

</html>