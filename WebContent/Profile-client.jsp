<!doctype html>
<html class="no-js" lang="en" dir="ltr">
<%@ page import ="Model.Client" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.time.LocalDate" %>
 <%@ page import ="Model.Garage" %>
 <%@ page import ="Model.Client" %>
 <%@ page import ="Model.Reservation" %>
 <%@ page import ="Model.Contrat" %>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body >
<%String user=(String)request.getSession().getAttribute("user"); %>
<%if(user!=null){ %>
             <%String ETAT=(String) request.getSession().getAttribute("Etat") ;%>
             <%Client client= (Client) session.getAttribute("Clien");%>
             <%ArrayList<Reservation> reshist=(ArrayList<Reservation>) request.getSession().getAttribute("resclienthist"); %>
             <%ArrayList<Reservation> resdem=(ArrayList<Reservation>) request.getSession().getAttribute("resclientdem"); %>
             <%ArrayList<Reservation> resencour=(ArrayList<Reservation>) request.getSession().getAttribute("resclientcours"); %>
                                                     <!-- top bar-->

                 <div class="title-bar" data-responsive-toggle="example-animated-menu" data-hide-for="medium">
                     <button class="menu-icon" type="button" data-toggle></button>
                     <div class="title-bar-title">Menu</div>
                 </div>

                 <div class="top-bar" id="example-animated-menu" data-sticky data-margin-top="0" >
                     <div><img src="ATELIER\rent-a-car34.png"></div>
                     <div class="top-bar-left">
                         <ul class="dropdown menu" data-dropdown-menu >
                             <li class="menu-text" >Rent Station</li>
                             
                         </ul>
                     </div>
                     <div class="top-bar-right">
                         <ul class="menu">
                            <li><a href="Client-Acc.jsp" ><button class="clear button" id="nu" >Accueil</button></a></li>
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="#first"><button class="clear button" >Réservation</button></a></li>
                                 <li><a href="#second"><button class="clear button" >Notification</button></a></li>
                             </ul>
                             <li><a href="http://192.168.43.126:8888/ProjetFin/ServletLogout"><button class="clear button" >Logout</button></a></li>
                         </ul>
                    </div>
                 </div>
                 <br>
                 <jsp:useBean id="Clien" class="Model.Client" scope="session"> </jsp:useBean>
                 <h2 id="H2-cl">Bonjour<a href="" id="H2-cl"><jsp:getProperty property="nomUtilisateur" name="Clien" /></a></h2>
                 <br>
                           <% if(ETAT!=null){ %>
                          
                         <div class="callout primary" id="noti" data-closable="slide-out-right">
                             
                             <p><%out.print(ETAT);%></p>
                             <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                              <span aria-hidden="true">&times;</span>
                             </button>
                         </div>    
                             <% ETAT=null;} %>                     
                 </div>
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
                                             <p id="infp2"><jsp:getProperty property="nom" name="Clien" /></p>
                                         
                                             <p id="infp">Prenom:</p>
                                             <p id="infp2"><jsp:getProperty property="prenom" name="Clien"   /></p> 
                                         </div>
                                         <div class="medium-3 cell">
                                             <p id="infp">Date de naissance:</p> 
                                             <p id="infp2"><jsp:getProperty property="dateNaissence" name="Clien" /></p>
                                             
                                         </div>
                                          <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Numero de permis de conduire:</p> 
                                             <p id="infp2"><jsp:getProperty property="numeroidentifient" name="Clien" /></p>
                                             
                                         </div>

                                         <div class="medium-6 cell">
                                             <p id="infp">Nom d'utilisateur:</p> 
                                             <p id="infp2"><jsp:getProperty property="nomUtilisateur" name="Clien" /></p>
                                             <a class="button small expanded" id="insc"  data-toggle="dropdown1">Modifier</a>
                                             <div class="dropdown-pane top large" id="dropdown1" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="changeNU">
                                   <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Entrez le nouveau nom:
                                                 <input type="text" name="NomUtilisateur" placeholder="Nom Utilisateur"  required>
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
                                                 <button class="button " type="submit" value="Submit">Changer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button " type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Numero de téléphone:</p> 
                                             <p id="infp2">0<jsp:getProperty property="numeroTelephone" name="Clien" /></p>
                                             <a class="button small expanded" id="insc"  data-toggle="dropdown2">Modifier</a>
                                             <div class="dropdown-pane top large" id="dropdown2" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     
                                     <br></p>
                                    <form data-abide novalidate  action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="changeNum">
                                   <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                      <div class="cell small-6">
                                         	 <label>Numero de télephone:
                                         		 <input type="text" name="numTel" placeholder="numTel"  required pattern="number">
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
                                                 <button class="button " type="submit" value="Submit">Changer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button " type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                         </div>

                                         <div class="medium-6 cell">
                                             <p id="infp">Adresse:</p> 
                                             <p id="infp2"><jsp:getProperty property="adresse" name="Clien" /></p>
                                             <a class="button small expanded" id="insc"  data-toggle="dropdown3">Modifier</a>
                                             <div class="dropdown-pane top large" id="dropdown3" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="changeAdd">
                                   <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                      <div class="cell small-12">
                                         	 <label>Adresse:
                                         		 <input type="text" name="adresse" placeholder="adresse"  required>
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
                                                 <button class="button " type="submit" value="Submit">Changer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button " type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                         </div>
                                         <div class="cell small-6">
                                             <p id="infp">Email:</p> 
                                             <p id="infp2"><jsp:getProperty property="email" name="Clien" /></p>
                                             <a class="button small expanded" id="insc"  data-toggle="dropdown4">Modifier</a>
                                             <div class="dropdown-pane top large" id="dropdown4" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     
                                     <br></p>
                                    <form data-abide novalidate  action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="changeEmail">
                                   <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                      <div class="cell small-12">
                                             <label>Email
                                                 <input type="email" name="email" placeholder="email" required>
                                                 <span class="form-error">
                                                     format invalide
                                                 </span>
                                             </label>
                                             
                                         </div>
                                     </div>
                                     </div>
                                     
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button " type="submit" value="Submit">Changer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button " type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                             
                                         </div>
                                         <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="cell small-6">
                                             <p id="infp">Mot de passe:</p> 
                                             <a class="button small expanded" id="insc"  data-toggle="dropdown5">Modifier</a>
                                             <div class="dropdown-pane top large" id="dropdown5" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     
                                     <br></p>
                                    <form data-abide novalidate  action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="changemdp">
                                   <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     <div class="cell small-12">
                                             <label>Mot de passe
                                                 <input type="password" id="ap"  name="password" placeholder="password" aria-describedby="exampleHelpText" required >
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                             <p class="help-text" id="exampleHelpText">Entrer un mot de passe</p>
                                         </div>
                                         <div class="cell small-12">
                                             <label>Entrer le mot de passe à nouveau
                                                 <input type="password" placeholder="password" aria-describedby="exampleHelpText2" required pattern="alpha_numeric" data-equalto="ap">
                                                 <span class="form-error">
                                                     Les mots de passes doit être identiques !
                                                 </span>
                                             </label>
                                         </div>
                                     </div>
                                     </div>
                                     
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button " type="submit" value="Submit">Changer</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button " type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                         </div>
                                         <div class="medium-3 cell">
                                             
                                         </div>
                                     </div>
                                     </div>
                                     </div>
                                     <br>

                                    <!-- Notification -->
                     <section id="second" data-magellan-target="second">
                     <h3 id="info">Notification:</h3>
                         <div class="callout secondary large" id="noti">
                             <h4 id="H2-cl">Notification</h4>
                             
                             <p><jsp:getProperty property="notification" name="Clien" /></p>
                             <br>
                             <form action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                             <input type="hidden" name="type" value="clearnot">
                             <input type="hidden" name="numI" value="<jsp:getProperty property="numeroidentifient" name="Clien" />">
                             <button class="button " type="submit" value="Submit" id="insc" >Effacer Notification</button></form>
                             
                             
                         </div>    
                     </section>
                     <br>
                     <section id="first" data-magellan-target="first">
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
                                     
                                     <td><a class="button alert" id="inscres"  data-toggle="annul<%out.print(i); %>">Annuler</a></td>
                                     <div class="dropdown-pane top " id="annul<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post"><input type="hidden" name="type" value="annresclient">
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
                                     <th width="50">Imprimer contrat</th>
                                     
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
                                     <td><a class="button" id="inscres"  data-toggle="imprimedrop<%out.print(i); %>">imprimer</a></td>
                                     <div class="dropdown-pane top large" id="imprimedrop<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post"><input type="hidden" name="type" value="imprimecontrat">
                                     <input type="hidden" name="idres" value="<%out.print(resencour.get(i).getIdReservation());%>">
                                     
                                     <button class="button alert" type="submit" value="Submit" id="insc" >Envoyer</button></form>
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
                                     <form action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post" target="_blank"><input type="hidden" name="type" value="imprimecontrat">
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
                     </section>
<%}else{%>
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