package com.tienda.entidades;

import javax.persistence.*;

@Entity
@Table(name= "direcciones")
public class Direccion {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id_direccion")
	private int id;
	private String direccion;
	private String poblacion;
	private String provincia;
	@Column(name ="codigo_postal")
	private String cogidoPostal;
	
	@OneToOne
	private Usuario usuario;
	
	public Direccion() {
		super();
	}

	public Direccion(String direccion, String poblacion, String cogidoPostal) {
		super();
		this.direccion = direccion;
		this.poblacion = poblacion;
		this.cogidoPostal = cogidoPostal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getPoblacion() {
		return poblacion;
	}

	public void setPoblacion(String poblacion) {
		this.poblacion = poblacion;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCogidoPostal() {
		return cogidoPostal;
	}

	public void setCogidoPostal(String cogidoPostal) {
		this.cogidoPostal = cogidoPostal;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	
	
}
