package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Fonctions.Check;
import Gestion.GestionClient;
import Gestion.GestionGestionnaire;
import Gestion.GestionGestionnaireTechnique;
import Model.Client;
import Model.Contrat;
import Model.Reservation;
import Model.Vehicule;


@WebServlet("/ServeletClient")
public class ServletClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletClient() {
        super();
    }

    public void init() {
		Check.startCheck();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		//PrintWriter  out= response.getWriter();
		String user=(String) request.getSession().getAttribute("user");
		if(user==null) {
			this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);}else {
		String type = (String) request.getParameter("type");
		if (type == null) {
			
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
			
		} else {
			switch (type) {
			case "rechercheAvanceeMoto":
				rechercheMotoC(request, response);
				break;
			case "rechercheAvanceeBus":
				rechercheBusC(request, response);
				break;
			case "RechercheAvanceeVoiture"	:
				rechercheVoitureC(request, response);
				break;
			case "reserverB" :
			     reserverBus(request,response);
			    break;
			
			case "reserverM" :
				reserverMoto(request,response);
			    break;
			
			case "reserverV" : 
				reserverVoiture(request,response);
		         break;
			
		         
	         case "changeNU":
				
				changerNomUtilisateur(request, response);
				break;
				
            case "changeAdd":
				
				changerAdresse(request, response);
				break;
				
            case "changemdp":
				
				changerMdp(request, response);
				break;
            case "changeEmail":
	            changerEmail(request, response);
	
	           break;
	
            case "changeNum":
	            changerNumeroTelephone(request, response);
	
	           break;
            case "clearnot":
            	clearnotification(request, response);
		         break;
            case "annresclient":
            	annulerreservation(request, response);
            	break;
            case "imprimecontrat":
            	imprimerContrat(request, response);
            	break;
			default:
				this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
				break;
			}
			}
		}
		
		
		doGet(request, response);
	    
	}

	private void imprimerContrat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionClient gc=new GestionClient();
		GestionGestionnaire gg=new GestionGestionnaire();
		
		try {
			int id=Integer.parseInt(request.getParameter("idres"));
			Client c=new Client();
			c=(Client) request.getSession().getAttribute("Clien");
			Contrat contrat=new Contrat();
			contrat=gg.rechercherContrat(id);
			
			request.getSession().setAttribute("contrat", contrat);
			Reservation r=new Reservation();
			r=gg.rechercherReservation(id);
			request.getSession().setAttribute("reservation", r);
			String s=null;
			if(r.getDateDebut().equals(r.getDatefin())) {
				s="Heure";
			}else {
				s="Jour";
			}
			request.getSession().setAttribute("type", s);
			this.getServletContext().getRequestDispatcher("/contrat.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
	
}

	private void clearnotification(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionClient gc=new GestionClient();
		try {
			int id=Integer.parseInt(request.getParameter("numI"));
			gc.clearnotification(id);
			Client client=new Client();
			client=gc.rechercheClient(id);
			request.getSession().setAttribute("Clien", client);
			Etat="Vos Notification ont été effacé avec succés ";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
		
	
}

	String Etat=null;
	private void changerNomUtilisateur(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionClient gc=new GestionClient();
		//PrintWriter  out= response.getWriter();
		
		try {
			String nom=request.getParameter("NomUtilisateur");
			int id=Integer.parseInt(request.getParameter("numI"));
			gc.changerNU(id, nom);
			Client client=new Client();
			client=gc.rechercheClient(id);
			
			request.getSession().setAttribute("Clien", client);
			Etat="Votre nom d 'utilisateur a été changé a "+nom+" avec succés";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
			
		}
	}
	private void changerAdresse(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionClient gc=new GestionClient();
		try {
		String add=request.getParameter("adresse");
		int id=Integer.parseInt(request.getParameter("numI"));
		gc.changerAdresse(id, add);
		Client client=new Client();
		client=gc.rechercheClient(id);
		request.getSession().setAttribute("Clien", client);
		Etat="Votre adresse a été changé a "+add+" avec succés";
		request.getSession().setAttribute("Etat", Etat);
		this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
	}
	
	private void changerNumeroTelephone(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionClient gc=new GestionClient();
		try {
			int id=Integer.parseInt(request.getParameter("numI"));
			int numtel=Integer.parseInt(request.getParameter("numTel"));
			gc.changerNumerotelephone(id, numtel);
			Client client=new Client();
			client=gc.rechercheClient(id);
			request.getSession().setAttribute("Clien", client);
			Etat="Votre numero de téléphone a été changé  avec succés";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
	}
	
	private void changerEmail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionClient gc=new GestionClient();
		try {
			int id=Integer.parseInt(request.getParameter("numI"));
			String email=request.getParameter("email");
			gc.changerEmail(id, email);
			Client client=new Client();
			client=gc.rechercheClient(id);
			request.getSession().setAttribute("Clien", client);
			Etat="Votre E-mail a été changer  avec succés";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
			
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
	}
	
	private void changerMdp(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionClient gc=new GestionClient();
		try {
			int id=Integer.parseInt(request.getParameter("numI"));
			String mdp=request.getParameter("password");
			gc.changermdp(id, mdp);
			Client client=new Client();
			client=gc.rechercheClient(id);
			request.getSession().setAttribute("Clien", client);
			Etat="Votre Mot de passe a été changer  avec succés";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
			
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
		}
	}
	

	
	
	
	

	private void reserverVoiture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionClient gc=new GestionClient();
		Reservation r=new Reservation();
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		ArrayList<Vehicule> bus=new ArrayList<>();
		ArrayList<Vehicule> moto=new ArrayList<>();
		ArrayList<String> listMarquevoiture=new ArrayList<>();
		ArrayList<String> listMarquemoto=new ArrayList<>();
		ArrayList<String> listMarquebus=new ArrayList<>();
		
		
		try {
			Client c =new Client();
			c=(Client) request.getSession().getAttribute("Clien");
			String dateDebut=request.getParameter("datedebut");
			r.setDateDebut(dateDebut);
			  String   dateFin=request.getParameter("datefin");
			  r.setDatefin(dateFin);
			  String     heureDebut=request.getParameter("hd");
			  r.setHeureDebut(heureDebut+":00");
			  String     heureFin=request.getParameter("hf");
			  r.setHeureFin(heureFin+":00");
			  String     matricule=request.getParameter("matriculev");
			  r.setMatricule(matricule);
			  GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
			  Vehicule v=new Vehicule();
			  v=ggt.recherchevoiture(matricule);
			  Double prix=null;
			  if(dateDebut.equals(dateFin)) {
				   prix=v.getPrix_par_heure();
			  }else {
				   prix=v.getPrix_par_jour();
			  }
			  r.setPrix(prix);
			  String etat="nonvalide";
			  r.setEtat(etat);
			  int numid=c.getNumeroidentifient();
			  r.setNumeroIdentifient(numid);
			  gc.reserverVoiture(r);
			  
			  listMarquebus=gc.listmarque("bus");
				listMarquemoto=gc.listmarque("moto");
				listMarquevoiture=gc.listmarque("voiture");
				bus=gc.rechercheBus();
				voiture=gc.rechercheVoiture();
				moto=gc.rechercheMoto();
				ArrayList<Reservation> resencour=new ArrayList<>();
				ArrayList<Reservation> reshist=new ArrayList<>();
				ArrayList<Reservation> resdem=new ArrayList<>();
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
				
				request.getSession().setAttribute("resclientcours", resencour);
				request.getSession().setAttribute("resclienthist", reshist);
				request.getSession().setAttribute("resclientdem", resdem);
			request.getSession().setAttribute("listmarquevoiture", listMarquevoiture);
			request.getSession().setAttribute("listmarquebus", listMarquebus);
			request.getSession().setAttribute("listmarquemoto", listMarquemoto);
			request.getSession().setAttribute("listvoiture", voiture);
			request.getSession().setAttribute("listbus", bus);
			request.getSession().setAttribute("listmoto", moto);
			Etat="Votre Demande de réservation a été enregistrée, veuillez attendre la confirmation du gestionnaire <br>"
					+ "Vous allez recevoir une notification concernant la confirmation de la demande "
					+ "<br> Consulter votre Profile avant la date de début de votre réservation !";
			request.getSession().setAttribute("Etat", Etat);
			
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}
		
		
		 //client = new Client();
		 //client = (Client) request.getSession().getAttribute("Clien");
		 //int numeroIdentifient= client.getNumeroidentifient();
		 
		      
               	
	}

	private void reserverMoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionClient gc=new GestionClient();
		Reservation r=new Reservation();
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		ArrayList<Vehicule> bus=new ArrayList<>();
		ArrayList<Vehicule> moto=new ArrayList<>();
		ArrayList<String> listMarquevoiture=new ArrayList<>();
		ArrayList<String> listMarquemoto=new ArrayList<>();
		ArrayList<String> listMarquebus=new ArrayList<>();
		
		
		try {
			Client c =new Client();
			c=(Client) request.getSession().getAttribute("Clien");
			String dateDebut=request.getParameter("datedebut");
			r.setDateDebut(dateDebut);
			  String   dateFin=request.getParameter("datefin");
			  r.setDatefin(dateFin);
			  String     heureDebut=request.getParameter("hd");
			  r.setHeureDebut(heureDebut+":00");
			  String     heureFin=request.getParameter("hf");
			  r.setHeureFin(heureFin+":00");
			  String     matricule=request.getParameter("matriculev");
			  r.setMatricule(matricule);
			  GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
			  Vehicule v=new Vehicule();
			  v=ggt.recherchemoto(matricule);
			  Double prix=null;
			  if(dateDebut.equals(dateFin)) {
				   prix=v.getPrix_par_heure();
			  }else {
				   prix=v.getPrix_par_jour();
			  }
			  r.setPrix(prix);
			  String etat="nonvalide";
			  r.setEtat(etat);
			  int numid=c.getNumeroidentifient();
			  r.setNumeroIdentifient(numid);
			  gc.reserverMoto(r);
			  
			  listMarquebus=gc.listmarque("bus");
				listMarquemoto=gc.listmarque("moto");
				listMarquevoiture=gc.listmarque("voiture");
				bus=gc.rechercheBus();
				voiture=gc.rechercheVoiture();
				moto=gc.rechercheMoto();
				ArrayList<Reservation> resencour=new ArrayList<>();
				ArrayList<Reservation> reshist=new ArrayList<>();
				ArrayList<Reservation> resdem=new ArrayList<>();
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
				
				request.getSession().setAttribute("resclientcours", resencour);
				request.getSession().setAttribute("resclienthist", reshist);
				request.getSession().setAttribute("resclientdem", resdem);
			request.getSession().setAttribute("listmarquevoiture", listMarquevoiture);
			request.getSession().setAttribute("listmarquebus", listMarquebus);
			request.getSession().setAttribute("listmarquemoto", listMarquemoto);
			request.getSession().setAttribute("listvoiture", voiture);
			request.getSession().setAttribute("listbus", bus);
			request.getSession().setAttribute("listmoto", moto);
			Etat="Votre Demande de réservation é été enregistrer veuillez attendre la confirmation de gestionnaire <br>"
					+ "Vous allez recevoir une notification concernant la confirmation de la demande "
					+ "<br> consulter votre Profile avant la date de début de votre réservation !";
			request.getSession().setAttribute("Etat", Etat);
			response.setContentType("text/html");
			PrintWriter  out= response.getWriter();
			
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}
		
	}

	private void reserverBus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GestionClient gc=new GestionClient();
		Reservation r=new Reservation();
		GestionGestionnaire gg=new GestionGestionnaire();
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		ArrayList<Vehicule> bus=new ArrayList<>();
		ArrayList<Vehicule> moto=new ArrayList<>();
		ArrayList<String> listMarquevoiture=new ArrayList<>();
		ArrayList<String> listMarquemoto=new ArrayList<>();
		ArrayList<String> listMarquebus=new ArrayList<>();
		
		
		
		try {
			Client c =new Client();
			c=(Client) request.getSession().getAttribute("Clien");
			String dateDebut=request.getParameter("datedebut");
			r.setDateDebut(dateDebut);
			  String   dateFin=request.getParameter("datefin");
			  r.setDatefin(dateFin);
			  String     heureDebut=request.getParameter("hd");
			  r.setHeureDebut(heureDebut+":00");
			  String     heureFin=request.getParameter("hf");
			  r.setHeureFin(heureFin+":00");
			  String     matricule=request.getParameter("matriculev");
			  r.setMatricule(matricule);
			  GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
			  Vehicule v=new Vehicule();
			  v=ggt.recherchebus(matricule);
			  Double prix=null;
			  if(dateDebut.equals(dateFin)) {
				   prix=v.getPrix_par_heure();
			  }else {
				   prix=v.getPrix_par_jour();
			  }
			  r.setPrix(prix);
			  String etat="nonvalide";
			  r.setEtat(etat);
			  int numid=c.getNumeroidentifient();
			  r.setNumeroIdentifient(numid);
			  gc.reserverBus(r);
			  
			  listMarquebus=gc.listmarque("bus");
				listMarquemoto=gc.listmarque("moto");
				listMarquevoiture=gc.listmarque("voiture");
				bus=gc.rechercheBus();
				voiture=gc.rechercheVoiture();
				moto=gc.rechercheMoto();
				ArrayList<Reservation> resencour=new ArrayList<>();
				ArrayList<Reservation> reshist=new ArrayList<>();
				ArrayList<Reservation> resdem=new ArrayList<>();
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
				
				request.getSession().setAttribute("resclientcours", resencour);
				request.getSession().setAttribute("resclienthist", reshist);
				request.getSession().setAttribute("resclientdem", resdem);
				
				
			request.getSession().setAttribute("listmarquevoiture", listMarquevoiture);
			request.getSession().setAttribute("listmarquebus", listMarquebus);
			request.getSession().setAttribute("listmarquemoto", listMarquemoto);
			request.getSession().setAttribute("listvoiture", voiture);
			request.getSession().setAttribute("listbus", bus);
			request.getSession().setAttribute("listmoto", moto);
			Etat="Votre Demande de réservation é été enregistrer veuillez attendre la confirmation de gestionnaire <br>"
					+ "Vous allez recevoir une notification concernant la confirmation de la demande "
					+ "<br> consulter votre Profile avant la date de début de votre réservation !";
			request.getSession().setAttribute("Etat", Etat);
			response.setContentType("text/html");
			
			
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}catch(Exception e) {
			Etat="Erreur interne";
			request.getSession().setAttribute("Etat", Etat);
			this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);
		}
		
	}
	private void rechercheVoitureC(HttpServletRequest request, HttpServletResponse response) {

		GestionClient gestionClient=null;
		HttpSession session=null;

		String marque= request.getParameter("marque"),
				categorie=request.getParameter("categorie"),
				etat=request.getParameter("etat"),
				pljString = request.getParameter("plj"),
				plhString = request.getParameter("plh");

		double plj = 0, 
				plh = 0;
		
		if (marque.equals("tous")) {
			marque = null;
		}
		if (categorie.equals("tous")) {
			categorie = null;
		}
		if (etat.equals("tous")) {
			etat = null;
		}

		try {
			plj= Double.parseDouble(pljString);
		} catch (Exception e) {}

		try {
			plh=  Double.parseDouble(plhString);
		} catch (Exception e) {}
			
		

		gestionClient=new GestionClient();
		  ArrayList<Vehicule> voiture=new ArrayList<>();
		  voiture= gestionClient.rechercheVoitureCritere(marque, categorie, etat, plh, plj);
		  
		
		  


			  try {
				  session=request.getSession(true);
				  session.setAttribute("lvoiture", voiture);
				  String type="voiture";
				  session.setAttribute("type", type);
				this.getServletContext().getRequestDispatcher("/ResultatRecherche.jsp").forward(request, response);
				
				
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			  
		
		
		
	}

	private void rechercheBusC(HttpServletRequest request, HttpServletResponse response) {
		GestionClient gestionClient=null;
		HttpSession session=null;

		String marque= request.getParameter("marque"),
				categorie=request.getParameter("categorie"),
				etat=request.getParameter("etat"),
				place=request.getParameter("place"),
				pljString = request.getParameter("plj"),
				plhString = request.getParameter("plh");

		double plj = 0, 
				plh = 0;
		int nplace=0;
		
		if (marque != null && marque.equals("tous")) {
			marque = null;
		}
		if (categorie != null && categorie.equals("tous")) {
			categorie = null;
		}
		if (etat != null && etat.equals("tous")) {
			etat = null;
		}

		try {
			plj= Double.parseDouble(pljString);
		} catch (Exception e) {}
        try {
			plh=  Double.parseDouble(plhString);
        } catch(Exception e) {}
        
        try {
        	nplace=Integer.parseInt(place);
        } catch(Exception e) {}
			

		

		gestionClient=new GestionClient();
		  ArrayList<Vehicule> bus=new ArrayList<>();
		  bus= gestionClient.rechercheBusCritere(marque, categorie, etat, plh, plj,nplace);
		  
		  
		  
		 
			  try {
				  session=request.getSession(true);
				  session.setAttribute("lbus", bus);
				  String type="bus";
				  session.setAttribute("type", type);
					this.getServletContext().getRequestDispatcher("/ResultatRecherche.jsp").forward(request, response);

				
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			  
		
		
	}

	private void rechercheMotoC(HttpServletRequest request, HttpServletResponse response) {
		GestionClient gestionClient=null;
		HttpSession session=null;

		String marque= request.getParameter("marque"),
				categorie=request.getParameter("categorie"),
				etat=request.getParameter("etat"),
				pljString = request.getParameter("plj"),
				plhString = request.getParameter("plh");

		double plj = 0, 
				plh = 0;
		
		
		if (marque.equals("tous")) {
			marque = null;
		}
		if (categorie.equals("tous")) {
			categorie = null;
		}
		if (etat.equals("tous")) {
			etat = null;
		}

		try {
			plj= Double.parseDouble(pljString);
		} catch (Exception e) {}

		try {
			plh=  Double.parseDouble(plhString);
		} catch (Exception e) {}

		gestionClient=new GestionClient();
		  ArrayList<Vehicule> moto=new ArrayList<>();
		  moto= gestionClient.rechercheMotoCritere(marque, categorie, etat, plh, plj);
		  
		  
		  
		 
			
			  try {
				  session=request.getSession(true);
				  session.setAttribute("lmoto", moto);
				  String type="moto";
				  session.setAttribute("type", type);
				this.getServletContext().getRequestDispatcher("/ResultatRecherche.jsp").forward(request, response);
				
				
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	}
		 
			  private void annulerreservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					GestionGestionnaire gg=new GestionGestionnaire();
					ArrayList<Reservation> res=new ArrayList<>();
					
					Client client=new Client();
					client=(Client)request.getSession().getAttribute("Clien");
					try {
						LocalDate date= LocalDate.now();
						LocalTime time= LocalTime.now();
						int id=Integer.parseInt(request.getParameter("idres"));
						Reservation r=new Reservation();
						r=gg.rechercherReservation(id);
						gg.annulerReservation(id);
						ArrayList<Reservation> resencour=new ArrayList<>();
						ArrayList<Reservation> reshist=new ArrayList<>();
						ArrayList<Reservation> resdem=new ArrayList<>();
						res=gg.ListReservation();
						for(int i=0;i<res.size();i++) {
							if(res.get(i).getEtat()=="Historique" && res.get(i).getClient().getNumeroidentifient()==client.getNumeroidentifient()) {
								reshist.add(res.get(i));
							}
							if(res.get(i).getEtat()=="Valide" && res.get(i).getClient().getNumeroidentifient()==client.getNumeroidentifient()) {
								resencour.add(res.get(i));
							}
							if(res.get(i).getEtat()=="NonValide" && res.get(i).getClient().getNumeroidentifient()==client.getNumeroidentifient()) {
								resdem.add(res.get(i));
							}
						}
						request.getSession().setAttribute("resclient", res);
						request.getSession().setAttribute("resclientcours", resencour);
						request.getSession().setAttribute("resclienthist", reshist);
						request.getSession().setAttribute("resclientdem", resdem);
						
						request.getSession().setAttribute("listreservation", res);
						Etat="La réservation a été annuler avec succes";
						request.getSession().setAttribute("ETAT", Etat);
						this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
					}catch(Exception e) {
						Etat="erreur";
						request.getSession().setAttribute("ETAT", Etat);
						this.getServletContext().getRequestDispatcher("/Profile-client.jsp").forward(request, response);
					}
					}

			
		
	}
	

