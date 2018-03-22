package com.tienda.entidades;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;


@Entity
@Table(name="productos")
public class Producto {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id_producto")
	private int id;
	@Column(unique = true)
	private String nombre;
	private double precio;
	private String descripcion;
	private String imagenUrl;
	private String colorElegido;
	private String tallaElegida;
	
	@OneToMany(cascade= CascadeType.ALL, fetch= FetchType.LAZY, mappedBy= "colorProducto")
	private List<ColorDisponible> coloresDisponibles;
	@OneToMany(cascade= CascadeType.ALL, fetch= FetchType.LAZY, mappedBy= "tallaProducto")
	private List<TallaDisponible> tallasDisponibles;	
	@ManyToOne
	private Categoria categoria;
	@OneToMany(cascade= CascadeType.ALL, fetch= FetchType.LAZY, mappedBy= "producto")
	private List<PedidoProducto> listaPedidoProductos;
	
	public Producto() {
		listaPedidoProductos = new ArrayList<PedidoProducto>();
		coloresDisponibles = new ArrayList<ColorDisponible>();
		tallasDisponibles = new ArrayList<TallaDisponible>();
	}

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

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagenUrl() {
		return imagenUrl;
	}

	public void setImagenUrl(String imagenUrl) {
		this.imagenUrl = imagenUrl;
	}

	public void addColor(ColorDisponible color) {
		this.coloresDisponibles.add(color);
		color.setColorProducto(this);
	}
	
	public String getColorElegido() {
		return colorElegido;
	}

	public void setColorElegido(String colorElegido) {
		this.colorElegido = colorElegido;
	}

	public void addTalla(TallaDisponible talla) {
		this.tallasDisponibles.add(talla);
		talla.setTallaProducto(this);
	}
	
	public String getTallaElegida() {
		return tallaElegida;
	}

	public void setTallaElegida(String tallaElegida) {
		this.tallaElegida = tallaElegida;
	}

	
	public List<ColorDisponible> getColoresDisponibles() {
		return coloresDisponibles;
	}

	public void setColoresDisponibles(List<ColorDisponible> coloresDisponibles) {
		this.coloresDisponibles = coloresDisponibles;
	}

	public List<TallaDisponible> getTallasDisponibles() {
		return tallasDisponibles;
	}

	public void setTallasDisponibles(List<TallaDisponible> tallasDisponibles) {
		this.tallasDisponibles = tallasDisponibles;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public List<PedidoProducto> getListaPedidoProductos() {
		return listaPedidoProductos;
	}

	public void setListaPedidoProductos(List<PedidoProducto> listaPedidoProductos) {
		this.listaPedidoProductos = listaPedidoProductos;
	}



}
