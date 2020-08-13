package Gestion;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import Fonctions.StringToSqlObject;
import Model.Client;
import Model.Connexion;
import Model.Reservation;
import Model.Vehicule;

public class GestionClient {
  
	Connexion connexion;
	
	
	public GestionClient() {
		this.connexion = new Connexion();
	}

	public ArrayList<Vehicule> rechercheVoiture() {
		ArrayList<Vehicule> voiture=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from voiture;");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule car=new Vehicule();
				car.setMarque(Connexion.r.getString("marque"));
				car.setModele(Connexion.r.getString("modele"));
				car.setMatricule(Connexion.r.getString("matricule"));
				car.setCategorie(Connexion.r.getString("categorie"));
				car.setEtatv(Connexion.r.getString("etat"));
				car.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				car.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				car.setIddepot(Connexion.r.getInt("idDepot"));
				
				voiture.add(car);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return voiture;
		
	}
	
	public ArrayList<Vehicule> rechercheMoto() {
		ArrayList<Vehicule> MOTOR=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from moto where(etat='libre');");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule moto=new Vehicule();
				moto.setMarque(Connexion.r.getString("marque"));
				moto.setModele(Connexion.r.getString("modele"));
				moto.setMatricule(Connexion.r.getString("matricule"));
				moto.setCategorie(Connexion.r.getString("categorie"));
				moto.setEtatv(Connexion.r.getString("etat"));
				moto.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				moto.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				moto.setIddepot(Connexion.r.getInt("idDepot"));
				
				MOTOR.add(moto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return MOTOR;
		
	}
	
	public ArrayList<Vehicule> rechercheBus() {
		ArrayList<Vehicule> Bus=new ArrayList<>();
		connexion.createConnexion();
		
		try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from bus where(etat='libre');");
			Connexion.r=preparedStatement.executeQuery();
			while(Connexion.r.next()){
				Vehicule bus=new Vehicule();
				bus.setMarque(Connexion.r.getString("marque"));
				bus.setModele(Connexion.r.getString("modele"));
				bus.setMatricule(Connexion.r.getString("matricule"));
				bus.setCategorie(Connexion.r.getString("categorie"));
				bus.setEtatv(Connexion.r.getString("etat"));
				bus.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
				bus.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
				bus.setIddepot(Connexion.r.getInt("idDepot"));
				
				bus.setPlace(Connexion.r.getInt("nombrePlace"));
				Bus.add(bus);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		connexion.closeConnexion();
		return Bus;
		
	}
	
       public  ArrayList<Vehicule> rechercheMotoCritere(String marque,String categorie,String etat,double prix_par_heure,double prix_par_jour ) {
    	   ArrayList<Vehicule> MOTO=new ArrayList<>();
    	   connexion.createConnexion();
    	   PreparedStatement  preparedStatement = null;
    	   
    	   String query="select * from moto where( true ",critere="";
    	  
    	   if(marque!=null) {
    		   critere+="and marque=?  ";
    	   }
    	   if(categorie!=null) {
    		   critere+="and categorie=?  "; 
    	   }
    	   if(etat!=null) {
    		   critere+="and etat=?  ";
    	   }
    	   if(prix_par_heure!=0) {
    		   critere+=" and prix_par_heure<=?  ";
    	   }
    	   if(prix_par_jour!=0) {
    		   critere+="and prix_par_jour<=? ";
    	   }
    	   critere+=");";
    	   
    	   try {
    		   preparedStatement = Connexion.con.prepareStatement(query+critere);
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
    	   try {
        	   int i = 1;
        	   if(marque!=null) {
            	   preparedStatement.setString(i, marque);
            	   i++;
        	   }
        	   if(categorie!=null) {
            	   preparedStatement.setString(i, categorie);
            	   i++;
        	   }
        	   if(etat!=null) {
            	   preparedStatement.setString(i, etat);
            	   i++;
        	   }
        	   if(prix_par_heure!=0) {
            	   preparedStatement.setDouble(i, prix_par_heure);
            	   i++;
        	   }
        	   if(prix_par_jour!=0) {
            	   preparedStatement.setDouble(i, prix_par_jour);
        	   }
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	   
    	   try {
    		   Connexion.r=preparedStatement.executeQuery();
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
			try {
				while(Connexion.r.next()){
					Vehicule moto=new Vehicule();
					moto.setMarque(Connexion.r.getString("marque"));
					moto.setModele(Connexion.r.getString("modele"));
					moto.setMatricule(Connexion.r.getString("matricule"));
					moto.setCategorie(Connexion.r.getString("categorie"));
					moto.setEtatv(Connexion.r.getString("etat"));
					moto.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
					moto.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
					moto.setIddepot(Connexion.r.getInt("idDepot"));
					MOTO.add(moto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		return MOTO;
    	   
       }
       
       
       public  ArrayList<Vehicule> rechercheBusCritere(String marque,String categorie,String etat,double prix_par_heure,double prix_par_jour,int place ) {
    	   ArrayList<Vehicule> BUS=new ArrayList<>();
    	   connexion.createConnexion();
    	   PreparedStatement  preparedStatement = null;
    	   
    	   String query="select * from bus where( true ",critere="";
    	  
    	   if(marque!=null) {
    		   critere+="and marque=?  ";
    	   }
    	   if(categorie!=null) {
    		   critere+="and categorie=?  "; 
    	   }
    	   if(etat!=null) {
    		   critere+="and etat=?  ";
    	   }
    	   if(prix_par_heure!=0) {
    		   critere+=" and prix_par_heure<=?  ";
    	   }
    	   if(prix_par_jour!=0) {
    		   critere+="and prix_par_jour<=? ";
    	   }
    	   if(place!=0) {
    		   critere+="and nombrePlace<=? ";
    	   }
    	   critere+=");";
    	   
    	   try {
    		   preparedStatement = Connexion.con.prepareStatement(query+critere);
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
    	   try {
        	   int i = 1;
        	   if(marque!=null) {
            	   preparedStatement.setString(i, marque);
            	   i++;
        	   }
        	   if(categorie!=null) {
            	   preparedStatement.setString(i, categorie);
            	   i++;
        	   }
        	   if(etat!=null) {
            	   preparedStatement.setString(i, etat);
            	   i++;
        	   }
        	   if(prix_par_heure!=0) {
            	   preparedStatement.setDouble(i, prix_par_heure);
            	   i++;
        	   }
        	   if(prix_par_jour!=0) {
            	   preparedStatement.setDouble(i, prix_par_jour);
            	   i++;
        	   }
        	   if(place!=0) {
            	   preparedStatement.setInt(i, place);
        	   }
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	   
    	   try {
    		   Connexion.r=preparedStatement.executeQuery();
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
			try {
				while(Connexion.r.next()){
					Vehicule bus=new Vehicule();
					bus.setMarque(Connexion.r.getString("marque"));
					bus.setModele(Connexion.r.getString("modele"));
					bus.setMatricule(Connexion.r.getString("matricule"));
					bus.setCategorie(Connexion.r.getString("categorie"));
					bus.setEtatv(Connexion.r.getString("etat"));
					bus.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
					bus.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
					bus.setIddepot(Connexion.r.getInt("idDepot"));
					bus.setPlace(Connexion.r.getInt("nombrePlace"));
					BUS.add(bus);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		return BUS;
    	   
       }
       
       
       
       
       public  ArrayList<Vehicule> rechercheVoitureCritere(String marque,String categorie,String etat,double prix_par_heure,double prix_par_jour ) {
    	   ArrayList<Vehicule> voiture=new ArrayList<>();
    	   connexion.createConnexion();
    	   PreparedStatement  preparedStatement = null;
    	   
    	   String query="select * from voiture where( true ",critere="";
    	  
    	   if(marque!=null) {
    		   critere+="and marque=?  ";
    	   }
    	   if(categorie!=null) {
    		   critere+="and categorie=?  "; 
    	   }
    	   if(etat!=null) {
    		   critere+="and etat=?  ";
    	   }
    	   if(prix_par_heure!=0) {
    		   critere+=" and prix_par_heure<=?  ";
    	   }
    	   if(prix_par_jour!=0) {
    		   critere+="and prix_par_jour<=? ";
    	   }
    	   critere+=");";
    	   
    	   try {
    		   preparedStatement = Connexion.con.prepareStatement(query+critere);
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
    	   try {
        	   int i = 1;
        	   if(marque!=null) {
            	   preparedStatement.setString(i, marque);
            	   i++;
        	   }
        	   if(categorie!=null) {
            	   preparedStatement.setString(i, categorie);
            	   i++;
        	   }
        	   if(etat!=null) {
            	   preparedStatement.setString(i, etat);
            	   i++;
        	   }
        	   if(prix_par_heure!=0) {
            	   preparedStatement.setDouble(i, prix_par_heure);
            	   i++;
        	   }
        	   if(prix_par_jour!=0) {
            	   preparedStatement.setDouble(i, prix_par_jour);
        	   }
			} catch (SQLException e) {
				e.printStackTrace();
			}
    	   
    	   try {
    		   Connexion.r=preparedStatement.executeQuery();
    	   } catch (SQLException e) {
    		   e.printStackTrace();
    	   }
    	   
			try {
				while(Connexion.r.next()){
					Vehicule car=new Vehicule();
					car.setMarque(Connexion.r.getString("marque"));
					car.setModele(Connexion.r.getString("modele"));
					car.setMatricule(Connexion.r.getString("matricule"));
					car.setCategorie(Connexion.r.getString("categorie"));
					car.setEtatv(Connexion.r.getString("etat"));
					car.setPrix_par_jour(Connexion.r.getDouble("prix_par_jour"));
					car.setPrix_par_heure(Connexion.r.getDouble("prix_par_heure"));
					car.setIddepot(Connexion.r.getInt("idDepot"));
					voiture.add(car);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connexion.closeConnexion();
		return voiture;
    	   
       }
       
       
       
       
       
       
       
       
       public void reserverBus(Reservation reservation) {
    	   connexion.createConnexion();
    	   
    	   try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(
						"INSERT INTO reservation"
						+ "(numeroIdentifient,"
						+ "dateDebut,"
						+ "dateFin,"
						+ "heureDebut,"
						+ "heureFin,"
						+ "prix,"
						+ "etat,"
						+ "matriculeB"
						+")"
						+ "VALUES(?,?,?,?,?,?,?,?)");
			StringToSqlObject converter = new StringToSqlObject(reservation);
			preparedStatement.setInt(1,reservation.getNumeroIdentifient());
			preparedStatement.setString(2,reservation.getDateDebut());
			preparedStatement.setString(3,reservation.getDatefin());
			preparedStatement.setTime(4,converter.getHeureDebut());
			preparedStatement.setTime(5,converter.getHeureFin());
			preparedStatement.setDouble(6,reservation.getPrix());
			preparedStatement.setString(7,reservation.getEtat().toString());
			preparedStatement.setString(8,reservation.getMatricule());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	   
    	   
       }
       
       public void reserverVoiture(Reservation reservation) {
    	   connexion.createConnexion();
    	   
    	   try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(
						"INSERT INTO reservation"
						+ "(numeroIdentifient,"
						+ "dateDebut,"
						+ "dateFin,"
						+ "heureDebut,"
						+ "heureFin,"
						+ "prix,"
						+ "etat,"
						+ "matriculeV"
						+")"
						+ "VALUES(?,?,?,?,?,?,?,?)");
			StringToSqlObject converter = new StringToSqlObject(reservation);
			preparedStatement.setInt(1,reservation.getNumeroIdentifient());
			preparedStatement.setString(2,reservation.getDateDebut());
			preparedStatement.setString(3,reservation.getDatefin());
			preparedStatement.setTime(4,converter.getHeureDebut());
			preparedStatement.setTime(5,converter.getHeureFin());
			preparedStatement.setDouble(6,reservation.getPrix());
			preparedStatement.setString(7,reservation.getEtat().toString());
			preparedStatement.setString(8,reservation.getMatricule());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	   
    	   
       }
       
       public void reserverMoto(Reservation reservation) {
    	   connexion.createConnexion();
    	   
    	   try {
			PreparedStatement  preparedStatement = Connexion.con.prepareStatement(
						"INSERT INTO reservation"
						+ "(numeroIdentifient,"
						+ "dateDebut,"
						+ "dateFin,"
						+ "heureDebut,"
						+ "heureFin,"
						+ "prix,"
						+ "etat,"
						+ "matriculeM"
						+")"
						+ "VALUES(?,?,?,?,?,?,?,?)");
			StringToSqlObject converter = new StringToSqlObject(reservation);
			preparedStatement.setInt(1,reservation.getNumeroIdentifient());
			preparedStatement.setString(2,reservation.getDateDebut());
			preparedStatement.setString(3,reservation.getDatefin());
			preparedStatement.setTime(4,converter.getHeureDebut());
			preparedStatement.setTime(5,converter.getHeureFin());
			preparedStatement.setDouble(6,reservation.getPrix());
			preparedStatement.setString(7,reservation.getEtat().toString());
			preparedStatement.setString(8,reservation.getMatricule());
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	   
    	   
       }
       
       public ArrayList<String> listmarque(String type){
    	   ArrayList<String> listMarque=new ArrayList<>();
    	   connexion.createConnexion();
   		PreparedStatement preparedStatement=null;
   		try {
   			switch (type) {
   			case "moto":	
   				preparedStatement=connexion.con.prepareStatement("select distinct marque from moto;");
   				break;
   			case "bus":	
   				preparedStatement=connexion.con.prepareStatement("select distinct marque from bus;");
   				break;
   			case "voiture":	
   				preparedStatement=connexion.con.prepareStatement("select distinct marque from voiture;");
   				break;
   			}
   			Connexion.r=preparedStatement.executeQuery();
   			
   			
				while(Connexion.r.next()){
					String marque=null;
					marque=connexion.r.getString("marque");
					listMarque.add(marque);
				}
   			
   			
   		}catch(Exception e) {
   			
   		}
   		connexion.closeConnexion();
    	   return listMarque;
       }
       
       public Client rechercheClient(int id ) {
   		connexion.createConnexion();
   		Client client=new Client();
   		
   		try {
   			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from client where( numeroIdentifient=?)");
   		
   			preparedStatement.setInt(1, id);   	
   				
   			
   			
   			Connexion.r=preparedStatement.executeQuery();
   			if(Connexion.r.next()) {
   				
   				client.setNumeroidentifient(Connexion.r.getInt("numeroIdentifient"));
   				client.setNom(Connexion.r.getString("nom"));
   				client.setPrenom(Connexion.r.getString("prenom"));
   				client.setNomUtilisateur(Connexion.r.getString("nomUtilisateur") );	
   				client.setPassword(Connexion.r.getString("password"));
   				client.setEmail(Connexion.r.getString("email"));
   				client.setAdresse(Connexion.r.getString("adresse"));
   				client.setDateNaissence(Connexion.r.getString("dateNaissence"));
   				client.setNumeroTelephone(Connexion.r.getInt("numeroTelephone"));
   				client.setEtat(Connexion.r.getString("etat"));
   				client.setNotification(Connexion.r.getString("notification"));
   			}
   				
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}
   		
   		connexion.closeConnexion();		
   		return client;
   		

   	}
      
      public void changerNU(int numid,String NU) {
   	   connexion.createConnexion();
  		try {
  			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set nomUtilisateur=? where(numeroIdentifient=? and etat='client');");
  			preparedStatement.setString(1, NU);
  			preparedStatement.setInt(2, numid);
  			preparedStatement.executeUpdate();
  		}catch(Exception e) {
  			
  		}
  		connexion.closeConnexion();
      }
      
      public void changerAdresse(int numid,String add) {
   	   connexion.createConnexion();
  		try {
  			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set adresse=? where(numeroIdentifient=? and etat='client');");
  			preparedStatement.setString(1, add);
  			preparedStatement.setInt(2, numid);
  			preparedStatement.executeUpdate();
  		}catch(Exception e) {
  			
  		}
  		connexion.closeConnexion();
      }
      
      public void changerNumerotelephone(int numid,int numtel) {
   	   connexion.createConnexion();
  		try {
  			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set numeroTelephone=? where(numeroIdentifient=? and etat='client');");
  			preparedStatement.setInt(1, numtel);
  			preparedStatement.setInt(2, numid);
  			preparedStatement.executeUpdate();
  		}catch(Exception e) {
  			
  		}
  		connexion.closeConnexion();
      }
      
      public void changerEmail(int numid, String email ) {
   	   connexion.createConnexion();
  		try {
  			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set email=? where(numeroIdentifient=? and etat='client');");
  			preparedStatement.setString(1, email);
  			preparedStatement.setInt(2, numid);
  			preparedStatement.executeUpdate();
  		}catch(Exception e) {
  			
  		}
  		connexion.closeConnexion();
      }
      
      public void changermdp(int numid, String mdp ) {
   	   connexion.createConnexion();
  		try {
  			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set password=? where(numeroIdentifient=? and etat='client');");
  			preparedStatement.setString(1, mdp);
  			preparedStatement.setInt(2, numid);
  			preparedStatement.executeUpdate();
  		}catch(Exception e) {
  			
  		}
  		connexion.closeConnexion();
      }
      
      public void clearnotification(int numid) {
      	   connexion.createConnexion();
     		try {
     			PreparedStatement preparedStatement=connexion.con.prepareStatement("update client set notification='notification:<br>' where(numeroIdentifient=? and etat='client');");
     			
     			preparedStatement.setInt(1, numid);
     			preparedStatement.executeUpdate();
     		}catch(Exception e) {
     			
     		}
     		connexion.closeConnexion();
         }
      public ArrayList<Reservation> ListReservation(){
  		ArrayList<Reservation> res= new ArrayList<>();
  		connexion.createConnexion();
  		try {
  			PreparedStatement  preparedStatement = Connexion.con.prepareStatement("select * from reservation;");
  			Connexion.r=preparedStatement.executeQuery();
  			while(Connexion.r.next()){
  				Reservation r=new Reservation();
  				r.setDateDebut(Connexion.r.getString("dateDebut"));
  				r.setDatefin(Connexion.r.getString("dateFin"));
  				r.setEtat(Connexion.r.getString("etat"));
  				r.setHeureDebut(Connexion.r.getString("heureDebut"));
  				r.setHeureFin(Connexion.r.getString("heureFin"));
  				r.setIdReservation(connexion.r.getInt("idReservation"));
  				String mv=Connexion.r.getString("matriculeV");
  				if(mv!=null) {
  				    r.setMatricule(mv);
  				    r.setType("voiture");}
  				else {
  					String mb=Connexion.r.getString("matriculeB");
  				   if(mb!=null) {
  				r.setMatricule(mb); r.setType("bus");
  				}else {
  				String mm=Connexion.r.getString("matriculeM");
  				r.setMatricule(mm);
  				 r.setType("moto");
  				}}
  				
  				
  				r.setNumeroIdentifient(Connexion.r.getInt("numeroIdentifient"));
  				r.setPrix(Connexion.r.getDouble("prix"));
  				res.add(r);
  			}
  			}catch(Exception e) {
  				
  			}
  		for(int i=0;i<res.size();i++) {
  			GestionGestionnaireTechnique ggt=new GestionGestionnaireTechnique();
  			GestionGestionnaire gg=new GestionGestionnaire();
  			Vehicule v=new Vehicule();
  			Client c=new Client();
  			if(res.get(i).getType()=="voiture") {
  			v=ggt.recherchevoiture(res.get(i).getMatricule());
  			res.get(i).setVehicule(v);}
  			if(res.get(i).getType()=="bus") {
  				v=ggt.recherchebus(res.get(i).getMatricule());
  				res.get(i).setVehicule(v);}
  			if(res.get(i).getType()=="moto") {
  				v=ggt.recherchemoto(res.get(i).getMatricule());
  				res.get(i).setVehicule(v);}
  			c=gg.rechercheClient(res.get(i).getNumeroIdentifient());
  			res.get(i).setClient(c);
  		}
  		connexion.closeConnexion();
  		return res;
  	}
	
}
