package br.com.digitando.controllers;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.digitando.modells.Frase;

@Controller
public class Cadastro {

	@RequestMapping("/cadastro")
	public String cadastro() {
		return "cadastrarFrase";
	}
	
	@RequestMapping("/cadastrarFrase")
	public String cadastrarFrase(String frase){
		
		Frase texto = new Frase();
		texto.setFrase(frase);
		System.out.println(texto.getFrase());
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("digitando");
		EntityManager em = emf.createEntityManager();

		
		em.getTransaction().begin();
		em.persist(texto);
		em.getTransaction().commit();
		System.out.println("teste ");
		return "cadastrarFrase";
	}
}
