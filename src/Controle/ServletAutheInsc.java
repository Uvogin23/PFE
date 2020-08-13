package Controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import Gestion.GestionClient;
import Gestion.GestionGestionnaire;
import Gestion.GestionGestionnaireTechnique;
import Gestion.GestionInsAuth;
import Model.Client;
import Model.Garage;
import Model.Gestionnaire;
import Model.Reservation;

import java.util.ArrayList;
import Model.Vehicule;

@SuppressWarnings("unused")
@WebServlet("/ServletAutheInsc")
public class ServletAutheInsc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletAutheInsc() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter  out= response.getWriter();


		String type = (String) request.getParameter("type");
		if (type == null) {

			this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);

		} else {
			switch (type) {
			case "AuthClient":
				authC(request, response);
				break;
			case "Inscription":
				ins (request, response);
				break;
			case "AuthGestionnaire"	:
				authG (request, response);
				break;
			default:
				this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);
				break;
			}




			doGet(request, response);
		}
	}

















	private Client formatClient(HttpServletRequest request) {
		Client client = new Client();
		client.setNumeroidentifient(Integer.parseInt(request.getParameter("numPermis")));
		client.setNom(request.getParameter("nom"));
		client.setPrenom(request.getParameter("prenom"));
		client.setNomUtilisateur(request.getParameter("nomUtilisateur"));
		client.setPassword(request.getParameter("password"));
		client.setEmail(request.getParameter("email"));
		client.setAdresse(request.getParameter("adresse"));
		client.setDateNaissence(request.getParameter("dateNaissence"));
		client.setNumeroTelephone(Integer.parseInt(request.getParameter("numTel")));
		client.setEtat("preinscrit");
		client.setNotification("Aucune Notification à afficher");
		return client;
	}





	private void authC (HttpServletRequest request, HttpServletResponse response) {
		Client client=null;
		GestionInsAuth gestionInsAuth = null;
		GestionClient gestionclient =null;
		HttpSession session=null;

		String user= request.getParameter("nomUtilisateur");
		String password=request.getParameter("password");

		gestionInsAuth = new GestionInsAuth();
		client = gestionInsAuth.sauthentifierClient(user,password);

		gestionclient=new GestionClient();

		ArrayList<Vehicule> voiture=new ArrayList<>();
		voiture=gestionclient.rechercheVoiture();

		ArrayList<Vehicule> bus=new ArrayList<>();
		bus=gestionclient.rechercheBus();

		ArrayList<Vehicule> moto=new ArrayList<>();
		moto=gestionclient.rechercheMoto();

		ArrayList<String> listMarquemoto=new ArrayList<>();
		listMarquemoto=gestionclient.listmarque("moto");

		ArrayList<String> listMarquevoiture=new ArrayList<>();
		listMarquevoiture=gestionclient.listmarque("voiture");

		ArrayList<String> listMarquebus=new ArrayList<>();
		listMarquebus=gestionclient.listmarque("bus");
		ArrayList<Reservation> res=new ArrayList<>();
		ArrayList<Reservation> resencour=new ArrayList<>();
		ArrayList<Reservation> reshist=new ArrayList<>();
		ArrayList<Reservation> resdem=new ArrayList<>();
		GestionGestionnaire gg=new GestionGestionnaire();
		if(client!=null) {
			if(client.getEtat()=="client") {
				try {
					session=request.getSession(true);
					res=gg.ListReservation();
					session.setAttribute("user", user);
					session.setAttribute("Clien",client);
					session.setAttribute("listmarquevoiture", listMarquevoiture);
					session.setAttribute("listmarquebus", listMarquebus);
					session.setAttribute("listmarquemoto", listMarquemoto);
					session.setAttribute("listvoiture", voiture);
					session.setAttribute("listbus", bus);
					session.setAttribute("listmoto", moto);
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
					this.getServletContext().getRequestDispatcher("/Client-Acc.jsp").forward(request, response);


				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(client.getEtat()=="bloquer") {
				try {
					String msg="Votre compte est bloqué <br> Contacter l'agence !";
					request.setAttribute("insc", msg);
					this.getServletContext().getRequestDispatcher("/insc_erreur.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else if(client.getEtat()=="preinscrit") {

				try {
					String msg="Votre compte n'est pas encore confirmé <br> Vous allez recevoir un E-mail de confirmation  !";
					request.setAttribute("insc", msg);
					this.getServletContext().getRequestDispatcher("/insc_erreur.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else {
			try {
				this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);
			} catch (ServletException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}


	}




	private void authG (HttpServletRequest request, HttpServletResponse response) {

		Gestionnaire gestionnaire=null;
		GestionInsAuth gestionInsAuth = null;
		HttpSession session=null;

		String user= request.getParameter("nomUtilisateur");
		String password=request.getParameter("password");


		gestionInsAuth=new GestionInsAuth();
		gestionnaire=gestionInsAuth.sauthentifierGestionnaire(user, password);


		if(gestionnaire!=null) {
			if(gestionnaire.getTypeG()=="Gestionnaire") { 
				try {
					session=request.getSession(true);
					
					
					session.setAttribute("user", gestionnaire.getNomUtilisateur());
					GestionGestionnaire gg=new GestionGestionnaire();
					ArrayList<Reservation> res=new ArrayList<>();
					ArrayList<Client> cli=new ArrayList<>();
					cli=gg.ListClient();
					res=gg.ListReservation();
					
					session.setAttribute("listclient", cli);
					session.setAttribute("listreservation", res);
					LocalDate date= LocalDate.now();
					LocalDate hier=date.minusDays(1);
					String yesterday=String.valueOf(hier);
					double recette=gg.CalculerRecette(yesterday);
					session.setAttribute("recette", recette);
					this.getServletContext().getRequestDispatcher("/Gestionnaire.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				
			}else if(gestionnaire.getTypeG()=="GestionnaireTechnique"){
				GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
				ArrayList<Vehicule> voiture=new ArrayList<>();
				ArrayList<Vehicule> moto=new ArrayList<>();
				voiture=ggt.ListVoiture();
				moto=ggt.ListMoto();
				ArrayList<Vehicule> lbus=new ArrayList<>();
				lbus=ggt.ListBus();
				ArrayList<Garage> depot=new ArrayList<>();
				depot=ggt.ListDepot();
				try {

					session=request.getSession(true);
					session.setAttribute("user", gestionnaire.getNomUtilisateur());
					session.setAttribute("listvoiture", voiture);
					session.setAttribute("listmoto", moto);
					session.setAttribute("listbus", lbus);
					session.setAttribute("listdepot", depot);
					this.getServletContext().getRequestDispatcher("/GestionnaireTechnique.jsp").forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			try {
				this.getServletContext().getRequestDispatcher("/Accueil.html").forward(request, response);
			} catch (ServletException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}



	}

	private void  ins(HttpServletRequest request, HttpServletResponse response) {
		Client client=null;
		GestionInsAuth gestionInsAuth = null;
		try {
			client = formatClient(request);
			gestionInsAuth = new GestionInsAuth();
			gestionInsAuth.inscrire(client);
			String msg="Votre demande d'inscription a été envoyé au gestionnaire ! veuillez attendre la confirmation   <br> Vous allez recevoir un E-mail de confirmation  !";
			request.setAttribute("insc", msg);
			this.getServletContext().getRequestDispatcher("/insc_erreur.jsp").forward(request, response);


		}catch(Exception e) {
			e.printStackTrace();
		}


	}


}
