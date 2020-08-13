<!doctype html>
<%@page import="Enumeration.EtatC"%>
<html class="no-js" lang="en" dir="ltr">
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
    <title>Gestionnaire</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body >

             
              <%String user=(String) session.getAttribute("user"); %>
             <%if(user!=null){ %>
             <%ArrayList<Client> client=(ArrayList<Client>) session.getAttribute("listclient"); %>
              <%ArrayList<Reservation> reservation=(ArrayList<Reservation>) session.getAttribute("listreservation"); %>
              <%double recette=(Double) session.getAttribute("recette"); %>
              
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
                                 <li><a href="#first"><button class="clear button" >Economie</button></a></li>
                                 <li><a href="#second"><button class="clear button" >Gestion</button></a></li>
                             </ul>
                             <li><a href="http://192.168.43.126:8888/ProjetFin/ServletLogout"><button class="clear button" >Logout</button></a></li>
                         </ul>
                    </div>
                 </div>
                 <br>
                 <h2 id="H2-cl">Bonjour <a href="Gestionnaire.jsp" id="H2-cl"><%out.print(user); %></a></h2>
                     <%String ETAT=(String) session.getAttribute("ETAT"); %>
              <% if(ETAT!=null){ %>
                          
                         <div class="callout primary" id="noti" data-closable="slide-out-right">
                             
                             <p><%out.print(ETAT);%></p>
                             <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                              <span aria-hidden="true">&times;</span>
                             </button>
                         </div>    
                             <%} %>  
                 <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>

                     <div class="orbit-wrapper">

                         <div class="orbit-controls">
                            <button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
                            <button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
                         </div>
                         <ul class="orbit-container">
                             <li class="is-active orbit-slide">
                                <figure class="orbit-figure">
                                <img class="orbit-image" src="ATELIER\tech.jpg" alt="Space">
                                <figcaption class="orbit-caption">Gérer les demandes d'inscription <a id="slide-a" data-open="confirmeinsc">Par ici ! </a> </figcaption>
                                </figure>
                                <div class="large reveal" id="confirmeinsc" data-reveal>
                                        <h1 id="inscf">Gérer demandes d'inscription</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="70">Nom</th>
                                     <th width="70">Prenom</th>
                                     <th width="100">Nom d'utilisateur</th>
                                     <th width="150">Adresse</th>
                                     <th width="150">Email</th>
                                     <th width="100">Numero de téléphone</th>
                                     <th width="100">Date de naissance</th>
                                     <th width="100">Num Permis</th>
                                     <th width="100"></th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<client.size();i++){
                                    	 if(client.get(i).getEtat()=="preinscrit"){%>
                                     
                                     <tr>
                                     <td><%out.print(client.get(i).getNom()); %></td>
                                     <td><%out.print(client.get(i).getPrenom()); %></td>
                                     <td><%out.print(client.get(i).getNomUtilisateur()); %></td>
                                     <td><%out.print(client.get(i).getAdresse()); %></td>
                                     <td><%out.print(client.get(i).getEmail()); %></td>
                                     <td>0<%out.print(client.get(i).getNumeroTelephone()); %></td>
                                     <td><%out.print(client.get(i).getDateNaissence()); %></td>
                                     <td><%out.print(client.get(i).getNumeroidentifient()); %></td>
                                     <td>
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="confinsc">
                                     <input type="hidden" name="idclient" value="<%out.print(client.get(i).getNumeroidentifient());%>">
                                     
                                     <button class="button success" type="submit" value="Submit" id="insc" >Confirmer</button></form></td>
                                     <td>
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="anninsc">
                                     <input type="hidden" name="idclient" value="<%out.print(client.get(i).getNumeroidentifient());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Annuler</button></form></td>
                                     </tr>
                                     <%} }%>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     </div>
                             </li>
                             <li class="orbit-slide">
                                <figure class="orbit-figure">
                                  <img class="orbit-image" src="ATELIER\prof.png" alt="Space">
                                  <figcaption class="orbit-caption">Gérer les demandes de réservation <a href="#" id="slide-a" data-open="confirmeres">Par ici ! </a> </figcaption>
                                </figure>
                                <div class="large reveal" id="confirmeres" data-reveal>
                                        <h1 id="inscf">Gérer demandes de réservation</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">client</th>
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
                                     <%for(int i=0;i<reservation.size();i++){
                                     if(reservation.get(i).getEtat()=="NonValide"){%>
                                     <tr>
                                     <td><%out.print(reservation.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="clientdrop<%out.print(i); %>"><%out.print(reservation.get(i).getClient().getNomUtilisateur()); %></a></td>
                                     <td><a class="button" id="inscres"  data-toggle="vehiculedrop<%out.print(i); %>"><%out.print(reservation.get(i).getVehicule().getMatricule()); %></a></td>
                                     <td><%out.print(reservation.get(i).getDateDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getDatefin()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureFin()); %></td>
                                     <td><%out.print(reservation.get(i).getPrix()); %></td>
                                    <td><a class="button success" id="inscres"  data-toggle="contrat<%out.print(i); %>">Confirmer</a></td>
                                    <div class="dropdown-pane top large" id="contrat<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="confres">
                                     <input type="hidden" name="idres" value="<%out.print(reservation.get(i).getIdReservation());%>">
                                     <input type="hidden" name="prix" value="<%out.print(reservation.get(i).getPrix());%>">
                                     <input type="hidden" name="idclient" value="<%out.print(reservation.get(i).getClient().getNumeroidentifient());%>">
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
                                                 
                                     
                                     
                                     </div>
                                     <td><a class="button alert" id="inscres"  data-toggle="annul<%out.print(i); %>">Annuler</a></td>
                                     <div class="dropdown-pane top " id="annul<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="annres">
                                     <input type="hidden" name="idres" value="<%out.print(reservation.get(i).getIdReservation());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Annuler</button></form>
                                     </div>
                                     </tr>
                                     <div class="dropdown-pane large" id="clientdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Nom:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNom()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prenom:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getPrenom()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Naissance:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getDateNaissence()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Id:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroidentifient()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Adresse:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getAdresse()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Email:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getEmail()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Tel</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroTelephone()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="dropdown-pane large" id="vehiculedrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     </div>
                             </li>
      
                         </ul>
                     </div>
                     <nav class="orbit-bullets">
                         <button class="is-active" data-slide="0"><span class="show-for-sr">First slide details.</span><span class="show-for-sr">Current Slide</span></button>
                         <button data-slide="1"><span class="show-for-sr">Second slide details.</span></button>
                        
    
                     </nav>
                 </div>

                 <div class="sections">
                     <section id="first" data-magellan-target="first">
                         <h3 id="info">Economie:</h3>
                         <div class="callout secondary large" id="">
                             <h4 id="H2-ges">Recette:</h4>
                             <p id="recette"><%LocalDate date= LocalDate.now();
         					LocalDate hier=date.minusDays(1);out.print(hier+" : "+recette); 
         					LocalDate dat=LocalDate.of(2018, 03, 03);%> DA</p>
                             <p id="reccal">Calculer la recette:</p>
                             <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post">
                             <input type="hidden" name="type" value="calculer">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                          
                                         <div class="cell small-6">
                                             <label>date:
                                                 <input type="date" name="date" placeholder="date debut" min="<%out.print(dat); %>"  required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         
                                     </div>
                                     </div>
                                     <div class="grid-container">

                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit">Calculer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>

                         </div>
                     </section>
                     <section id="second" data-magellan-target="second">
                         <h3 id="info">Gestion:</h3>
                         <ul class="accordion" id="accord-type" data-accordion data-allow-all-closed="true">
                             <li class="accordion-item is-active" data-accordion-item> 
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype" >Gérer client</a>

    <!-- Accordion tab content: it would start in the open state due to using the `is-active` state class. -->
                                 <div class="accordion-content" data-tab-content>
                                    <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="70">Nom</th>
                                     <th width="70">Prenom</th>
                                     <th width="100">Nom d'utilisateur</th>
                                     <th width="150">Adresse</th>
                                     <th width="150">Email</th>
                                     <th width="100">Numero de téléphone</th>
                                     <th width="100">Date de naissance</th>
                                     <th width="100">Num Permis</th>
                                     <th width="100"></th>
                                     
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<client.size();i++){
                                    	 if(client.get(i).getEtat()=="client"){%>
                                     
                                     <tr>
                                     <td><%out.print(client.get(i).getNom()); %></td>
                                     <td><%out.print(client.get(i).getPrenom()); %></td>
                                     <td><%out.print(client.get(i).getNomUtilisateur()); %></td>
                                     <td><%out.print(client.get(i).getAdresse()); %></td>
                                     <td><%out.print(client.get(i).getEmail()); %></td>
                                     <td>0<%out.print(client.get(i).getNumeroTelephone()); %></td>
                                     <td><%out.print(client.get(i).getDateNaissence()); %></td>
                                     <td><%out.print(client.get(i).getNumeroidentifient()); %></td>
                                     <td><a class="button success" id="inscres"  data-toggle="ConCli<%out.print(i); %>">Consulter</a></td>
                                     
                                     
                                     <td><a class="button secondary" id="inscres"  data-toggle="gesCli<%out.print(i); %>">Notifier</a></td>
                                     </tr>
                                     <div class="dropdown-pane top large" id="gesCli<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="notclient">
                                     <input type="hidden" name="idclient" value="<%out.print(client.get(i).getNumeroidentifient());%>">
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
                                     
                                     <div class="dropdown-pane top " id="ConCli<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post"><input type="hidden" name="type" value="consulterclient">
                                     <input type="hidden" name="idclient" value="<%out.print(client.get(i).getNumeroidentifient());%>">
                                     
                                     <button class="button success" type="submit" value="Submit" id="insc" >Consulter</button></form>
                                     </div>
                                     <%} }%>
                                     </tbody>
                                     </table>
                                 </div>
                             </li>
  <!-- ... -->
                             <li class="accordion-item" data-accordion-item>
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype">Gérer réservation</a>


    <!-- Accordion tab content: it would start in the open state due to using the `is-active` state class. -->
                                 <div class="accordion-content" data-tab-content>
                                       <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">client</th>
                                     <th width="150">vehicule</th>
                                     <th width="100">Contrat</th>
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
                                     <%for(int i=0;i<reservation.size();i++){
                                     if(reservation.get(i).getEtat()=="Valide"){%>
                                     <tr>
                                     <td><%out.print(reservation.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="clientdrop<%out.print(i); %>"><%out.print(reservation.get(i).getClient().getNomUtilisateur()); %></a></td>
                                     <td><a class="button" id="inscres"  data-toggle="vehiculedrop<%out.print(i); %>"><%out.print(reservation.get(i).getVehicule().getMatricule()); %></a></td>
                                     <td><a class="button" id="inscres"  data-toggle="contratdrop<%out.print(i); %>"><%out.print(reservation.get(i).getContrat().getNumeroContrat()); %></a></td>
                                     <td><%out.print(reservation.get(i).getDateDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getDatefin()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureFin()); %></td>
                                     <td><%out.print(reservation.get(i).getPrix()); %></td>
                                    <td><a class="button success" id="inscres"  data-toggle="metfin<%out.print(i); %>" >Mettre fin</a></td>
                                    <div class="dropdown-pane top large" id="metfin<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" target="_blank" ><input type="hidden" name="type" value="finres">
                                     <input type="hidden" name="idres" value="<%out.print(reservation.get(i).getIdReservation());%>">
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
                                     <input type="hidden" name="idres" value="<%out.print(reservation.get(i).getIdReservation());%>">
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
                                     <div class="dropdown-pane top large" id="clientdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Nom:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNom()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prenom:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getPrenom()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Naissance:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getDateNaissence()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Id:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroidentifient()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Adresse:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getAdresse()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Email:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getEmail()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Tel</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroTelephone()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="vehiculedrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="contratdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                             <div class="medium-6 cell">
                                             <p id="infp">paiement :</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getModalites_de_payment()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Prix:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getPrix()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Periode:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getPeriode_de_location()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Numéro contrat:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getNumeroContrat()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Gestionnaire:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getNomUtilisateur()); %></p>
                                             </div>
                                     </div>
                                     </div>
                                     </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                 </div>
                             </li>
                             <li class="accordion-item" data-accordion-item>
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype">Historique de réservation</a>

    <!-- Accordion tab content: it would start in the open state due to using the `is-active` state class. -->
                                 <div class="accordion-content" data-tab-content>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">ID réservation</th>
                                     <th width="150">client</th>
                                     <th width="150">vehicule</th>
                                     <th width="100">Contrat</th>
                                     <th width="150">Date de location</th>
                                     <th width="150">Date fin de location</th>
                                     <th width="100">Heure début</th>
                                     <th width="100">Heure fin</th>
                                     <th width="100">Prix</th>
                                     <th width="50">Imprimer contrat</th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<reservation.size();i++){
                                     if(reservation.get(i).getEtat()=="Historique"){%>
                                     <tr>
                                     <td><%out.print(reservation.get(i).getIdReservation()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="clientdrop<%out.print(i); %>"><%out.print(reservation.get(i).getClient().getNomUtilisateur()); %></a></td>
                                     <td><a class="button" id="inscres"  data-toggle="vehiculedrop<%out.print(i); %>"><%out.print(reservation.get(i).getVehicule().getMatricule()); %></a></td>
                                      <td><a class="button" id="inscres"  data-toggle="contratdrop<%out.print(i); %>"><%out.print(reservation.get(i).getContrat().getNumeroContrat()); %></a></td>
                                     <td><%out.print(reservation.get(i).getDateDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getDatefin()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureDebut()); %></td>
                                     <td><%out.print(reservation.get(i).getHeureFin()); %></td>
                                     <td><%out.print(reservation.get(i).getPrix()); %></td>
                                    <td><a class="button" id="inscres"  data-toggle="imprimedro<%out.print(i); %>">imprimer</a></td>
                                     <div class="dropdown-pane top " id="imprimedro<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaire" method="post" target="_blank"><input type="hidden" name="type" value="imprimecontrat">
                                     <input type="hidden" name="idres" value="<%out.print(reservation.get(i).getIdReservation());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Envoyer</button></form>
                                     </div>
                                     
                                     </tr>
                                     <div class="dropdown-pane top large" id="clientdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Nom:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNom()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prenom:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getPrenom()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Naissance:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getDateNaissence()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Id:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroidentifient()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Adresse:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getAdresse()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Email:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getEmail()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Tel</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getClient().getNumeroTelephone()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="vehiculedrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     
                                     
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getMarque()); %></p>
                                             </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Modele:</p>
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getModele()); %></p> 
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getCategorie()); %></p>
                                             
                                         </div>
                                          
                                         <div class="medium-6 cell">
                                             <p id="infp">Etat:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Depot:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getIddepot()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLH:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_heure()); %></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">PLJ</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getVehicule().getPrix_par_jour()); %></p>
                                             
                                         </div>
                                         </div>
                                         </div>
                                     </div>
                                     <div class="dropdown-pane top large" id="contratdrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                             <div class="medium-6 cell">
                                             <p id="infp">paiement :</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getModalites_de_payment()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Prix:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getPrix()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Periode:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getPeriode_de_location()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Numéro contrat:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getNumeroContrat()); %></p>
                                             </div>
                                             <div class="medium-6 cell">
                                             <p id="infp">Gestionnaire:</p> 
                                             <p id="infp2"><%out.print(reservation.get(i).getContrat().getNomUtilisateur()); %></p>
                                             </div>
                                     </div>
                                     </div>
                                     </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                 </div>
                             </li>
                         </ul>

                     </section>
                 </div>
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