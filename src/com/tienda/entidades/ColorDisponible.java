package com.tienda.entidades;

import javax.persistence.*;


@Entity
@Table(name = "coloresdisponibles")
public class ColorDisponible {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_color")
	private int id;
	private String nombre;

	@ManyToOne
	private Producto colorProducto;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Producto getColorProducto() {
		return colorProducto;
	}

	public void setColorProducto(Producto colorProducto) {
		this.colorProducto = colorProducto;
	}

	



}
