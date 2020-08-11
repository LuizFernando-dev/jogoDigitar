package br.com.digitando.modells;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Player {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nome;
	private int pontos;
	@ManyToOne
	private Frase frase;
	
	public Player() {}
	
	public Player(String nome, int pontos) {
		this.nome = nome;
		this.pontos = pontos;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	
	public int getPontos() {
		return pontos;
	}
	
	public Frase getFrase() {
		return this.frase;
	}
	
	public void setFrase(Frase frase) {
		this.frase = frase;
	}
	

}
