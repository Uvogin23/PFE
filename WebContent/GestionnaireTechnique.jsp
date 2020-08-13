<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="Model.Vehicule" %>
 <%@ page import ="java.util.ArrayList" %>
 <%@ page import ="java.time.LocalDate" %>
 <%@ page import ="Model.Garage" %>

<html class="no-js" lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionnaire Technique</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body >
<%String nom=(String) session.getAttribute("user"); %>
<%if(nom!=null){ %>
           <%ArrayList<Vehicule> voiture=(ArrayList<Vehicule>)session.getAttribute("listvoiture"); %>
           <%ArrayList<Vehicule> moto=(ArrayList<Vehicule>)session.getAttribute("listmoto"); %>
           <%ArrayList<Vehicule> bus=(ArrayList<Vehicule>)session.getAttribute("listbus"); %>
           <%ArrayList<Garage> depot=(ArrayList<Garage>) session.getAttribute("listdepot"); %>
                 <div class="title-bar" data-responsive-toggle="example-animated-menu" data-hide-for="medium">
                     <button class="menu-icon" type="button" data-toggle></button>
                     <div class="title-bar-title">Menu</div>
                 </div>

                 <div class="top-bar" id="example-animated-menu" data-sticky data-margin-top="0" >
                     <div><a href="GestionnaireTechnique.jsp"><img src="ATELIER\rent-a-car34.png" ></a></div>
                     <div class="top-bar-left">
                         <ul class="dropdown menu" data-dropdown-menu >
                             <li class="menu-text" >Rent Station</li>
                             
                         </ul>
                     </div>
                     <div class="top-bar-right">
                         <ul class="menu">
                             
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="#first"><button class="clear button" >Gestion</button></a></li>
                                 <li><a href="#second"><button class="clear button" >Ajout</button></a></li>
                             </ul>
                             <li><a href="http://192.168.43.126:8888/ProjetFin/ServletLogout"><button class="clear button" >Logout</button></a></li>
                         </ul>
                    </div>
                 </div>
                 <br>
                 <h2 id="H2-cl">Bonjour<a href="GestionnaireTechnique.jsp" id="H2-cl"><% out.print(nom); %></a></h2>
                 <%String ETAT=(String) session.getAttribute("ETAT"); %>
              <% if(ETAT!=null){ %>
                          
                         <div class="callout primary" id="noti" data-closable="slide-out-right">
                             
                             <p><%out.print(ETAT);%></p>
                             <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                              <span aria-hidden="true">&times;</span>
                             </button>
                         </div>    
                             <%} %>                      
                 
                  <div class="sections">
                  <section id="first" data-magellan-target="first">
                  <h3 id="info">Gestion:</h3>
                         <ul class="accordion" id="accord-type" data-accordion data-allow-all-closed="true">
                             <li class="accordion-item" data-accordion-item> 
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype" >Gérer Voiture</a>


    <!-- Accordion tab content: it would start in the open state due to using the `is-active` state class. -->
                                 <div class="accordion-content" data-tab-content>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Matricule</th>
                                     <th width="100">Catégorie</th>
                                     <th width="50">code depot</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="150">Etat</th>
                                     <th width="50"></th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%int a=0 ;for(int i=0;i<voiture.size();i++){ %>
                                     <tr>
                                     <td><%out.print(voiture.get(i).getMarque()); %></td>
                                     <td><%out.print(voiture.get(i).getModele());%></td>
                                     <td><%out.print(voiture.get(i).getMatricule());%></td>
                                     <td><%out.print(voiture.get(i).getCategorie());%></td>
                                     <td><%if(voiture.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(voiture.get(i).getIddepot());}%></td>
                                     <td><%out.print(voiture.get(i).getPrix_par_jour());%></td>
                                     <td><%out.print(voiture.get(i).getPrix_par_heure());%></td>
                                     <td><%out.print(voiture.get(i).getEtatv());%></td>
                                     <td><a class="button success" id="inscres" href="#" data-open="Modal<%out.print(i);%>">Consulter</a></td>
                                     </tr>
                                     <div class="large reveal" id="Modal<%out.print(i); %>" data-reveal>
                                        <h1 id="inscf">Fiche Voiture</h1>
                                        <div id="info0">
                 <br>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     <div class="medium-2 cell">
                                             
                                         </div>
                                     <div class="medium-4 cell">
                                             <img  src="ATELIER\icon_vehicules.png" ">
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getMarque()); %></p>
                                         
                                             <p id="infp">Modele</p>
                                             <p id="infp2"><%out.print(voiture.get(i).getModele());%></p> 
                                         </div>
                                         <div class="medium-3 cell">
                                             <p id="infp">Matricule</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getMatricule());%></p>
                                             
                                         </div>
                                          <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Code depot</p> 
                                             <p id="infp2"><%if(voiture.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(voiture.get(i).getIddepot());}%></p>
                                             
                                         </div>
                                         

                                         <div class="medium-6 cell">
                                             <p id="infp">Etat</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getEtatv());%></p>
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Catégorie</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getCategorie());%></p>
                                             
                                         </div>
           
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par jour</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getPrix_par_jour());%></p>
                                             <a class="button small alert expanded" data-toggle="example-dropdown<% if(i==0){ out.print(a);}else{a=a+5; out.print(a);} %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(a); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="pljv"><input type="hidden" name="matricule" value="<%out.print(voiture.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-3"></div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min="0" name="pljvpj" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par heure</p> 
                                             <p id="infp2"><%out.print(voiture.get(i).getPrix_par_heure());%></p>
                                             <a class="button small alert expanded" data-toggle="example-dropdown<%out.print(a+1); %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(a+1); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="plhv"><input type="hidden" name="matricule" value="<%out.print(voiture.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-4"></div>
                                                 
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min="0" name="plhvph" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 <div class="cell small-4"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">

                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-12 cell">
                                         <p id="infp">Gérer</p>
                                         <div class="stacked-for-small small button-group expanded">
                                             <a class="button alert " data-toggle="example-dropdown<%out.print(a+2); %>" id="insc">Supprimer</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(a+2); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="supv"><input type="hidden" name="matricule" value="<%out.print(voiture.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-4"></div>
                                                 
                                                 <fieldset class="cell large-6">

                                                 <button class="button " type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-4"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button alert " data-toggle="example-dropdown<%out.print(a+3); %>" id="insc">Retirer de dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(a+3); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="retvd"><input type="hidden" name="matricule" value="<%out.print(voiture.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-4"></div>
                                                 <fieldset class="cell large-6">

                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-4"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button alert " data-toggle="example-dropdown<%out.print(a+4); %>" id="insc">rajouter au dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(a+4); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="rvd"><input type="hidden" name="matricule" value="<%out.print(voiture.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-6">
                                                 <label>Etat: 
                                                     <select id="select" name="etat">
                                                         <option value="libre">Libre</option>
                                                         <option value="horsService">HorsService</option>
                                                         
                                                     </select>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >code depot
                                                 <input type="number" placeholder="1234" min="1" name="idDepotrvd" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         </div>
 
                                         
                                         
                                         
                                     </div>
                                     </div>
                                     </div>

                                     
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     </div>
                                     <%} %>
                                     </tbody>
                                     </table>
                                     
                                 </div>

                             </li>
                             <li class="accordion-item" data-accordion-item>
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype">Gérer Bus</a>


                                 <div class="accordion-content" data-tab-content>
                                        <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Matricule</th>
                                     <th width="100">Catégorie</th>
                                     <th width="50">Sièges</th>
                                     <th width="50">code depot</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="150">Etat</th>
                                     <th width="50"></th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%int b=(voiture.size()*5);for(int i=0;i<bus.size();i++){ %>
                                     <tr>
                                     <td><% out.print(bus.get(i).getMarque());%></td>
                                     <td><% out.print(bus.get(i).getModele());%></td>
                                     <td><% out.print(bus.get(i).getMatricule());%></td>
                                     <td><% out.print(bus.get(i).getCategorie());%></td>
                                     <td><% out.print(bus.get(i).getPlace());%></td>
                                     <td><%if(bus.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(bus.get(i).getIddepot());}%></td>
                                     <td><% out.print(bus.get(i).getPrix_par_jour());%></td>
                                     <td><% out.print(bus.get(i).getPrix_par_heure());%></td>
                                     <td><% out.print(bus.get(i).getEtatv());%></td>
                                     <td><a class="button alert" id="inscres" href="#" data-open="Modal<%int g=i+voiture.size()+moto.size();out.print(g);%>">Consulter</a></td>
                                      </tr>
                                      <div class="large reveal" id="Modal<%out.print(g);%>" data-reveal>
                                        <h1 id="inscf">Fiche BUS</h1>
                                        <div id="info0">
                 <br>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     <div class="medium-2 cell">
                                             
                                         </div>
                                     <div class="medium-4 cell">
                                             <img  src="ATELIER\iconbus.png" >
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getMarque());%></p>
                                         
                                             <p id="infp">Modele</p>
                                             <p id="infp2"><% out.print(bus.get(i).getModele());%></p> 
                                         </div>
                                         <div class="medium-3 cell">
                                             <p id="infp">Matricule</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getMatricule());%></p>
                                             
                                         </div>
                                          <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Code depot</p> 
                                             <p id="infp2"><% if(bus.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(bus.get(i).getIddepot());}%></p>
                                             
                                         </div>
                                         <div class="medium-4 cell">
                                             <p id="infp">Catégorie</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getCategorie());%></p>
                                             
                                         </div>

                                         <div class="medium-4 cell">
                                             <p id="infp">Etat</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getEtatv());%></p>
                                             
                                         </div>
                                         <div class="medium-4 cell">
                                             <p id="infp">Sièges</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getPlace());%></p>
                                             
                                         </div>
           
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par jour</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getPrix_par_jour());%></p>
                                             <a class="button small  expanded" data-toggle="example-dropdown<% if(i==0){  out.print(b);}else{b=b+5; out.print(b);} %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(b); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="pljb"><input type="hidden" name="matricule" value="<%out.print(bus.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min="0" name="pljbpj" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par heure</p> 
                                             <p id="infp2"><% out.print(bus.get(i).getPrix_par_heure());%></p>
                                             <a class="button small  expanded" data-toggle="example-dropdown<%out.print(b+1); %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(b+1); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="plhb"><input type="hidden" name="matricule" value="<%out.print(bus.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min="0" name="plhbph" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">

                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-12 cell">
                                         <p id="infp">Gérer</p>
                                         <div class="stacked-for-small small button-group expanded">
                                             <a class="button  " data-toggle="example-dropdown<%out.print(b+2); %>" id="insc">Supprimer</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(b+2); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="supb"><input type="hidden" name="matricule" value="<%out.print(bus.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <fieldset class="cell large-6">

                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button " data-toggle="example-dropdown<%out.print(b+3); %>" id="insc">Retirer de dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(b+3); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="retbd"><input type="hidden" name="matricule" value="<%out.print(bus.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <fieldset class="cell large-6">

                                                 <button class="button " type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button  " data-toggle="example-dropdown<%out.print(b+4); %>" id="insc">rajouter au dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(b+4); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="rbd"><input type="hidden" name="matricule" value="<%out.print(bus.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-6">
                                                 <label>Etat: 
                                                     <select id="select" name="etat">
                                                         <option value="libre">Libre</option>
                                                         <option value="horsService">HorsService</option>
                                                         
                                                     </select>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >code depot
                                                 <input type="number" placeholder="1234" min="1" name="idDepotrbd" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
                                                 </div>
                                                 
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         </div>
 
                                         
                                         
                                         
                                     </div>
                                     </div>
                                     </div>

                                     
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     </div>
                                     <%} %>
                                     </tbody>
                                     </table>
                                     
                                 </div>
                             </li>

                             <li class="accordion-item" data-accordion-item>
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype">Gérer Moto</a>
                                 <div class="accordion-content" data-tab-content>
                                      <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Matricule</th>
                                     <th width="100">Catégorie</th>
                                     
                                     <th width="50">code depot</th>
                                     <th width="150">Prix par jour</th>
                                     <th width="150">Prix par heure</th>
                                     <th width="150">Etat</th>
                                     <th width="50"></th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%int c=(voiture.size()*5)+(bus.size()*5);for(int i=0;i<moto.size();i++){ %>
                                     <tr>
                                     <td><%out.print(moto.get(i).getMarque()); %></td>
                                     <td><%out.print(moto.get(i).getModele());%></td>
                                     <td><%out.print(moto.get(i).getMatricule());%></td>
                                     <td><%out.print(moto.get(i).getCategorie());%></td>
                                     <td><%if(moto.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(moto.get(i).getIddepot());}%></td>
                                     <td><%out.print(moto.get(i).getPrix_par_jour());%></td>
                                     <td><%out.print(moto.get(i).getPrix_par_heure());%></td>
                                     <td><%out.print(moto.get(i).getEtatv());%></td>
                                     <td><a class="button secondary" id="inscres" href="#" data-open="Modal<%int s=i+voiture.size();out.print(s);%>">Consulter</a></td>
                                     </tr>
                                     
                                     <div class="large reveal" id="Modal<%out.print(s);%>" data-reveal>
                                        <h1 id="inscf">Fiche MOTO</h1>
                                        <div id="info0">
                 <br>
                                     <div class="grid-container">
                                     <div class="grid-x grid-margin-x">
                                     <div class="medium-2 cell">
                                             
                                         </div>
                                     <div class="medium-4 cell">
                                             <img  src="ATELIER\bike.png" ">
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Marque:</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getMarque()); %></p>
                                         
                                             <p id="infp">Modele</p>
                                             <p id="infp2"><%out.print(moto.get(i).getModele()); %></p> 
                                         </div>
                                         <div class="medium-3 cell">
                                             <p id="infp">Matricule</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getMatricule()); %></p>
                                             
                                         </div>
                                          <div class="medium-3 cell">
                                             
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Code depot</p> 
                                             <p id="infp2"><%if(moto.get(i).getIddepot()==0){out.print("hors-Depot");}else{out.print(moto.get(i).getIddepot());}%></p>
                                             
                                         </div>
                                         <div class="medium-4 cell">
                                             <p id="infp">Catégorie</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getCategorie()); %></p>
                                             
                                         </div>

                                         <div class="medium-4 cell">
                                             <p id="infp">Etat</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getEtatv()); %></p>
                                             
                                         </div>
                                         <div class="medium-4 cell">
                                             
                                             
                                         </div>
           
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par jour</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getPrix_par_jour()); %></p>
                                             <a class="button small warning expanded" data-toggle="example-dropdown<% if(i==0){  out.print(c);}else{c=c+5; out.print(c);} %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(c); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="pljm"><input type="hidden" name="matricule" value="<%out.print(moto.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-3"></div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min ="0" name="pljmpj" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-6 cell">
                                             <p id="infp">Prix par heure</p> 
                                             <p id="infp2"><%out.print(moto.get(i).getPrix_par_heure()); %></p>
                                             <a class="button small warning expanded" data-toggle="example-dropdown<%out.print(c+1); %>" id="insc" >Modifier</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(c+1); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="plhm"><input type="hidden" name="matricule" value="<%out.print(moto.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >Nouveau prix
                                                 <input type="number" placeholder="1234" min="0" name="plhmph" aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">

                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         <div class="medium-12 cell">
                                         <p id="infp">Gérer</p>
                                         <div class="stacked-for-small small button-group expanded">
                                             <a class="button warning " data-toggle="example-dropdown<%out.print(c+2); %>" id="insc">Supprimer</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(c+2); %>" data-dropdown data-auto-focus="true">
  
                                                 <form action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="supm"><input type="hidden" name="matricule" value="<%out.print(moto.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <div class="cell small-3"></div>
                                                 <fieldset class="cell large-6">

                                                 <button class="button " type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button warning " data-toggle="example-dropdown<%out.print(c+3); %>" id="insc">Retirer de dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(c+3); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="retmd"><input type="hidden" name="matricule" value="<%out.print(moto.get(i).getMatricule());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-3"></div>
                                                 <fieldset class="cell large-6">

                                                 <button class="button " type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <div class="cell small-3"></div>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                             <a class="button warning" data-toggle="example-dropdown<%out.print(c+4); %>" id="insc">rajouter au dépot</a>
                                             <div class="dropdown-pane top" id="example-dropdown<%out.print(c+4); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="rmd"><input type="hidden" name="matricule" value="<%out.print(moto.get(i).getMatricule());%>">
                                                 <div data-abide-error class="alert callout" style="display: none;" >
                                                 <p><i class="fi-alert"></i>il y a des erreurs</p>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                  <div class="cell small-6">
                                                 <label>Etat: 
                                                     <select id="select" name="etat">
                                                         <option value="libre">Libre</option>
                                                         <option value="horsService">HorsService</option>
                                                         
                                                     </select>
                                                 </label>
                                                 </div>
                                                 <div class="cell small-6">
                                                 <label id="insc" >code depot
                                                 <input type="number" placeholder="1234" min="1" name="idDepotrmd"  aria-describedby="exampleHelpText" required pattern="number">
                                                 <span class="form-error" id="insc" >
                                                       Champs obligatoire
                                                 </span>
                                                 </label>
        
                                                 </div>
                                                 
                                                 </div>
                                                 </div>
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset" id="insc" >Reinitialiser</button>
                                                 </fieldset>
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                         </div>
                                         </div>
 
                                         
                                         
                                         
                                     </div>
                                     </div>
                                     </div>

                                     
                                     <button class="close-button" data-close aria-label="Close modal" type="button">
                                     <span aria-hidden="true">&times;</span>
                                     </button>
                                     </div>
                                     <%} %>
                                     </tbody>
                                     </table>
                                     
                                 </div>
                             </li>
  <!-- ... -->
                             <li class="accordion-item" data-accordion-item>
    <!-- Accordion tab title -->
                                 <a href="#" class="accordion-title acctype">Gérer Dépot</a>


    <!-- Accordion tab content: it would start in the open state due to using the `is-active` state class. -->
                                 <div class="accordion-content" data-tab-content>
                                     <table class="stack" id="tabrev">
                                     <thead>
                                     <tr>
                                     <th width="50">ID depot</th>
                                     <th width="150">Adresse</th>
                                     <th width="50">capacité</th>
                                     
                                     <th width="50"></th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <%int d=(voiture.size()*5)+(bus.size()*5)+(moto.size()*5);for(int i=0;i<depot.size();i++){ %>
                                     <tr>
                                     <td><%out.print(depot.get(i).getCode()); %></td>
                                     <td><%out.print(depot.get(i).getAdresse()); %></td>                                    
                                     <td><%out.print(depot.get(i).getCapacite()); %></td>
                                     
                                     <td><a class="button warning" data-toggle="example-dropdown<%out.print(d+i); %>" id="inscres" >supprimer</a></td>
                                     

                                     </tr>
                                     <div class="dropdown-pane top" id="example-dropdown<%out.print(d+i); %>" data-dropdown data-auto-focus="true">
  
                                                 <form  action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="supd"><input type="hidden" name="iddep" value="<%out.print(depot.get(i).getCode());%>">
                                                 
                                                 <div class="grid-container">
                                                 <div class="grid-x grid-margin-x">
                                                
                                                 <fieldset class="cell large-6">

                                                 <button class="button warning" type="submit" value="Submit" id="insc" >Confirmer</button>
                                                 </fieldset>
                                                 
                                                 </div>
                                                 </div>
                                                 </form>
                                                 </div>
                                     <%} %>
                                     </tbody>
                                     </table>   
                                 </div>
                             </li>
                             
                         </ul>
                  </section>







                                                     <!-- AJOUT -->



                  <section id="second" data-magellan-target="second">
                  <h3 id="info">Ajout véhicule:</h3>
                  <ul class="tabs" data-responsive-accordion-tabs="tabs medium-accordion large-tabs" id="example-tabs">
                             <li class="tabs-title is-active"><a href="#panel1" aria-selected="true" id="select">Voiture</a></li>
                             <li class="tabs-title"><a href="#panel2" id="select">Bus</a></li>
                             <li class="tabs-title"><a href="#panel3" id="select">Moto</a></li>
                         </ul>

                         <div class="tabs-content" data-tabs-content="example-tabs">
                             <div class="tabs-panel is-active" id="panel1">
                             
                             <h4 id="H2-acc">Ajouter Voiture</h4>
                             
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="ajouterVoiture">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                             <label>Marque:
                                                 <input type="text" placeholder="marque" name="marque" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="medium-6 cell">
                                             <label>Modele:
                                                 <input type="text" placeholder="modele" name="modele" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                             <div class="cell small-6" id="select">
                                             
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie" required>
                                                         <option value="citadine" >citadine</option>
                                                         <option value="professionel" >professionel</option>
                                                         <option value="luxe" >luxe</option>
                                                     </select>
                                                 </label>    
                                             </div>
                                             <div class="cell small-6" id="select">
                                               <label>Etat: 
                                                     <select id="select" name="etat" required>
                                                         <option value="libre" >Libre</option>
                                                         
                                                         
                                                     </select>
                                                 </label>        
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour :
                                                     <input type="number" min="0" placeholder="3000" name="plj" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure:
                                                     <input type="number" min="0" placeholder="200" name="plh" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Code dépot:
                                                     <input type="number" min="1" placeholder="2" name="idDepot"  aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="medium-6 cell">
                                             <label>Matricule:
                                                 <input type="text" placeholder="1234-117-25" name="matricule" required>
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
                                                 <button class="button" type="submit" value="Submit">Envoyer</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                             </div>
                             <div class="tabs-panel" id="panel2">
                             
                             
                             <h4 id="H2-acc">Ajouter bus:</h4>
                             
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="ajouterBus">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                             <label>Marque:
                                                 <input type="text" placeholder="marque" name="marque" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="medium-6 cell">
                                             <label>Modele:
                                                 <input type="text" placeholder="modele" name="modele" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie" required>
                                                         <option value="miniBus" >miniBus</option>
                                                         <option value="confort" name="categorie">Confort</option>
                                                         <option value="semiConfort" name="categorie">semiConfort</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Etat: 
                                                     <select id="select" name="etat" required>
                                                         <option value="libre" >Libre</option>
                                                         
                                                         
                                                     </select>
                                                 </label>        
                                             </div>
                                              <div class="cell small-6" id="select">
                                                 <label>
                                                     Nombre de sièges :
                                                     <input type="number" min="8" name="nsiege" required>
                                                 </label>
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour :
                                                     <input type="number" min="0" placeholder="3000" name="plj" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure:
                                                     <input type="number" min="0" placeholder="200" name="plh" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Code dépot:
                                                     <input type="number" min="1" placeholder="2" name="idDepot"  aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="medium-6 cell">
                                             <label>Matricule:
                                                 <input type="text" placeholder="1234-317-25" name="matricule" required>
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
                                                 <button class="button" type="submit" value="Submit">Envoyer</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                             </div>
                             <div class="tabs-panel" id="panel3">
                             
                             
                             <h4 id="H2-acc">Ajouter moto:</h4>
                                 <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="ajouterMoto">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                             <label>Marque:
                                                 <input type="text" placeholder="marque" name="marque" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                         <div class="medium-6 cell">
                                             <label>Modele:
                                                 <input type="text" placeholder="modele" name="modele" required>
                                                 <span class="form-error">
                                                     Champs obligatoire
                                                 </span>
                                             </label>
                                         </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Catégorie: 
                                                     <select id="select" name="categorie" required>
                                                         
                                                         <option value="sport" >Sport</option>
                                                         <option value="urbain" >Urbain</option>
                                                     </select>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Etat: 
                                                     <select id="select" name="etat" required>
                                                         <option value="libre" name="etat">Libre</option>
                                                         
                                                         
                                                     </select>
                                                 </label>        
                                             </div>
                                         </div>
                                         <div class="grid-x grid-margin-x">
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par jour :
                                                     <input type="number" min="0" placeholder="3000" name="plj" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Prix par heure:
                                                     <input type="number" min="0" placeholder="200" name="plh" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Code dépot:
                                                     <input type="number" min="1" placeholder="2" name="idDepot"  aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="medium-6 cell">
                                             <label>Matricule:
                                                 <input type="text" placeholder="1234-217-25" name="matricule" required>
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
                                                 <button class="button" type="submit" value="Submit">Envoyer</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                 
                             </div>
  
                         </div>


                         <h3 id="info">Ajout dépot:</h3>
                         <form data-abide novalidate action="http://192.168.43.126:8888/ProjetFin/ServletGestionnaireTechnique" method="post">
                         <input type="hidden" name="type" value="ajouterDepot">
                                     <div data-abide-error class="alert callout" style="display: none;">
                                         <p><i class="fi-alert"></i>Il y a des erreurs dans votre formulaire </p>
                                     </div>
                                     <div class="grid-container">
                                         <div class="grid-x grid-margin-x" id="select">
                                             <div class="medium-6 cell">
                                             <label>Adresse:
                                                 <input type="text" placeholder="Adresse" name="adresse" required>
                                                 <span class="form-error">
                                                     Champs obligatoire  
                                                 </span>
                                             </label>
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Code dépot:
                                                     <input type="number" min="1" placeholder="code depot" name="idDepot" aria-describedby="exampleHelpText" required pattern="number">
                                                     <span class="form-error">
                                                     Champs obligatoires
                                                     </span>
                                                 </label>        
                                             </div>
                                             <div class="cell small-6" id="select">
                                                 <label>Capacité:
                                                     <input type="number" min="1" placeholder="70" name="capacite" aria-describedby="exampleHelpText" required pattern="number">
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
                                                 <button class="button" type="submit" value="Submit">Envoyer</button>
                                             </fieldset>
                                             <fieldset class="cell large-6">
                                                 <button class="button" type="reset" value="Reset">Réinitialiser</button>
                                             </fieldset>
                                         </div>
                                     </div>
                                 </form>
                                         

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