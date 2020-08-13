<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <title>Contrat</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
<% Client client= (Client) request.getSession().getAttribute("Clien"); %>
<% String type=(String) request.getSession().getAttribute("type");%>
<% Reservation r=(Reservation) request.getSession().getAttribute("reservation");%>
<% Contrat c=(Contrat) request.getSession().getAttribute("contrat");%>
<br><br><br>
<a class="button  expanded" href="#" onclick="window.print(); return false;" align="center"><h1 id="infp3" align="center">Contrat</h1></a>
<p id="age" align="center">Agence Location Rent Station
<br> Rue de l'independance, Ali Medjeli 
<br> Ali Mendjeli, Constantine</p>

<br>
<p id="age" align="center">Email: projethassan5@gmail.com <br>
Telephone: 031724335 <br>
Portable: 0542216142</p>
<br><br>
 <div class="grid-container">
  <div class="grid-x grid-margin-x">
  
              <div class="medium-4 cell">
                                 <p id="imprime">Nom client: <%out.print(client.getNom()); %></p>            
             </div>
             
             <div class="medium-4 cell">
                                 <p id="imprime">Prenom: <%out.print(client.getPrenom()); %></p>            
             </div>
             
             
             <div class="medium-4 cell">
                                 <p id="imprime">Nom utilisateur: <%out.print(client.getNomUtilisateur()); %></p>            
             </div>
             <br><br><br>
             <div class="medium-4 cell">
                                 <p id="imprime">Numéro identifient: <%out.print(client.getNumeroidentifient()); %></p>            
             </div>
             
             <div class="medium-4 cell">
                                 <p id="imprime">Numéro reservation: <% out.print(r.getIdReservation()); %></p>            
             </div>
             <div class="medium-4 cell">
                                 <p id="imprime">Type de réservation: Réservation par <% out.print(type); %></p>            
             </div>
             <br><br><br>
             
             <div class="medium-4 cell">
                                 <p id="imprime">Gestionnaire: <% out.print(c.getNomUtilisateur()); %></p>            
             </div>
             <div class="medium-4 cell">
             <p id="imprime">Date et Heure debut: <br> <% out.print(r.getDateDebut()+" à partir de "+ r.getHeureDebut()); %> </p>
             </div>
             <div class="medium-4 cell">
             <p id="imprime">Date et Heure fin: <br><% out.print(r.getDatefin()+" à "+ r.getHeureFin()); %> </p>
             </div>
   </div>
  </div>
  <br>
  <table class="stack" id="tabrev">
  	<thead>
                                     <tr>
                                     <th width="150">Marque</th>
                                     <th width="150">Modele</th>
                                     <th width="150">Prix par heure  </th>
                                     <th width="150">prix par jour</th>
                                     <th width="100">Catégorie</th>
                                     <th width="100">Prix</th>
                                     
                                     </tr>
                                     </thead>
                                     <tbody>
                                     <tr>
                                     <td><%out.print(r.getVehicule().getMarque()); %></td>
                                     <td><%out.print(r.getVehicule().getModele()); %></td>
                                     <td><%out.print(r.getVehicule().getPrix_par_heure()); %></td>
                                     <td><%out.print(r.getVehicule().getPrix_par_jour()); %></td>
                                     <td><%out.print(r.getVehicule().getCategorie()); %></td>
                                     <td><%out.print(r.getPrix()); %></td>
                                     </tr>
                                     </tbody>
  </table>
  <br>
   <div class="grid-container">
  <div class="grid-x grid-margin-x">
  
              <div class="medium-4 cell">
              <p id="imprime">Numero Contrat: <%out.print(c.getNumeroContrat()); %></p>
              </div>
              <div class="medium-4 cell">
              <p id="imprime">Paiement: <%out.print(c.getModalites_de_payment()); %></p>
              </div>
              
              <div class="medium-4 cell">
              <p id="imprime">Type: Réservation par <%out.print(type); %></p>
              </div>
              <br><br>
              <div class="medium-4 cell">
              <p id="imprime">Période: <%out.print(c.getPeriode_de_location()+" "+type); %></p>
              </div>
              
              <div class="medium-4 cell">
              <p id="imprime">Prix sans charge: <%out.print(c.getPrix()-c.getCharges()); %></p>
              </div>
              
              <div class="medium-4 cell">
              <p id="imprime">Charge: <%out.print(c.getCharges()); %></p>
              </div>
              <br><br>
              <div class="medium-4 cell"></div>
              <div class="medium-4 cell">
              <p id="imprime">Prix total: <%out.print(c.getPrix()); %></p>
              </div>
  </div>
  </div>
  <br>
  <div class="grid-container">
  <div class="grid-x grid-margin-x">
  
              <div class="medium-4 cell">
              <p id="imprime">Signature Client</p>
              </div>
              <div class="medium-4 cell"></div>
              <div class="medium-4 cell">
              <p id="imprime">Signature Gestionnaire</p>
              </div>
  </div>
  </div>
  
  
  
  



<script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
</body>
</html>