<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import ="Model.Vehicule" %>
 <%@ page import ="java.util.ArrayList" %>
 <%@ page import ="java.time.LocalDate" %>
 <%@ page import ="Model.Garage" %>
 <%@ page import ="Model.Client" %>
 <%@ page import ="Model.Reservation" %>
<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulter Client</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
                             <%String user=(String) session.getAttribute("user"); %>
                             <%if(user!=null){ %>
                             <%ArrayList<Reservation> res=(ArrayList<Reservation>) request.getSession().getAttribute("resclient"); %>
                             <%ArrayList<Reservation> reshist=(ArrayList<Reservation>) request.getSession().getAttribute("resclienthist"); %>
                             <%ArrayList<Reservation> resdem=(ArrayList<Reservation>) request.getSession().getAttribute("resclientdem"); %>
                             <%ArrayList<Reservation> resencour=(ArrayList<Reservation>) request.getSession().getAttribute("resclientcours"); %>
                             <%Client c=(Client) request.getSession().getAttribute("client"); %>
                             <jsp:useBean id="client" class="Model.Client" scope="session"> </jsp:useBean>
                 <div class="title-bar" data-responsive-toggle="example-animated-menu" data-hide-for="medium">
                     <button class="menu-icon" type="button" data-toggle></button>
                     <div class="title-bar-title">Menu</div>
                 </div>

                 <div class="top-bar" id="example-animated-menu" data-sticky data-margin-top="0" >
                     <div><a href="Gestionnaire.jsp"><img src="ATELIER\rent-a-car34.png"></a></div>
                     <div class="top-bar-left">
                         <ul class="dropdown menu" data-dropdown-menu >
                             <li class="menu-text" >Rent Station</li>
                             
                         </ul>
                     </div>
                     <div class="top-bar-right">
                         <ul class="menu">
                            
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="Gestionnaire.jsp"><button class="clear button" >Gestionnaire</button></a></li>
                                 
                             </ul>
                             <li><a href="http://192.168.43.126:8888/ProjetFin/ServletLogout"><button class="clear button" >Logout</button></a></li>
                         </ul>
                    </div>
                 </div>
                 <br>
                 <h2 id="H2-cl">Salut <a href="gestionnaire.jsp" id="H2-cl"><%out.print(user); %></a></h2>
                 <h3 id="info">Carte Client:</h3>
                 <div id="info0">
                 <br>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     <div class="medium-2 cell">
                                             
                                         </div>
                                     <div class="medium-4 cell">
                                             <img  src="ATELIER\man.png" ">
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Nom:</p> 
                                             <p id="infp2"><jsp:getProperty property="nom" name="client" /></p>
                                         
                                             <p id="infp">Prenom:</p>
                                             <p id="infp2"><jsp:getProperty property="prenom" name="client"   /></p> 
                                         </div>
                                         <div class="medium-3 cell">
                                             <p id="infp">Date de naissance:</p> 
                                             <p id="infp2"><jsp:getProperty property="dateNaissence" name="client" /></p>
                                             
                                         </div>
                                          <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Numero Identifient:</p> 
                                             <p id="infp2"><jsp:getProperty property="numeroidentifient" name="client" /></p>
                                             
                                         </div>

                                         <div class="medium-6 cell">
                                             <p id="infp">Nom d'utilisateur:</p> 
                                             <p id="infp2"><jsp:getProperty property="nomUtilisateur" name="client" /></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Numero de téléphone:</p> 
                                             <p id="infp2">0<jsp:getProperty property="numeroTelephone" name="client" /></p>
                                             
                                         </div>

                                         <div class="medium-6 cell">
                                             <p id="infp">Adresse:</p> 
                                             <p id="infp2"><jsp:getProperty property="adresse" name="client" /></p>
                                             
                                         </div>
                                         <div class="cell small-6">
                                             <p id="infp">Email:</p> 
                                             <p id="infp2"><jsp:getProperty property="email" name="client" /></p>
                                             
                                             
                                         </div>
                                         <%if(resencour.isEmpty()==true){ %>
                                         <div class="medium-6 cell">
                                         
                                             <a class="button alert expanded" id="inscres"  data-toggle="Cli">Bloquer</a><%}else{ %>
                                             <a class="button alert expanded" id="inscres"   disabled>Bloquer</a>
                                             <%} %>
                                         </div>
                                         
                                         
                                         <div class="medium-6 cell">
                                             <a class="button secondary expanded" id="inscres"  data-toggle="gesCli">Notifier</a>
                                         </div>
                                         <div class="dropdown-pane top large" id="gesCli" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="notclient">
                                     <input type="hidden" name="idclient" value="<jsp:getProperty property="numeroidentifient" name="client" />">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-12 cell">
                                          <label>Notification:
                                         		 <input type="text" name="notification" placeholder="notification"  required>
                                         		 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>

                                         	 </label>
                                         </div>
                                     </div></div>
                                     <button class="button secondary" type="submit" value="Submit" id="insc" >Notifier</button></form>
                                     </div>
                                     <div class="dropdown-pane top " id="Cli" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" ><input type="hidden" name="type" value="blocclient">
                                     <input type="hidden" name="idclient" value="<jsp:getProperty property="numeroidentifient" name="client" />">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Confirmer</button></form>
                                     </div>
                                     </div>
                                     </div>
                                     </div>
                                     <br>
                                     <h3 id="info">Reservation en cours:</h3>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">vehicule</th>
                                    <th width="150">Contrat</th>
                                     <th width="150">Date de location</th>
                                     <th width="150">Date fin de location</th>
                                     <th width="100">Heure début</th>
                                     <th width="100">Heure fin</th>
                                     <th width="100">Prix</th>
                                     <th width="50"></th>
                                     <th width="50"></th>
                                     
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<resencour.size();i++){
                                     if(resencour.get(i).getEtat()=="Valide"){%>
                                     <tr>
                                     <td><%out.print(resencour.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="cour<%out.print(i); %>"><%out.print(resencour.get(i).getVehicule().getMatricule()); %></a></td>
                                     <td><a class="button" id="inscres"  data-toggle="courcontratdrop<%out.print(i); %>"><%out.print(resencour.get(i).getContrat().getNumeroContrat()); %></a></td>
                                     <td><%out.print(resencour.get(i).getDateDebut()); %></td>
                                     <td><%out.print(resencour.get(i).getDatefin()); %></td>
                                     <td><%out.print(resencour.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(resencour.get(i).getHeureFin()); %></td>
                                     <td><%out.print(resencour.get(i).getPrix()); %></td>
                                     <td><a class="button success" id="inscres"  data-toggle="metfin<%out.print(i); %> " >Mettre fin</a></td>
                                    <div class="dropdown-pane top large" id="metfin<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" target="_blank"><input type="hidden" name="type" value="finres">
                                     <input type="hidden" name="idres" value="<%out.print(resencour.get(i).getIdReservation());%>">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-12 cell">
                                          <label>Etat: 
                                                     <select id="select" name="modep" required>
                                                         <option value="CHEQUE" >CHEQUE</option>
                                                         <option value="ESPECE" >ESPECE</option>
                                                         
                                                     </select>
                                                 </label> 
                                         </div>
                                     </div></div>
                                     <button class="button success" type="submit" value="Submit" id="insc" onClick="window.location.reload()" >Mettre fin</button></form>
                                     </div>
                                     <td><a class="button success" id="inscres"  data-toggle="pefin<%out.print(i); %>">Pénalités</a></td>
                                     <div class="dropdown-pane top large" id="pefin<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" target="_blank"><input type="hidden" name="type" value="penaliteres">
                                     <input type="hidden" name="idres" value="<%out.print(resencour.get(i).getIdReservation());%>">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     <div class="cell small-6">
                                                 <label>Charges: 
                                                     <select id="select" name="charge" required>
                                                         <option value="100" >Heure</option>
                                                         <option value="500" >Jour</option>
                                                         
                                                     </select>
                                                 </label> 
                                                 </div>
                                     <div class="cell small-4">
                                                 <label id="insc" >Periode
                                                 <input type="number" placeholder="1234" min="1" name="periode" aria-describedby="exampleHelpText" required >
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
                                                 </div>
                                         <div class="medium-4 cell">
                                          <label>mode: 
                                                     <select id="select" name="modep" required>
                                                         <option value="CHEQUE" >CHEQUE</option>
                                                         <option value="ESPECE" >ESPECE</option>
                                                         
                                                     </select>
                                                 </label> 
                                         </div>
                                     </div></div>
                                     <button class="button success" type="submit" value="Submit" id="insc" >Mettre fin</button></form>
                                     </div>
                                     
                                     </tr>
                                     <div class="dropdown-pane top large" id="courcontratdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                             <div class="medium-6 cell">
                                             <p id="infp">paiement :</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getContrat().getModalites_de_payment()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Prix:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getContrat().getPrix()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Periode:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getContrat().getPeriode_de_location()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Numéro contrat:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getContrat().getNumeroContrat()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Gestionnaire:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getContrat().getNomUtilisateur()); %></p>
                                             </div>
                                     </div>
                                     </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="cour<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(resencour.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <br>
                                     <h3 id="info">Demandes de Reservation:</h3>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">vehicule</th>
                                     <th width="150">Date de location</th>
                                     <th width="150">Date fin de location</th>
                                     <th width="100">Heure début</th>
                                     <th width="100">Heure fin</th>
                                     <th width="100">Prix</th>
                                     <th width="50"></th>
                                     <th width="50"></th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<resdem.size();i++){
                                     if(resdem.get(i).getEtat()=="NonValide"){%>
                                     <tr>
                                     <td><%out.print(resdem.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="dem<%out.print(i); %>"><%out.print(resdem.get(i).getVehicule().getMatricule()); %></a></td>
                                     <td><%out.print(resdem.get(i).getDateDebut()); %></td>
                                     <td><%out.print(resdem.get(i).getDatefin()); %></td>
                                     <td><%out.print(resdem.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(resdem.get(i).getHeureFin()); %></td>
                                     <td><%out.print(resdem.get(i).getPrix()); %></td>
                                     <td><a class="button success" id="inscres"  data-toggle="contrat<%out.print(i); %>">Confirmer</a></td>
                                    <div class="dropdown-pane top large" id="contrat<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="confres">
                                     <input type="hidden" name="idres" value="<%out.print(resdem.get(i).getIdReservation());%>">
                                     <input type="hidden" name="prix" value="<%out.print(resdem.get(i).getPrix());%>">
                                     <input type="hidden" name="idclient" value="<%out.print(resdem.get(i).getClient().getNumeroidentifient());%>">
                                                <div class="grid-container">
                                                <div class="grid-x grid-margin-x">
                                                <div class="cell small-6">
                                                 <label id="insc" >Periode
                                                 <input type="number" placeholder="1234" min="1" name="periode" aria-describedby="exampleHelpText" required >
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-6">
                                                  <button class="button success" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </div>
                                                </div>
                                                </div>
                                                </form>
                                                </div>
                                     <td><a class="button alert" id="inscres"  data-toggle="annul<%out.print(i); %>">Annuler</a></td>
                                     <div class="dropdown-pane top " id="annul<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="annres">
                                     <input type="hidden" name="idres" value="<%out.print(resdem.get(i).getIdReservation());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Annuler</button></form>
                                     </div>
                                     </tr>
                                     <div class="dropdown-pane top large" id="dem<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(resdem.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <br>
                                     <h3 id="info">Historique de réservation:</h3>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">vehicule</th>
                                     <th width="150">Contrat</th>
                                     <th width="150">Date de location</th>
                                     <th width="150">Date fin de location</th>
                                     <th width="100">Heure début</th>
                                     <th width="100">Heure fin</th>
                                     <th width="100">Prix</th>
                                     <th width="50">Imprimer contrat</th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<reshist.size();i++){
                                     %>
                                     <tr>
                                     <td><%out.print(reshist.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="his<%out.print(i); %>"><%out.print(reshist.get(i).getVehicule().getMatricule()); %></a></td>
                                      <td><a class="button" id="inscres"  data-toggle="contratdrop<%out.print(i); %>"><%out.print(reshist.get(i).getContrat().getNumeroContrat()); %></a></td>
                                     <td><%out.print(reshist.get(i).getDateDebut()); %></td>
                                     <td><%out.print(reshist.get(i).getDatefin()); %></td>
                                     <td><%out.print(reshist.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(reshist.get(i).getHeureFin()); %></td>
                                     <td><%out.print(reshist.get(i).getPrix()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="imprimedro<%out.print(i); %>">imprimer</a></td>
                                     <div class="dropdown-pane top large" id="imprimedro<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" target="_blank"><input type="hidden" name="type" value="imprimecontrat">
                                     <input type="hidden" name="idres" value="<%out.print(reshist.get(i).getIdReservation());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Envoyer</button></form>
                                     </div>
                                     </tr>
                                      <div class="dropdown-pane top large" id="contratdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                             <div class="medium-6 cell">
                                             <p id="infp">paiement :</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getContrat().getModalites_de_payment()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Prix:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getContrat().getPrix()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Periode:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getContrat().getPeriode_de_location()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Numéro contrat:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getContrat().getNumeroContrat()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Gestionnaire:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getContrat().getNomUtilisateur()); %></p>
                                             </div>
                                     </div>
                                     </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="his<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(reshist.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <%}%>
                                     </tbody>
                                     </table>
                                     <br>
                                     
                                     <%}else{ %>
                                     <div class="title-bar" data-responsive-toggle="example-animated-menu" data-hide-for="medium">
                     <button class="menu-icon" type="button" data-toggle></button>
                     <div class="title-bar-title">Menu</div>
                 </div>

                 <div class="top-bar" id="example-animated-menu" data-sticky data-margin-top="0" >
                     <div><a href="Accueil.html"><img src="ATELIER\rent-a-car34.png"></a></div>
                     <div class="top-bar-left">
                         <ul class="dropdown menu" data-dropdown-menu >
                             <li class="menu-text" >Rent Station</li>
                             
                         </ul>
                     </div>
                     <div class="top-bar-right">
                         <ul class="menu">
                            
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="Accueil.html">Accueil</a></li>
                                 
                             </ul>
                             
                         </ul>
                    </div>
                 </div>
                 <br>
                 <div class="callout primary" id="noti" >
                             
                             <p>Veuillez <a href="Accueil.html">s'authentifier </a> pour pouvoir accéder au platforme ! </p>
                             
                         </div>
                                     <%} %>


<script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>   
</body>
</html>