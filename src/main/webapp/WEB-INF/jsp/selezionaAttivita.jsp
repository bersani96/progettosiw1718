<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/util.css">
	<link rel="stylesheet" type="text/css" href="/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="/css/default.css" >
<link rel="stylesheet" href="/css/extra.css" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seleziona attivita'</title>
</head>
<body>
	<!-- HEADER -->
	<div id="header-wrapper">
		<div id="header" class="container">
			<sec:authorize access="isAuthenticated()"> 
				<div id="logo">
						<h1><a href="#">Benvenuto ${responsabile.email }</a></h1>
					</div>
			</sec:authorize>
			<div id="menu">
			
				<ul>
					<li ><a href="/index">Homepage</a></li>
					<sec:authorize access="isAuthenticated()"> 
						<form action="/logout" method="post" class="logout">
						  <input type="submit" value="LOGOUT" class="logout"/>
						</form>
					</sec:authorize>
					<li><a href="/registrazioneAllievo">Nuovo allievo</a></li>
					<li><a href="/cercaAllievo">Cerca allievo</a></li>
					<li class="active"><a href="/iscriviAllievo">Iscrizione attivita'</a></li>
					<li><a href="/nuovaAttivita">Nuova attivita'</a></li>
					<li><a href="/scegliCentro">Controlla attività</a></li>
				</ul>
			</div>
		</div>
		<div id="banner" class="container">
			<div class="title">
				<h2>SIGECA</h2>
				<span class="byline">Sistema per la Gestione di Centri e Attività</span>
			</div>
		</div>
	</div>
	
	<div id="wrapper">
		<div id="three-column" class="container">
			<div class="title">
				<h2>Iscrizione attività</h2>
				<span class="byline">Seleziona un'attività.</span>
			</div>
			<span class="simple_text">
				E' stato selezionato l'allievo seguente:<br> 
				<strong>${allievoSelezionato.nome } ${allievoSelezionato.cognome }</strong> - Email: ${allievoSelezionato.email } <br><br>
				Posti disponibili per oggi: ${postiDisponibili }<br>
				Seleziona l'attività a cui iscrivere l'allievo:
				<c:if test="${listaAttivita.size() == 0 }">
					<span class="error">Attenzione! Non ci sono attività disponibili per oggi!</span>
				</c:if>
				<br><br>
				<div class="table100 ver3 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Nome</th>
									<th class="cell100 column2">Data</th>
									<th class="cell100 column3">Orario</th>
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach var="a" items="${listaAttivita}" >
									<tr class="row100 body">
										<td class="cell100 column1"><a href="iscrivi/${a.id}">${a.nome}</a></td>
										<td class="cell100 column2">${a.data }</td>
										<td class="cell100 column3">${a.orario }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</span>
		</div>
	</div>
	
	<!-- FOOTER -->
	<div id="copyright" class="container">
		<p>Sito realizzato come progetto per Sistemi informativi sul web 2017/2018 - Davide Bersani e Andrea Apicella</p>
	</div>
	
	</body>
</html>