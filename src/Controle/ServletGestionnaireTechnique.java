package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Gestion.GestionGestionnaireTechnique;
import Model.Garage;
import Model.Vehicule;


@SuppressWarnings("unused")
@WebServlet("/ServletGestionnaireTechnique")
public class ServletGestionnaireTechnique extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletGestionnaireTechnique() {
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
			
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			
		} else {
			switch (type) {
			case "ajouterDepot":
				ajouterDepot(request, response);
				break;
			case "ajouterVoiture":
			    ajouterVoiture(request,response);
			    break;
			case "ajouterBus":
			    ajouterBus(request,response);
			    break;
			case "ajouterMoto":
			    ajouterMoto(request,response);
			    break;
			    //depot
			case "supd":
				supprimerDepot(request,response);
			    break;
			    //voiture
			case "pljv":
				pljv(request,response);
			    break;
            case "plhv":
            	plhv(request,response);
			    break;
            case "supv":
				supv(request,response);
			    break;
            case "retvd":
            	retvd(request,response);
			    break;
            case "rvd":
				rvd(request,response);
			    break;  
			    
			    //bus
			    
            case "pljb":
				pljb(request,response);
			    break;
            case "plhb":
            	plhb(request,response);
			    break;
            case "supb":
				supb(request,response);
			    break;
            case "retbd":
            	retbd(request,response);
			    break;
            case "rbd":
				rbd(request,response);
			    break;
			    
			    //moto
			    
            case "pljm":
				pljm(request,response);
			    break;
            case "plhm":
            	plhm(request,response);
			    break;
            case "supm":
				supm(request,response);
			    break;
            case "retmd":
            	retmd(request,response);
			    break;
            case "rmd":
				rmd(request,response);
			    break;
            default:
				this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
				break;
			}}}
		
		doGet(request, response);
	}
	String Error=null;
	private void ajouterDepot(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Garage> depot=new ArrayList<>();
		try {
		int id=Integer.parseInt(request.getParameter("idDepot"));
		int capacite=Integer.parseInt(request.getParameter("capacite"));
		String adresse=request.getParameter("adresse");
		Garage dep=new Garage();
		dep=ggt.recherchedepot(id);
		if(dep.getAdresse()==null) {
			ggt.ajouterDepot(adresse, id, capacite);
			depot=ggt.ListDepot();
			request.getSession().setAttribute("listdepot", depot);
			Error="Le Dépot a été ajouté";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			
		}else {
			
			
			Error="Le depot existe déja veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			
			}
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			
		}
		
	}
	
	private void ajouterVoiture(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
			
			
		try {
			int id=Integer.parseInt(request.getParameter("idDepot"));
			String marque=request.getParameter("marque");
			String modele=request.getParameter("modele");
			String categorie=request.getParameter("categorie");
			String etat=request.getParameter("etat");
			String matricule=request.getParameter("matricule");
			double plh=Double.parseDouble(request.getParameter("plh"));
			double plj=Double.parseDouble(request.getParameter("plj"));
			Garage dep=new Garage();
			dep=ggt.recherchedepot(id);
			if(dep.getAdresse()!=null) {
				if(dep.getCapacite()>ggt.countDepot(id)) {
			Vehicule voi=new Vehicule();
			voi=ggt.recherchevoiture(matricule);
			if(voi.getMatricule()!=null) {
				Error="Ce matricule existe déja veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				}else {
					
					ggt.ajouterVoiture(marque, modele, categorie, matricule, plj, plh, etat, id);
					voiture=ggt.ListVoiture();
					    request.getSession().setAttribute("listvoiture", voiture);
					    
					    Error="La Voiture a été ajouté";
						request.getSession().setAttribute("ETAT", Error);
						this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}
			}else {
				Error="Opération échoué ! le dépot est plein";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);			
				}}else {
					Error="Le dépot n'existe pas";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}
			}catch(Exception e) {
				Error="Erreur interne veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				
			}
	
	}
	
	private void ajouterBus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
			
			
		try {
			int nbp=Integer.parseInt(request.getParameter("nsiege"));
			int id=Integer.parseInt(request.getParameter("idDepot"));
			String marque=request.getParameter("marque");
			String modele=request.getParameter("modele");
			String categorie=request.getParameter("categorie");
			String etat=request.getParameter("etat");
			String matricule=request.getParameter("matricule");
			double plh=Double.parseDouble(request.getParameter("plh"));
			double plj=Double.parseDouble(request.getParameter("plj"));
			Garage dep=new Garage();
			dep=ggt.recherchedepot(id);
			if(dep.getAdresse()!=null) {
				if(dep.getCapacite()>ggt.countDepot(id)) {
			Vehicule bus=new Vehicule();
			bus=ggt.recherchevoiture(matricule);
			if(bus.getMatricule()!=null) {
				Error="Ce matricule existe déja veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				}else {
					
					ggt.ajouterBus(nbp,marque, modele, categorie, matricule, plj, plh, etat, id);
					voiture=ggt.ListBus();
					    request.getSession().setAttribute("listbus", voiture);
					    
					    Error="Le Bus a été ajouté";
						request.getSession().setAttribute("ETAT", Error);
						this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}
			}else {
				Error="Opération échoué ! le dépot est plein";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}}else {
					Error="Le dépot n'existe pas";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}
			}catch(Exception e) {
				Error="Erreur interne veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				
			}
	
	}
	
	private void ajouterMoto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
			
			
		try {
			int id=Integer.parseInt(request.getParameter("idDepot"));
			String marque=request.getParameter("marque");
			String modele=request.getParameter("modele");
			String categorie=request.getParameter("categorie");
			String etat=request.getParameter("etat");
			String matricule=request.getParameter("matricule");
			double plh=Double.parseDouble(request.getParameter("plh"));
			double plj=Double.parseDouble(request.getParameter("plj"));
			Garage dep=new Garage();
			dep=ggt.recherchedepot(id);
			if(dep.getAdresse()!=null) {
				if(dep.getCapacite()>ggt.countDepot(id)) {
			Vehicule voi=new Vehicule();
			voi=ggt.recherchemoto(matricule);
			if(voi.getMatricule()!=null) {
				Error="Ce matricule existe déja veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				}else {
					
					ggt.ajouterMoto(marque, modele, categorie, matricule, plj, plh, etat, id);
					voiture=ggt.ListMoto();
					    request.getSession().setAttribute("listmoto", voiture);
					    
					    Error="La Moto a été ajouté";
						request.getSession().setAttribute("ETAT", Error);
						this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}
			}else {
				Error="Opération échoué ! le dépot est plein";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}}else {
					Error="Le dépot n'existe pas";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}
			}catch(Exception e) {
				Error="Erreur interne veuillez ressayer";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				
				
			}
	
	}
	
	private void supprimerDepot(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Garage> depot=new ArrayList<>();
		Garage dep=new Garage();
		try {
			String code = (String) request.getParameter("iddep");
			int id=Integer.parseInt(code);
			dep=ggt.recherchedepot(id);
			if(dep.getAdresse()!=null) {
				if(ggt.countDepot(id)==0) {
			ggt.supprimerDepot(id);
			depot=ggt.ListDepot();
			request.getSession().setAttribute("listdepot", depot);
			Error="Le dépot a été supprimé";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}
				else {
					request.getSession().setAttribute("listdepot", depot);
					Error="Opération échoué ! Le dépot plein !";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}
			}else {
				Error="Erreur!veuillez ressayer ";
				request.getSession().setAttribute("ETAT", Error);
				this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}
		}catch(Exception e){
			Error="Erreur! interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
		
	}
	private void pljv(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pvj=Double.parseDouble(request.getParameter("pljvpj"));
			car=ggt.recherchevoiture(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.pljv(matricule, pvj);
			voiture=ggt.ListVoiture();
		    request.getSession().setAttribute("listvoiture", voiture);
		    Error="Prix par jour modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La voiture est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void plhv(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pvh=Double.parseDouble(request.getParameter("plhvph"));
			car=ggt.recherchevoiture(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.plhv(matricule, pvh);
			voiture=ggt.ListVoiture();
		    request.getSession().setAttribute("listvoiture", voiture);
		    Error="Prix par heure modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La voiture est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void retvd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchevoiture(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.retvd(matricule);
			ggt.changerEtat("voiture","horsService", matricule);
			voiture=ggt.ListVoiture();
		    request.getSession().setAttribute("listvoiture", voiture);
		    Error="La voiture a été retiré de dépot avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La voiture est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void rvd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String t=(String) request.getParameter("etat");
			int iddepot=Integer.parseInt(request.getParameter("idDepotrvd"));
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchevoiture(matricule);
			Garage dep=new Garage();
			dep=ggt.recherchedepot(iddepot);
			if(car.getEtatv().equals("reserve")) {
				 Error="La voiture est réservé ! veuillez attendre jusqu'à  la fin de réservation";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
					}else {
			if(dep.getAdresse()!=null) {
			if(car.getCategorie()!=null) {
				if(dep.getCapacite()>ggt.countDepot(iddepot)) {
					ggt.changerEtat("voiture", t , matricule);
			ggt.rvd(matricule, iddepot);
			
			voiture=ggt.ListVoiture();
		    request.getSession().setAttribute("listvoiture", voiture);
		    Error="La voiture a été rajouter au dépot avec succés";
			request.getSession().setAttribute("ETAT", Error);
			
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}else {
				 Error="Opération échoué ! le dépot est plein";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}
		}else {
			Error="La voiture n'existe pas";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}}else {
			Error="Le dépot n'existe pas";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
					}
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void supv(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> voiture=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchevoiture(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.supv(matricule);
			voiture=ggt.ListVoiture();
		    request.getSession().setAttribute("listvoiture", voiture);
		    Error="La voiture a été supprimé avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La voiture est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	                    
	                                    // BUS
	
	private void pljb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> bus=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pbj=Double.parseDouble(request.getParameter("pljbpj"));
			car=ggt.recherchebus(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.pljb(matricule, pbj);
			bus=ggt.ListBus();
		    request.getSession().setAttribute("listbus", bus);
		    Error="Prix par jour modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="Le bus est réservé! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void plhb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> bus=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pbh=Double.parseDouble(request.getParameter("plhbph"));
			car=ggt.recherchebus(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.plhb(matricule, pbh);
			bus=ggt.ListBus();
		    request.getSession().setAttribute("listbus", bus);
		    Error="Prix par heure modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="Le bus est réservé! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void retbd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> bus=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchebus(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.retbd(matricule);
			ggt.changerEtat("bus","horsService", matricule);
			bus=ggt.ListBus();
		    request.getSession().setAttribute("listbus", bus);
		    Error="Le bus a été retiré de dépot avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="Le bus est réservé! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void rbd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> bus=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String t=(String) request.getParameter("etat");
			int iddepot=Integer.parseInt(request.getParameter("idDepotrbd"));
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchebus(matricule);
			Garage dep=new Garage();
			dep=ggt.recherchedepot(iddepot);
			if(car.getEtatv().equals("reserve")) {
				 Error="Le bus est réservé ! veuillez attendre jusqu'à  la fin de réservation";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}
			else {
			if(dep.getAdresse()!=null) {
			if(car.getCategorie()!=null) {
				if(dep.getCapacite()>ggt.countDepot(iddepot)) {
			ggt.rbd(matricule, iddepot);
			ggt.changerEtat("bus", t , matricule);
			bus=ggt.ListBus();
		    request.getSession().setAttribute("listbus", bus);
		    Error="Le bus a été rajouté au dépot avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);}else {
				 Error="Opération échoué ! le dépot est plein";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}
		}else {
			Error="Le bus n'existe pas";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}}else {
			Error="Le dépot n'existe pas";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			}
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void supb(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> bus=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchebus(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.supb(matricule);
			bus=ggt.ListBus();
		    request.getSession().setAttribute("listbus", bus);
		    Error="Le bus a été supprimé avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="Le bus est réservé! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	                                        //MOTO
	
	private void pljm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> moto=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pmj=Double.parseDouble(request.getParameter("pljmpj"));
			car=ggt.recherchemoto(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.pljm(matricule, pmj);
			moto=ggt.ListMoto();
		    request.getSession().setAttribute("listmoto", moto);
		    Error="Prix par jour modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La moto est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void plhm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> moto=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			double pmh=Double.parseDouble(request.getParameter("plhmph"));
			car=ggt.recherchemoto(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.plhm(matricule, pmh);
			moto=ggt.ListMoto();
		    request.getSession().setAttribute("listmoto", moto);
		    Error="Prix par heure modifié avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La moto est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void retmd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> moto=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchemoto(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.retmd(matricule);
			ggt.changerEtat("moto","horsService", matricule);
			moto=ggt.ListMoto();
		    request.getSession().setAttribute("listmoto", moto);
		    Error="La moto a été retiré de dépot avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La moto est réservée! veuillez attendre jusqu'à  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void rmd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> moto=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String t=(String) request.getParameter("etat");
			
			int iddepot=Integer.parseInt(request.getParameter("idDepotrmd"));
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchemoto(matricule);
			Garage dep=new Garage();
			dep=ggt.recherchedepot(iddepot);
			if(car.getEtatv().equals("reserve")) {
				 Error="La moto est réservé ! veuillez attendre jusqu'à  la fin de réservation";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
			}else {
				if(dep.getAdresse()!=null) {
					if(car.getCategorie()!=null) {
						if(dep.getCapacite()>ggt.countDepot(iddepot)) {
					ggt.rmd(matricule, iddepot);
					ggt.changerEtat("moto", t , matricule);
					moto=ggt.ListMoto();
				    request.getSession().setAttribute("listmoto", moto);
				    Error="La moto a été rajouté au dépot avec succés";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
					}else {
						 Error="Opération échoué ! le dépot est plein";
							request.getSession().setAttribute("ETAT", Error);
							this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
					}
				}else {
					Error="La moto n'existe pas";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}}else {
					Error="Le dépot n'existe pas";
					request.getSession().setAttribute("ETAT", Error);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				}
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}
	
	private void supm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
		ArrayList<Vehicule> moto=new ArrayList<>();
		Vehicule car=new Vehicule();
		try {
			String matricule=(String) request.getParameter("matricule");
			car=ggt.recherchemoto(matricule);
			if(car.getEtatv()!="reserve") {
			ggt.supm(matricule);
			moto=ggt.ListMoto();
		    request.getSession().setAttribute("listmoto", moto);
		    Error="La moto a été supprimé avec succés";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}else {
			Error="La moto est réservée! veuillez attendre jusqu'Ã  la fin de réservation ";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
			
			
		}catch(Exception e) {
			Error="Erreur interne veuillez ressayer";
			request.getSession().setAttribute("ETAT", Error);
			this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
		}
	}

}
