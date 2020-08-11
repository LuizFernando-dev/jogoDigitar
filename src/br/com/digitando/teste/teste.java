package br.com.digitando.teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.digitando.modells.Frase;

public class teste {
	
	public static void main(String[] args) {
		
		Frase frase = new Frase();
		frase.setFrase("Lorem ipsum dolor sit amet, consectetur adipisicing elit,"
				+ " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("digitando");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(frase);
		
		em.getTransaction().commit();
		
	}

}
