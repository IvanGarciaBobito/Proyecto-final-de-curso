package com.tienda.entidades;

import javax.persistence.*;


@Entity
@Table(name="pedidoproductos")
public class PedidoProducto {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id_pedido_producto")
	private int id;
	private int cantidad;
	private double subtotal;

	@ManyToOne
	private Pedido pedido;
	@ManyToOne
	private Producto producto;


	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	
	public double subtotal() {
		if(producto!=null) {
			this.subtotal= cantidad * producto.getPrecio();
			return this.subtotal;
		}
		return 0;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", cantidad=" + cantidad + ", subtotal=" + subtotal + ", pedido=" + pedido
				+ ", producto=" + producto + "]";
	}

	
	


}
