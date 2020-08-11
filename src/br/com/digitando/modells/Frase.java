package br.com.digitando.modells;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Frase {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String Frase;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFrase() {
		return Frase;
	}
	public void setFrase(String frase) {
		Frase = frase;
	}
	

}
