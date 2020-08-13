<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="icon" type="image/png" href="ATELIER\car.png" />
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
       <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
                                                     <!-- top bar-->
<%String ETAT=(String) request.getAttribute("insc") ;%>
                 <div class="title-bar" data-responsive-toggle="example-animated-menu" data-hide-for="medium">
                     <button class="menu-icon" type="button" data-toggle></button>
                     <div class="title-bar-title">Menu</div>
                 </div>

                 <div class="top-bar" id="example-animated-menu" data-sticky data-margin-top="0" >
                     <div><img src="ATELIER\rent-a-car34.png"></div>
                     <div class="top-bar-left">
                         <ul class="dropdown menu" data-dropdown-menu >
                             <li class="menu-text">Rent Station</li>
                             
                         </ul>

                     </div>

                     <div class="top-bar-right">
                         <ul class="menu">
                             <ul class="menu expanded" data-magellan>
                                 <li><a href="Accueil.html"><button class="clear button" >Accueil</button></a></li>
                                 
                             </ul>
                             
                         </ul>
                    </div>
                 </div>
                 <div class="callout ">
                     <h2 id="H2-cl">Welcome</h2>
                     <p id="H2-c"><%out.print(ETAT);%></p>
                     
                 </div>

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


<script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
</body>
</html>