<!doctype html>
<html class="no-js" lang="en" dir="ltr">

 <%@ page import ="Model.Vehicule" %>
 <%@ page import ="java.util.ArrayList" %>
 <%@ page import ="java.time.LocalDate" %>
 <%@ page import ="Model.Client" %>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body >
<% String nom=(String) request.getSession().getAttribute("user");%> 
<%if(nom!=null){ %>
               <%ArrayList<Vehicule> voiture=(ArrayList<Vehicule>) session.getAttribute("listvoiture"); %>
               <%ArrayList<Vehicule> moto=(ArrayList<Vehicule>) session.getAttribute("listmoto"); %>
               <%ArrayList<Vehicule> bus=(ArrayList<Vehicule>) session.getAttribute("listbus"); %>
               <%ArrayList<String> marquevoiture=(ArrayList<String>) session.getAttribute("listmarquevoiture"); %>
               <%ArrayList<String> marquebus=(ArrayList<String>) session.getAttribute("listmarquebus"); %>
               <%ArrayList<String> marquemoto=(ArrayList<String>) session.getAttribute("listmarquemoto"); %>
               <%String ETAT=(String) request.getSession().getAttribute("Etat") ;%>
               
               <jsp:useBean id="Clien" class="Model.Client" scope="session"></jsp:useBean>
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
                            <li><a href="Profile-client.jsp" ><button class="clear button" id="nu" >Profile</button></a></li>
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="#first"><button class="clear button" >Offres</button></a></li>
                                 <li><a href="#second"><button class="clear button" >Notification</button></a></li>
                             </ul>
                             <li><a href="http://192.168.43.126:8888/ProjetFin/ServletLogout"><button class="clear button" >Logout</button></a></li>
                         </ul>
                    </div>
                 </div>
                 <br>
                 <%Client client= (Client) session.getAttribute("Clien"); %>
                 <h2 id="H2-cl">Salut <a href="Profile-client.jsp" id="H2-cl"><%out.print(client.getNomUtilisateur()); %></a></h2>
                 <p id="H2-c">On vous souhaite une bonne navigation sur notre site !  </p>
                 <% if(ETAT!=null){ %>
                          
                         <div class="callout primary" id="noti" data-closable="slide-out-right">
                             
                             <p><%out.print(ETAT);%></p>
                             <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                              <span aria-hidden="true">&times;</span>
                             </button>
                         </div>    
                             <% ETAT=null;} %>                     
                 </div>

                                                     <!-- orbit -->

                 <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit>

                     <div class="orbit-wrapper">

                         <div class="orbit-controls">
                            <button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
                            <button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
                         </div>
                         <ul class="orbit-container">
                             <li class="is-active orbit-slide">
                                <figure class="orbit-figure">
                                <img class="orbit-image" src="ATELIER\recher.png" alt="Space">
                                <figcaption class="orbit-caption">Pour une navigation facile et rapide notre site vous permet de rechercher le véhicule que vous désirez </figcaption>
                                </figure>
                             </li>
                             <li class="orbit-slide">
                                <figure class="orbit-figure">
                                  <img class="orbit-image" src="ATELIER\motocar.jpg" alt="Space">
                                  <figcaption class="orbit-caption">Voiture? Bus? ou encore une moto? nous avons tout ce qu'il vous faut ! <a href="#Third" id="slide-a">Trouver le meilleur véhicule pour vous</a> </figcaption>
                                </figure>
                             </li>
                             <li class="orbit-slide">
                                <figure class="orbit-figure">
                                  <img class="orbit-image" src="ATELIER\prof.png" alt="Space">
                                  <figcaption class="orbit-caption">Consulter, modifier votre profile et gérer vos réservations dans un seul endroit ! <a href="Profile-client.jsp" id="slide-a">Par ici !</a></figcaption>
                                </figure>
                             </li>
      
                         </ul>
                     </div>
                     <nav class="orbit-bullets">
                         <button class="is-active" data-slide="0"><span class="show-for-sr">First slide details.</span><span class="show-for-sr">Current Slide</span></button>
                         <button data-slide="1"><span class="show-for-sr">Second slide details.</span></button>
                         <button data-slide="2"><span class="show-for-sr">Third slide details.</span></button>
    
                     </nav>
                 </div>
                 <a class="button  expanded secondary" id="insc" href="#Third" >Réserver un véhicule</a>
                 
                                                   <!-- orbit end -->
                

                                                   <!--recherche-->

                 <div class="sections">

                     <section id="Third" data-magellan-target="Third">
                     <h2 id="H2-acc">Véhicules</h2>
                          <p id="H2-acc">Portes ouvertes sur nos garages, consulter tous les véhicules dans un seul endroit ! </p>
                         <ul class="tabs" data-responsive-accordion-tabs="tabs medium-accordion large-tabs" id="example-tabs">
                             <li class="tabs-title is-active"><a href="#panel1" aria-selected="true" id="select">Voiture</a></li>
                             <li class="tabs-title"><a href="#panel2" id="select">Bus</a></li>
                             <li class="tabs-title"><a href="#panel3" id="select">Moto</a></li>
                         </ul>

                         <div class="tabs-content" data-tabs-content="example-tabs">
                             <div class="tabs-panel is-active" id="panel1">
                             <h4 id="H2-acc">Recherche:</h4>
                             <div class="stacked-for-small button-group" id="select">
                                 <a class="button" data-open="Modal3">Citadine</a>
                                     <div class="large reveal" id="Modal3" data-reveal>
                                        <h1 id="inscf">Voiture citadine </h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<voiture.size();i++){ 
                                    if(voiture.get(i).getCategorie()=="VoitureCitadine" && voiture.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(voiture.get(i).getMarque()); %></td>
                                     <td><% out.print(voiture.get(i).getModele()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(voiture.get(i).getMatricule()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="example-dropdown<%out.print(i); %>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande ! 
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverV"><input type="hidden" name="matriculev" value="<%out.print(voiture.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                      
                                     </div>
                                 <a class="button" data-open="Modal4">Utilitaire</a>
                                    <div class="large reveal" id="Modal4" data-reveal>
                                        <h1 id="inscf">Voiture utilitaire </h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<voiture.size();i++){ 
                                    if(voiture.get(i).getCategorie()=="VoitureProfessionnel" && voiture.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(voiture.get(i).getMarque()); %></td>
                                     <td><% out.print(voiture.get(i).getModele()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(voiture.get(i).getMatricule()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="example-dropdown<%out.print(i); %>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown<%out.print(i); %>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande !
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverV"><input type="hidden" name="matriculev" value="<%out.print(voiture.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                      
                                     </div>
                                 <a class="button" data-open="Modal<%{int s=5;out.print(s);%>">Voiture de luxe</a>
                                     <div class="large reveal" id="Modal<%out.print(s);}%>" data-reveal>
                                        <h1 id="inscf">Voiture de luxe </h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%for(int i=0;i<voiture.size();i++){ 
                                    if(voiture.get(i).getCategorie()=="VoitureLuxe" && voiture.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(voiture.get(i).getMarque()); %></td>
                                     <td><% out.print(voiture.get(i).getModele()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(voiture.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(voiture.get(i).getMatricule()); %></td>
                                     <td><a class="button" id="inscres"  data-toggle="example-dropdown<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande !
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverV"><input type="hidden" name="matriculev" value="<%out.print(voiture.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                      
                                     </div>
                             </div>
                             <h4 id="H2-acc">Recherche avancée:</h4>
                             <p id="H2-acc">C'est à vous de choisir !</p>
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                 <input type="hidden" name="type" value="RechercheAvanceeVoiture"> 
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                                 <label>Marque: 
                                                     <select id="select" name="marque">
                                                         <option value="tous">toutes</option>
                                                         <%for(int i=0;i<marquevoiture.size();i++){ %>
                                                         <option value="<%out.print(marquevoiture.get(i)); %>" ><% out.print(marquevoiture.get(i));%></option>
                                                         <%} %>
                                                         
                                                     </select>
                                                 </label>
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie">
                                                         <option value="tous"></option>
                                                         <option value="citadine">Citadine</option>
                                                         <option value="professionel" >Utilitaire</option>
                                                         <option value="luxe" >Voiture de luxe</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Etat: 
                                                     <select id="select"  name="etat">
                                                         
                                                         <option value="libre">libre</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour maximum:
                                                     <input type="number" placeholder="3000" name="plj" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure maximum:
                                                     <input type="number" placeholder="200" name="plh" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                         </div>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit">Rechercher</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                             </div>
                             
                             <!-- BUS -->
                             
                             <div class="tabs-panel" id="panel2">
                             <h4 id="H2-acc">Recherche:</h4>
                             <div class="stacked-for-small alert button-group" id="select">
                                 <a class="button" data-open="Modal6">Minibus</a>
                                 <div class="large reveal" id="Modal6" data-reveal>
                                        <h1 id="inscf">Minibus</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele(Sièges)</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     
                                     <%for(int i=0;i<bus.size();i++){ 
                                    if(bus.get(i).getCategorie()=="MiniBus" && bus.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(bus.get(i).getMarque()); %></td>
                                     <td><% out.print(bus.get(i).getModele()+"("+bus.get(i).getPlace()+")"); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(bus.get(i).getMatricule()); %></td>
                                     <td><a class="button alert" id="inscres"  data-toggle="example-dropdown100<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown100<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande !
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverB"><input type="hidden" name="matriculev" value="<%out.print(bus.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button alert" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button alert" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     
                                     </div>
                                 <a class="button" data-open="Modal7">Comfort</a>
                                     <div class="large reveal" id="Modal7" data-reveal>
                                        <h1 id="inscf">Comfort</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele(Sièges)</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     
                                     <%for(int i=0;i<bus.size();i++){ 
                                    if(bus.get(i).getCategorie()=="Confort" && bus.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(bus.get(i).getMarque()); %></td>
                                     <td><% out.print(bus.get(i).getModele()+"("+bus.get(i).getPlace()+")"); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(bus.get(i).getMatricule()); %></td>
                                     <td><a class="button alert" id="inscres" data-toggle="example-dropdown100<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown100<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande !                                      <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverB"><input type="hidden" name="matriculev" value="<%out.print(bus.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button alert" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button alert" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                    
                                     </div>
                                 <a class="button" data-open="Modal8">Semi-comfort</a>
                                     <div class="large reveal" id="Modal8" data-reveal>
                                        <h1 id="inscf">Semi-confort</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele(Sièges)</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     
                                     <%for(int i=0;i<bus.size();i++){ 
                                    if(bus.get(i).getCategorie()=="SemiConfort" && bus.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(bus.get(i).getMarque()); %></td>
                                     <td><% out.print(bus.get(i).getModele()+"("+bus.get(i).getPlace()+")"); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(bus.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(bus.get(i).getMatricule()); %></td>
                                    <td><a class="button alert" id="inscres"  data-toggle="example-dropdown100<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown100<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande ! 
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverB"><input type="hidden" name="matriculev" value="<%out.print(bus.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button alert" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button alert" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     
                                     </div>
                             </div>
                             <h4 id="H2-acc">Recherche avancée:</h4>
                             <p id="H2-acc">C'est à vous de choisir !</p>
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServeletClient"  method="post">
                                 <input type="hidden" name="type" value="rechercheAvanceeBus">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                                 <label>Marque: 
                                                     <select id="select" name="marque">
                                                         <option value="tous" name="tousmarque"></option>
                                                         <%for(int i=0;i<marquebus.size();i++){ %>
                                                         <option value="<%out.print(marquebus.get(i)); %>" ><% out.print(marquebus.get(i));%></option>
                                                         <%} %>
                                                         
                                                     </select>
                                                 </label>
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie">
                                                          <option value="tous"></option>
                                                         <option value="miniBus" >MiniBus</option>
                                                         <option value="confort" >Comfort</option>
                                                         <option value="semiConfort">Semi-Comfort</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Etat: 
                                                     <select id="select" name="categorie" >
                                                         
                                                         <option value="libre">libre</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>
                                                     Nombre de sièges :
                                                     <input type="number" placeholder="20" name="place">
                                                 </label>
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour maximum:
                                                     <input type="number" placeholder="3000" name="plj" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure maximum:
                                                     <input type="number" placeholder="200" name="plh" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                         </div>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button alert" type="submit" value="Submit">Rechercher</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button alert" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                             </div>
                             
                             <!-- MOTO -->
                             
                             <div class="tabs-panel" id="panel3">
                             <h4 id="H2-acc">Recherche:</h4>
                             <div class="stacked-for-small warning button-group" id="select">
                                 <a class="button" data-open="Modal9">Sport</a>
                                 <div class="large reveal" id="Modal9" data-reveal>
                                        <h1 id="inscf">Sport</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <tr>
                                     
                                     </tr>
                                     <%for(int i=0;i<moto.size();i++){ 
                                    if(moto.get(i).getCategorie()=="Sport" && moto.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(moto.get(i).getMarque()); %></td>
                                     <td><% out.print(moto.get(i).getModele()); %></td>
                                     <td><% out.print(moto.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(moto.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(moto.get(i).getMatricule()); %></td>
                                      <td><a class="button warning" id="inscres"  data-toggle="example-dropdown1000<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown1000<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande ! 
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverM"><input type="hidden" name="matriculev" value="<%out.print(moto.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button warning" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button warning" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     
                                     </div>
                                 <a class="button" data-open="Modal10">Urbain</a>
                                      <div class="large reveal" id="Modal10" data-reveal>
                                        <h1 id="inscf">Urbain</h1>

                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="200">Matricule(num-année-ville)</th>
                                     <th width="100"></th>
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <tr>
                                     
                                     </tr>
                                     <%for(int i=0;i<moto.size();i++){ 
                                    if(moto.get(i).getCategorie()=="Urbain" && moto.get(i).getEtatv()=="libre"){%>
                                     
                                     <tr>
                                     <td><% out.print(moto.get(i).getMarque()); %></td>
                                     <td><% out.print(moto.get(i).getModele()); %></td>
                                     <td><% out.print(moto.get(i).getPrix_par_jour()); %></td>
                                     <td><% out.print(moto.get(i).getPrix_par_heure()); %></td>
                                     <td><% out.print(moto.get(i).getMatricule()); %></td>
                                     <td><a class="button warning" id="inscres" data-toggle="example-dropdown1000<%out.print(i);%>">Réserver</a></td>
                                     </tr>
                                     <div class="dropdown-pane large" id="example-dropdown1000<%out.print(i);%>" data-dropdown data-auto-focus="true">
                                    <p id="H2-c"> Veuillez remplir ce formulaire !
                                     <br>Ce formulaire une fois rempli avec des valeurs invalides implique le refus de votre demande ! 
                                     <br></p>
                                    <form   action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                   <input type="hidden" name="type" value="reserverM"><input type="hidden" name="matriculev" value="<%out.print(moto.get(i).getMatricule()); %>">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                         
                                         
                                         
                                         <div class="cell small-6">
                                             <label>Date de debut de réservation:
                                                 <input type="date" name="datedebut" placeholder="date" min="<% {  LocalDate date= LocalDate.now(); LocalDate demain=date.plusDays(1);
                                             out.print(demain);%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Date de fin de réservation:
                                                 <input type="date" name="datefin" placeholder="date" min="<% out.print(demain);}%>" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de debut de réservation:
                                                 <input type="time" name="hd" min="08:00" max="21:00" placeholder="hh" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="cell small-6">
                                             <label>Heure de fin de réservation:
                                                 <input type="time" name="hf" min="09:00" max="22:00" placeholder="date"  required>
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
                                                 <button class="button warning" type="submit" value="Submit">Reserver</button>
                                             </fieldset>
                                         <fieldset class="cell large-6">
                                                 <button class="button warning" type="reset" value="Reset">Réinitialiser</button>
                                         </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                    </div>
                                     <%}} %>
                                     </tbody>
                                     </table>
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     
                                     </div>
                                 
                             </div>
                             <h4 id="H2-acc">Recherche avancée:</h4>
                             <p id="H2-acc">C'est à vous de choisir !</p>
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServeletClient" method="post">
                                     <input type="hidden" name="type" value="rechercheAvanceeMoto" >
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                                 <label>Marque: 
                                                     <select id="select" name="marque">
                                                         <option value="tous" ></option>
                                                          <%for(int i=0;i<marquemoto.size();i++){ %>
                                                         <option value="<%out.print(marquemoto.get(i)); %>" ><% out.print(marquemoto.get(i));%></option>
                                                         <%} %>
                                                         
                                                     </select>
                                                 </label>
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie" >
                                                     <option value="tous" ></option>
                                                         <option value="urbain" >Urbain</option>
                                                         <option value="sport" >Sport</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Etat: 
                                                     <select id="select" name="etat" >
                                                         
                                                         <option value="libre">Libre</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour maximum:
                                                     <input type="number" placeholder="3000" name="plj" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure maximum:
                                                     <input type="number" placeholder="200" name="plh" min="0" aria-describedby="exampleHelpText" pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                         </div>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x">
                                             <fieldset class="cell large-6">
                                                 <button class="button warning" type="submit" value="Submit">Rechercher</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button warning" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                             </div>
  
                         </div>
                         
                     </section>
                     <section id="first" data-magellan-target="first">
                             <h2 id="H2-acc">Nos offres</h2>
                             <p id="H2-acc">Jetez un coup d'oeil sur nos offres et béneficiez des meilleurs tarifs et de nombreux avantages</p>

                 
                      
                         <div class="orbit" role="region" aria-label="Favorite Space Pictures" data-orbit data-options="animInFromLeft:fade-in; animInFromRight:fade-in; animOutToLeft:fade-out; animOutToRight:fade-out;">

                             <div class="orbit-wrapper">
                                 <div class="orbit-controls">
                                     <button class="orbit-previous"><span class="show-for-sr">Previous Slide</span>&#9664;&#xFE0E;</button>
                                     <button class="orbit-next"><span class="show-for-sr">Next Slide</span>&#9654;&#xFE0E;</button>
                                 </div>
                                 <ul class="orbit-container">
                                     <li class="is-active orbit-slide">
                                         <figure class="orbit-figure">
                                             <img class="orbit-image" src="ATELIER\choisis.jpg" alt="Space">
                                             <figcaption class="orbit-caption">On vous accompagnera dans vos plus belles jours avec notre offre des fêtes <br></figcaption>
                                         </figure>
                                     </li>
                                     <li class="orbit-slide">
                                         <figure class="orbit-figure">
                                             <img class="orbit-image" src="ATELIER\VAC1.jpg" alt="Space">
                                             <figcaption class="orbit-caption">Pensez vous aller en vacances ? cette offre est spécialement fait pour vous ! </figcaption>
                                         </figure>
                                     </li>
                                     <li class="orbit-slide">
                                         <figure class="orbit-figure">
                                             <img class="orbit-image" src="ATELIER\even.png" alt="Space">
                                             <figcaption class="orbit-caption">Evenement ? Voyege organisé ? transporter un grand nombre ? Nous avons pensé à tout, nous avons ce qu'il vous faut. </figcaption>
                                             </figure>
                                     </li>
                                 </ul>
                             </div>
                             <nav class="orbit-bullets">
                                 <button class="is-active" data-slide="0"><span class="show-for-sr">First slide details.</span><span class="show-for-sr">Current Slide</span></button>
                                 <button data-slide="1"><span class="show-for-sr">Second slide details.</span></button>
                                 <button data-slide="2"><span class="show-for-sr">Third slide details.</span></button>   
                             </nav>
                         </div>
                         <button class=" button expanded warning" id="insc" data-open="Modal2" >Consulter les offres!</button>
                     </section>
                     <div class="reveal" id="Modal2" data-reveal>
                     <h1>Offres</h1>
                     <p>Aucun offre n'est disponible pour le moment  </p>
                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
  
                 </div>
                                                     
                                                     
                             

                 
                                                     <!-- Notification -->
                     <section id="second" data-magellan-target="second">
                         <div class="callout primary" id="noti" data-closable="slide-out-right">
                             <h4 id="H2-cl">Notification</h4>
                             <p><jsp:getProperty property="notification" name="Clien" /></p>
                             <a href="Profile-client.jsp" id="H2-c">Pour plus d'information consulter votre profile </a>
                             <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                              <span aria-hidden="true">&times;</span>
                             </button>
                         </div>    
                     </section>                               
                 </div>


                                                     <!-- contactez nous-->
                 
                 <h4 id="cont">Pour nous, votre satisfaction est essentiel</h4>
                 <p id="cont1">Relation clientèle</p>
                 <p id="cont2">Nous vous Proposons plusieurs solution pour nous contacter. Choisissez celle qui vous convient le mieux</p>
                 <div class="media-object stack-for-small">
                     <div class="media-object-section">
                         <div class="thumbnail" id="cont3">
                             <img src= "ATELIER\contactez-nous.jpg">
                         </div>
                     </div>
                     <div class="media-object-section">
                         <p id="cont4">Email:</p>
                         <p id="cont5">projethassan5@gmail.com</p>
                     
                     
                         <p id="cont4">Telephone:</p>
                         <p id="cont5">0542216142 <br> du samedi au jeudi de 8H30 à 17H30</s></p>

                         <p id="cont4">Adresse:</p>
                         <p id="cont5">Agence location <br> Rue de l'independance, Ali Medjeli <br> Ali Mendjeli, Constantine</s></p>
                     </div>
                 </div>
                 

                                                              <!-- fin contactez nous -->




                 
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