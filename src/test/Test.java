package test;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;



import Enumeration.EtatC;
import Fonctions.Check;
import Gestion.GestionClient;
import Gestion.GestionGestionnaire;
import Gestion.GestionGestionnaireTechnique;
import Gestion.GestionInsAuth;
import Model.Client;
import Model.Connexion;
import Model.Contrat;
import Model.Reservation;
import Model.Vehicule;
import mail.Mail;
import mail.Sender;

@SuppressWarnings("unused")
public class Test {

	public static void main(String[] args) {


		//GestionGestionnaire GG=new GestionGestionnaire();
		//ArrayList<Reservation> cli=new ArrayList<>();
		//cli=GG.ListReservationClient(1234569);
		//for(int i=0;i<cli.size();i++) {
		//	System.out.println(cli.get(i).getDateDebut());
		//}
		//
		//LocalDate date= LocalDate.now();
		//LocalDate hier=date.minusDays(1);
		//String yesterday=String.valueOf(hier);
		//Double d=0.0;
		//d=GG.CalculerRecette("2018-06-07");
		//System.out.println(d);

		//Sender sender = new Sender();
		//sender.send(new Mail("senfour-milan@hotmail.fr", "test", "test"));
		//GestionGestionnaireTechnique g=new GestionGestionnaireTechnique();
		//System.out.println(g.countDepot(1)); 
		//String t="libre";
		//g.changerEtat("moto", t , "3246-212-25");
		Check.startCheck();
		Check.startCheck();
	}
}