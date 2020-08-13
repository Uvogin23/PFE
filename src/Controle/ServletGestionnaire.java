package Controle;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Enumeration.M_Payement;
import Gestion.GestionGestionnaire;
import Gestion.GestionGestionnaireTechnique;
import Model.Client;
import Model.Contrat;
import Model.Reservation;
import mail.Mail;
import mail.Sender;

import java.time.*;

@WebServlet("/ServletGestionnaire")
public class ServletGestionnaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletGestionnaire() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter  out= response.getWriter();
		String user=(String) request.getSession().getAttribute("user");
		if(user==null) {
			this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);
		}else {
			String type = (String) request.getParameter("type");
	        if (type == null) {
				
				this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
				
			} else {
				switch (type) {
				case "confinsc":
					confirmerinscription(request, response);
					break;
				case "anninsc":
					annulerinscription(request, response);
					break;
				case "confres":
					confirmerreservation(request, response);
					break;
				case "annres":
					annulerreservation(request, response);
					break;
				case "finres":
					mettrefinreservation(request,response);
					break;
				case "notclient":
					notifierclient(request, response);
					break;
				case "blocclient":
					bloquerclient(request, response);
					break;
				case "consulterclient":
					consulterclient(request, response);
					break;
				case "penaliteres":
					mettrefinreservationPenalite(request, response);
					break;
				case "calculer":
					calculerRecette(request, response);
					break;
				case "imprimecontrat":
	            	imprimerContrat(request, response);
	            	break;
				default:
					this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
					break;
				}
				
		}
	}
		
        doGet(request, response);    }
	private void imprimerContrat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	GestionGestionnaire gg=new GestionGestionnaire();
		
		try {
			int id=Integer.parseInt(request.getParameter("idres"));
			Client c=new Client();
			
			Contrat contrat=new Contrat();
			contrat=gg.rechercherContrat(id);
			
			request.getSession().setAttribute("contrat", contrat);
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			c=r.getClient();
			request.getSession().setAttribute("Clien", c);
			request.getSession().setAttribute("reservation", r);
			String s=null;
			if(r.getDateDebut().equals(r.getDatefin())) {
				s="Heure";
			}else {
				s="Jour";
			}
			request.getSession().setAttribute("type", s);
//			PrintWriter  out= response.getWriter();
//			out.print(contrat.getCharges() + " / "+contrat.getNomUtilisateur()+" / "+contrat.getNumeroContrat()+" / "+contrat.getNumeroidentifient()+
//					" / "+contrat.getPeriode_de_location()+" / "+contrat.getPrix()+" / "+contrat.getModalites_de_payment()
//			+" / "+r.getDateDebut()+" / "+r.getDatefin()+" / "+r.getEtat()+" / "+r.getHeureDebut()+" / "+r.getHeureFin()+" / "
//					+r.getIdReservation()+" / "+r.getMatricule()+" / "+r.getNumeroIdentifient()+" / "+r.getPrix()+" / "+
//			r.getType()+" / "+r.getClient().getAdresse()+" / "+r.getVehicule().getCategorie()+" / "+r.getContrat().getNomUtilisateur());
			this.getServletContext().getRequestDispatcher("/contrat.jsp").forward(request, response);
		}catch(Exception e) {
			Error="Erreur interne";
			request.getSession().setAttribute("Etat", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	
}
		
	
	String Error=null;
	private void confirmerreservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			String user=(String) request.getSession().getAttribute("user");
			LocalDate date= LocalDate.now();
			LocalTime time= LocalTime.now();
			int id=Integer.parseInt(request.getParameter("idres"));
			double prix=Double.parseDouble(request.getParameter("prix"));
			int idclient=Integer.parseInt(request.getParameter("idclient"));
			int periode=Integer.parseInt(request.getParameter("periode"));
			prix=prix*periode;
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			gg.confirmerReservation(id);
			Contrat contrat=new Contrat();
			
			contrat=gg.creerContrat(r, idclient, M_Payement.ESPECE , periode, prix, 0,user);
			response.setContentType("text/html");
			
			gg.changerprix(prix, id);
			gg.addContrat(contrat);
			String not=r.getClient().getNotification()+" Votre demande de réservation de "+r.getVehicule().getModele()+ 
					" a été accepté le "+date+" à: "+time+"<br>";
			gg.notifierclient(r.getClient().getNumeroidentifient(),not );
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Error="La réservation a été confirmé avec succes";
			request.getSession().setAttribute("ETAT", Error);
			Sender sender = new Sender();
			sender.send(new Mail(r.getClient().getEmail(), "Confirmer Reservation", "Votre demande de réservation de "
			+r.getVehicule().getModele() + " à été accepté ! Veuillez presenter à notre Agence le "+r.getDateDebut()+" Adresse Agence Location Rent Station \r\n" + 
					"Rue de l'independance, Ali Medjeli \r\n" + 
					"Ali Mendjeli, Constantine"));
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
	
	private void annulerreservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			LocalDate date= LocalDate.now();
			LocalTime time= LocalTime.now();
			int id=Integer.parseInt(request.getParameter("idres"));
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			gg.annulerReservation(id);
			String not=r.getClient().getNotification()+" Votre demande de réservation de "+r.getVehicule().getModele()+ 
					" a été réfusé le "+date+" à: "+time+"<br>";
			gg.notifierclient(r.getClient().getNumeroidentifient(),not );
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Error="La réservation a été annuler avec succes";
			request.getSession().setAttribute("ETAT", Error);
			Sender sender = new Sender();
			sender.send(new Mail(r.getClient().getEmail(), "Refus de Reservation", "Votre demande de réservation de "
			+r.getVehicule().getModele() + " à été réfusée ! "));
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
	
	private void confirmerinscription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			int id=Integer.parseInt(request.getParameter("idclient"));
			gg.confirmerinscription(id);
			Client c=new Client();
			c=gg.rechercheClient(id);
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Error="La demande d'inscription a été confirmé avec succes";
			request.getSession().setAttribute("ETAT", Error);
			Sender sender = new Sender();
			sender.send(new Mail(c.getEmail(), "Confirmer reservation", "Votre demande d'inscription a été acceptée  "));
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
	
	private void annulerinscription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			int id=Integer.parseInt(request.getParameter("idclient"));
			Client c=new Client();
			c=gg.rechercheClient(id);
			gg.annulerinscription(id);
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Error="La demande d'inscription a été annulé avec succes";
			Sender sender = new Sender();
			sender.send(new Mail(c.getEmail(), "Annuler inscription", "Votre demande d'inscription a été refusée  "));
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
	
	private void notifierclient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			LocalDate date= LocalDate.now();
			LocalTime time= LocalTime.now();
			int id=Integer.parseInt(request.getParameter("idclient"));
			String noti=request.getParameter("notification");
			Client c=new Client();
			c=gg.rechercheClient(id);
			String not=c.getNotification()+"  "+noti+"  "+date+"  "+time+"<br>";
			gg.notifierclient(c.getNumeroidentifient(),not );
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Error="Le client a été notifié avex success";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
	
	private void bloquerclient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try{
			int id=Integer.parseInt(request.getParameter("idclient"));
		Client c=new Client();
		c=gg.rechercheClient(id);
		gg.bloquerclient(id);
		cli=gg.ListClient();
		res=gg.ListReservation();
		request.getSession().setAttribute("listclient", cli);
		request.getSession().setAttribute("listreservation", res);
		Error="Le client a été bloqué avec succes";
		request.getSession().setAttribute("ETAT", Error);
		Sender sender = new Sender();
		sender.send(new Mail(c.getEmail(), "Infos compte", "Votre compte a été bloqué  "));
		this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
	    }catch(Exception e) {
		Error="erreur";
		request.getSession().setAttribute("ETAT", Error);
		this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
	}
	}
	
	private void mettrefinreservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			String mp=(String) request.getParameter("modep");
			LocalDate date= LocalDate.now();
			LocalTime time= LocalTime.now();
			int id=Integer.parseInt(request.getParameter("idres"));
			
			Contrat co=new Contrat();
			co=gg.rechercherContrat(id);
			co.setModalites_de_payment(mp);
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			if(r.getType()=="voiture") {
				ggt.changerEtat("voiture", "libre", r.getVehicule().getMatricule());
				}
				if(r.getType()=="bus") {
					ggt.changerEtat("bus", "libre", r.getVehicule().getMatricule());
					}
				if(r.getType()=="moto") {
					ggt.changerEtat("moto", "libre", r.getVehicule().getMatricule());
				} 
				if(mp.equals("CHEQUE")) {
					gg.modifierContratcheque(id, 0, 0, co.getModalites_de_payment());
				}else {
					gg.modifierContratespece(id, 0, 0, co.getModalites_de_payment());
				}
			//gg.modifierContrat(id, 0, r.getContrat().getPeriode_de_location(), co.getModalites_de_payment());
			gg.mettrefinreservation(id);
			String not=r.getClient().getNotification()+" Votre  réservation de "+r.getVehicule().getModele()+ " de "+r.getDateDebut()+
					" à "+r.getDatefin()+" à été  mise à fin le "+date+" à: "+time+"<br>";
			gg.notifierclient(r.getClient().getNumeroidentifient(),not );
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
			Client c=new Client();
			
			Contrat contrat=new Contrat();
			contrat=gg.rechercherContrat(id);
			
			request.getSession().setAttribute("contrat", contrat);
			Reservation reservation=new Reservation();
			reservation=gg.rechercherReservation(id);
			request.getSession().setAttribute("reservation", reservation);
			String s=null;
			if(reservation.getDateDebut().equals(reservation.getDatefin())) {
				s="Heure";
			}else {
				s="Jour";
			}
			request.getSession().setAttribute("type", s);
			c=reservation.getClient();
			request.getSession().setAttribute("Clien", c);
			Error="La réservation a été mise à fin avec succes";
			request.getSession().setAttribute("ETAT", Error);
			Sender sender = new Sender();
			sender.send(new Mail(c.getEmail(), "Infos compte", "Resrvation de "+reservation.getVehicule().getModele()+
					" a été mise à fin ! merci de  choisir notre agence   "));
			this.getServletContext().getRequestDispatcher("/contrat.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}	
		}
	
	private void mettrefinreservationPenalite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Client> cli=new ArrayList<>();
		try {
			String mp=(String) request.getParameter("modep");
			Double charge=Double.parseDouble(request.getParameter("charge"));
			int periode=Integer.parseInt(request.getParameter("periode"));
			LocalDate date= LocalDate.now();
			LocalTime time= LocalTime.now();
			int id=Integer.parseInt(request.getParameter("idres"));
			
			Contrat co=new Contrat();
			co=gg.rechercherContrat(id);
			co.setModalites_de_payment(mp);
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			if(r.getType()=="voiture") {
				ggt.changerEtat("voiture", "libre", r.getVehicule().getMatricule());
				}
				if(r.getType()=="bus") {
					ggt.changerEtat("bus", "libre", r.getVehicule().getMatricule());
					}
				if(r.getType()=="moto") {
					ggt.changerEtat("moto", "libre", r.getVehicule().getMatricule());
				} 
				if(mp.equals("CHEQUE")) {
					gg.modifierContratcheque(id, charge, periode, co.getModalites_de_payment());
				}else {
					gg.modifierContratespece(id, charge, periode, co.getModalites_de_payment());
				}
			//gg.modifierContrat(id, 0, r.getContrat().getPeriode_de_location(), co.getModalites_de_payment());
				co=gg.rechercherContrat(id);
				gg.changerprix(co.getPrix(), id);
			gg.mettrefinreservation(id);
			
			String not=r.getClient().getNotification()+" Votre  réservation de "+r.getVehicule().getModele()+ " de "+r.getDateDebut()+
					" à "+r.getDatefin()+" à été  mise à fin le "+date+" à: "+time+"<br>";
			gg.notifierclient(r.getClient().getNumeroidentifient(),not );
			cli=gg.ListClient();
			res=gg.ListReservation();
			request.getSession().setAttribute("listclient", cli);
			request.getSession().setAttribute("listreservation", res);
            Client c=new Client();
			
			Contrat contrat=new Contrat();
			contrat=gg.rechercherContrat(id);
			
			request.getSession().setAttribute("contrat", contrat);
			Reservation reservation=new Reservation();
			reservation=gg.rechercherReservation(id);
			request.getSession().setAttribute("reservation", reservation);
			String s=null;
			if(reservation.getDateDebut().equals(reservation.getDatefin())) {
				s="Heure";
			}else {
				s="Jour";
			}
			request.getSession().setAttribute("type", s);
			c=reservation.getClient();
			request.getSession().setAttribute("Clien", c);
			Error="La réservation a été mise à fin avec succes";
			request.getSession().setAttribute("ETAT", Error);
			Sender sender = new Sender();
			sender.send(new Mail(c.getEmail(), "Infos compte", "Resrvation de "+reservation.getVehicule().getModele()+
					" a été mise à fin ! merci de  choisir notre agence   "));
			this.getServletContext().getRequestDispatcher("/contrat.jsp").forward(request, response);
		}catch(Exception e) {
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}	
		}
	
	private void consulterclient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Reservation> resencour=new ArrayList<>();
		ArrayList<Reservation> reshist=new ArrayList<>();
		ArrayList<Reservation> resdem=new ArrayList<>();
		try {
			int id=Integer.parseInt(request.getParameter("idclient"));
			Client c=new Client();
			c=gg.rechercheClient(id);
			res=gg.ListReservation();
			
			for(int i=0;i<res.size();i++) {
				if(res.get(i).getEtat()=="Historique" && res.get(i).getClient().getNumeroidentifient()==c.getNumeroidentifient()) {
					reshist.add(res.get(i));
				}
				if(res.get(i).getEtat()=="Valide" && res.get(i).getClient().getNumeroidentifient()==c.getNumeroidentifient()) {
					resencour.add(res.get(i));
				}
				if(res.get(i).getEtat()=="NonValide" && res.get(i).getClient().getNumeroidentifient()==c.getNumeroidentifient()) {
					resdem.add(res.get(i));
				}
			}
			request.getSession().setAttribute("client", c);
			request.getSession().setAttribute("resclient", res);
			request.getSession().setAttribute("resclientcours", resencour);
			request.getSession().setAttribute("resclienthist", reshist);
			request.getSession().setAttribute("resclientdem", resdem);
			this.getServletContext().getRequestDispatcher("/ConsulterClient.jsp").forward(request, response);
		}catch(Exception e){
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
		}
	
	private void calculerRecette(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionGestionnaire gg=new GestionGestionnaire();
		try {
			String date=request.getParameter("date");
			double recette=gg.CalculerRecette(date);
			Error="La recette de "+date+" est "+recette;
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}catch(Exception e){
			Error="erreur";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
		}
	}
}
