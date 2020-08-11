package br.com.digitando.controllers;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.digitando.modells.Frase;
import br.com.digitando.modells.Player;

@Controller
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class HomeController {
	
	private Frase fraseGeral = new Frase();
	
	@RequestMapping("/home")
	public String Home() {
		return "redirect:/";
	}
	
	@RequestMapping("/")
	public ModelAndView home() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("digitando");
		EntityManager em = emf.createEntityManager();
		int cont = 0;
		List<Player> jogadores = new ArrayList<Player>();
		List<Player> lista = new ArrayList<Player>();
		
		if(fraseGeral.getId() > 1) {
			
			cont = fraseGeral.getId();
		}else {
			cont = 1;
		}
		
		jogadores = (List<Player>) em.createNativeQuery("select *from player").getResultList();
		
		System.out.println("conferindo minha ipotese : "+jogadores.size());
		for (int i = 1; i <= jogadores.size(); i++) {
			Player p = em.find(Player.class, i);
			if(p.getFrase().getId() == cont ) {
				lista.add(p);
			}
			
		}
		
		for (int i = 1; i < lista.size(); i++) {
			System.out.println("numero " +i+" da lista : "+lista.get(i).getNome() + " mais opontos "+
		lista.get(i).getPontos());
		}
		
		System.out.println("----------------------------------------------------");
		
		lista.sort(new Ordenador());
		
		for (int i = 1; i < lista.size(); i++) {
			System.out.println("numero " +i+" da lista : "+lista.get(i).getNome() + " mais opontos "+
					lista.get(i).getPontos());
		}
		
		
		List<Player> top = new ArrayList();
		
		if(lista.size() > 10) {
			for (int i = 1; i <= 10; i++) {
				top.add(lista.get(i));
				
			}
		}
		
		if(lista.size() > 10) {
			lista = top;
		}
		
		
		ModelAndView model = new ModelAndView("principal");
		System.out.println("o id da frase geral" + fraseGeral.getId());
		
		
		if(fraseGeral.getId() > 1) {
			model.addObject("frase",fraseGeral);
			model.addObject("jogadores", lista);
			return model;
		}
		
		Frase frase = em.find(Frase.class, 1);
		
		
		
		
		model.addObject("frase",frase);
		model.addObject("jogadores", lista);
		
		
		
		return model;
	}
	
	@RequestMapping("/trocaFrase")
	public ModelAndView trocaFrase(int id, String nome, int pontos) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("digitando");
		EntityManager em = emf.createEntityManager();
		ModelAndView troca = new ModelAndView("redirect:/");

		if(id >= 10) {
			fraseGeral.setId(1);
			Frase frase = em.find(Frase.class , fraseGeral.getId());
			fraseGeral = frase;
			troca.addObject("frase", frase);
			return troca;
		}
		
		Player player = new Player(nome, pontos);
		int idFrase = id + 1;
		
		Frase frase = em.find(Frase.class , idFrase);
		Frase ranking = em.find(Frase.class , id);
		player.setFrase(ranking);
		
		em.getTransaction().begin();
		em.persist(player);
		em.getTransaction().commit();
		
		fraseGeral = frase;
		
		troca.addObject("frase", frase);
		
		
		return troca;
	}
	
	@RequestMapping("/voltar")
	public ModelAndView voltar(int id) {
		if(id == 1) {
			fraseGeral.setId(2); 
		}
		
		int idFrase = id - 1;
		ModelAndView troca = new ModelAndView("redirect:/");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("digitando");
		EntityManager em = emf.createEntityManager();
		
		Frase frase = em.find(Frase.class , idFrase);
		
		fraseGeral = frase;
		
		troca.addObject("frase", frase);
		
		
		return troca;
	}
	
	
	@RequestMapping("/comoJogar")
	public String index() {
		return "index";
	}
	

}




class Ordenador implements Comparator<Player> {

    @Override
    public int compare(Player c1, Player c2) {

            if(c1.getPontos() < c2.getPontos()) {
                return 1;
            }

            if(c1.getPontos() > c2.getPontos()) {
                return -1;
            }

        return 0;
    }
}
