package com.tienda.entidades;

import javax.persistence.*;


@Entity
@Table(name = "tallasdisponibles")
public class TallaDisponible {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id_talla")
	private int id;
	private String nombre;

	@ManyToOne
	private Producto tallaProducto;

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

	public Producto getTallaProducto() {
		return tallaProducto;
	}

	public void setTallaProducto(Producto tallaProducto) {
		this.tallaProducto = tallaProducto;
	}

	

}
