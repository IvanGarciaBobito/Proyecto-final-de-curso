package com.tienda.entidades;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(name = "pedidos")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_pedido")
	private int id;
	private Date fechaPedido;
	private Date fechaEnvio;
	private Date fechaEntrega;
	private double importe;

	@ManyToOne
	private Usuario usuario;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "pedido")
	private List<PedidoProducto> listaPedidoProductos;
	
	private boolean comprado;
	
	public Pedido() {
		listaPedidoProductos = new ArrayList<PedidoProducto>();
		comprado = false;
	}

	
	public boolean isComprado() {
		return comprado;
	}


	public void setComprado(boolean comprado) {
		this.comprado = comprado;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getFechaPedido() {
		return fechaPedido;
	}

	public void setFechaPedido(Date fechaPedido) {
		this.fechaPedido = fechaPedido;
	}

	public Date getFechaEnvio() {
		return fechaEnvio;
	}

	public void setFechaEnvio(Date fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	public List<PedidoProducto> getListaPedidoProductos() {
		return listaPedidoProductos;
	}

	public void setListaPedidoProductos(List<PedidoProducto> listaPedidoProductos) {
		this.listaPedidoProductos = listaPedidoProductos;
	}

	public void addPedidoProducto(PedidoProducto pp) {
		listaPedidoProductos.add(pp);
		pp.setPedido(this);
	}

	public double importeTotal() {
		for (PedidoProducto pp : listaPedidoProductos) {
			importe = importe + pp.getSubtotal();
		}
		return importe;
	}

	
	

}
